`timescale 1ns/1ps
`define CYCLE       5.0     // CLK period.
`define HCYCLE      (`CYCLE/2)
`define MAX_CYCLE   100000
`define RST_DELAY   2
`define INFILE     "./pattern/indata0.dat"
`define CMDFILE    "./pattern/cmd0.dat"
`define SPFILE     "./pattern/sp0.dat"
`define OUTFILE    "./pattern/outdata0.dat"
`define EMPTYFILE  "./pattern/empty0.dat"
`define FULLFILE   "./pattern/full0.dat"
`define ERRORFILE  "./pattern/error0.dat"
`define PAT_NUM 200


module testbed;

reg         clk, rst_n;
reg  [7:0]  data_in;
reg  [1:0]  cmd;
wire [2:0]  sp;
wire [7:0]  data_out;
wire        empty;
wire        full;
wire        error;


reg  [7:0]  indata_mem   [0:`PAT_NUM-1];
reg  [1:0]  cmd_mem      [0:`PAT_NUM-1];
reg  [2:0]  sp_mem       [0:`PAT_NUM-1];
reg  [7:0]  outdata_mem  [0:`PAT_NUM-1];
reg         empty_mem    [0:`PAT_NUM-1];
reg         full_mem     [0:`PAT_NUM-1];
reg         error_mem    [0:`PAT_NUM-1];

integer i;
reg current_error;
integer pattern_cnt;
integer output_error;
reg output_end;

// Write out waveform file
initial begin
  $fsdbDumpfile("stack.fsdb");
  $fsdbDumpvars(0, "+mda");
end

stack u_stack (
	.clk       (clk),
	.rst_n     (rst_n),
	.data_in   (data_in),
	.cmd       (cmd),
    .sp        (sp),
	.data_out  (data_out),
	.empty     (empty),
	.full      (full),
	.error     (error)
);

// Read in test pattern and golden pattern
initial $readmemb(`INFILE,    indata_mem);
initial $readmemb(`CMDFILE,   cmd_mem);
initial $readmemb(`SPFILE,    sp_mem);
initial $readmemb(`OUTFILE,   outdata_mem);
initial $readmemb(`EMPTYFILE, empty_mem);
initial $readmemb(`FULLFILE,  full_mem);
initial $readmemb(`ERRORFILE, error_mem);

// Clock generation
initial clk = 1'b0;
always #(`HCYCLE) clk = ~clk;

// Reset generation
initial begin
    rst_n = 1; # (0.25 * `CYCLE);
    rst_n = 0; # ((`RST_DELAY - 0.25) * `CYCLE);
    rst_n = 1; # ((`RST_DELAY) * `CYCLE);
    # (`MAX_CYCLE * `CYCLE);
    $display("Error! Runtime exceeded!");
    $finish;
end


// Input Feeding and Output Comparison
initial begin
    data_in = 8'bxxxx_xxxx;
    cmd = 2'bxx;
    output_error = 0;
    output_end = 0;
    # (2 * (`RST_DELAY) * `CYCLE);
    for (pattern_cnt = 0; pattern_cnt < `PAT_NUM; pattern_cnt = pattern_cnt + 1)begin
        @(negedge clk);
        cmd = cmd_mem[pattern_cnt];
        data_in = indata_mem[pattern_cnt];
        # (0.99 *  `CYCLE);
        current_error = 0;
        $display("	--------------------------------------------------------------------------------------  ");
        $display("                   Pattern Number = %4d", pattern_cnt);
        $display("                   Operation      = %4d", cmd);
        if (sp_mem[pattern_cnt] !== sp) begin
            $display("                   Stack Pointer Wrong! Golden = %4d ,Yours = %4d  ", sp_mem[pattern_cnt], sp);
            current_error = 1;
        end
        if (outdata_mem[pattern_cnt] !== data_out) begin
            $display ("                   Output Data Wrong!   Golden = %4d ,Yours = %4d  ", outdata_mem[pattern_cnt], data_out);
            current_error = 1;
        end        
        if (empty_mem[pattern_cnt] !== empty) begin
            $display ("                   Empty Status Wrong!  Golden = %4d ,Yours = %4d  ", empty_mem[pattern_cnt], empty);
            current_error = 1;
        end
        if (full_mem[pattern_cnt] !== full) begin
            $display ("                   Full Status Wrong!   Golden = %4d ,Yours = %4d  ", full_mem[pattern_cnt], full);
            current_error = 1;
        end        
        if (error_mem[pattern_cnt] !== error) begin
            $display ("                   Error Status Wrong!  Golden = %4d ,Yours = %4d  ", error_mem[pattern_cnt], error);
            current_error = 1;
        end
        if (current_error === 0)
            $display ("                   Pass!!                                 ");
        else
            output_error = output_error + 1;
		$display ("	--------------------------------------------------------------------------------------  \n");
    end
    output_end = 1;
end


// Print Results
initial begin
    wait(output_end);
    if (output_error === 0) begin
        $system("python ./show_prof.py");
        $display("	**************************************************************************************  ");
        $display("	*                                                                                    *  ");
        $display("	*                                   Congratulations!!                                *  ");
        $display("	*                                                                                    *  ");
        $display("	*                                   Simulation PASS!!                                *  ");
        $display("	*                                                                                    *  ");
        $display("	**************************************************************************************  ");
        $finish;
    end 
    else begin
        $display("	**************************************************************************************  ");
        $display("	*                                                                                    *  ");
        $display("	*                                      Wrong!!                                       *  ");
        $display("	*                                                                                    *  ");
        $display("	*                             Please check your design!!                             *  ");
        $display("	*                                                                                    *  ");
        $display("	**************************************************************************************  ");
        $display("	                          Totally has %d errors                                       \n", output_error);
        $finish;
    end
end

endmodule