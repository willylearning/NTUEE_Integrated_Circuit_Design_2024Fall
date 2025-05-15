`timescale 1ns/100ps
`define CYCLE 10.0
`define HCYCLE (`CYCLE/2)

module testbed();
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    wire Cout;
    wire [3:0] S;

    integer error;

    FA_4bit FA(
        .A(A),
        .B(B),
        .Cin(Cin),
        .Cout(Cout),
        .S(S)
    );

    //dump waveform file
	initial begin 
		$fsdbDumpfile("FA.fsdb");
		$fsdbDumpvars(0, testbed, "+mda");
	end

    initial begin
        error = 0;
        
        // Test cases
        A = 4'b0000; B = 4'b0000; Cin = 0; #(`HCYCLE); // 0 + 0 + 0 = 0
        if(S !== 4'b0000 || Cout !== 1'b0) begin
            error = error + 1;
            $display("Error! Golden (S, Cout) = (%b, %b), Yours = (%b, %b)", 4'b0000, 1'b0, S, Cout);
        end

        #(`HCYCLE);
        A = 4'b0011; B = 4'b0001; Cin = 0; #(`HCYCLE); // 3 + 1 + 0 = 4
        if(S !== 4'b0100 || Cout !== 1'b0) begin
            error = error + 1;
            $display("Error! Golden (S, Cout) = (%b, %b), Yours = (%b, %b)", 4'b0100, 1'b0, S, Cout);
        end

        #(`HCYCLE);
        A = 4'b0111; B = 4'b0100; Cin = 0; #(`HCYCLE); // 7 + 4 + 0 = 11
        if(S !== 4'b1011 || Cout !== 1'b0) begin
            error = error + 1;
            $display("Error! Golden (S, Cout) = (%b, %b), Yours = (%b, %b)", 4'b1011, 1'b0, S, Cout);
        end

        #(`HCYCLE);
        A = 4'b0101; B = 4'b1000; Cin = 1; #(`HCYCLE); // 5 + 8 + 1 = 14
        if(S !== 4'b1110 || Cout !== 1'b0) begin
            error = error + 1;
            $display("Error! Golden (S, Cout) = (%b, %b), Yours = (%b, %b)", 4'b1010, 1'b0, S, Cout);
        end

        #(`HCYCLE);
        A = 4'b1010; B = 4'b0101; Cin = 1; #(`HCYCLE); // 10 + 5 + 1 = 16
        if(S !== 4'b0000 || Cout !== 1'b1) begin
            error = error + 1;
            $display("Error! Golden (S, Cout) = (%b, %b), Yours = (%b, %b)", 4'b0000, 1'b1, S, Cout);
        end

        #(`HCYCLE);
        A = 4'b1100; B = 4'b0101; Cin = 1; #(`HCYCLE); // 12 + 5 + 1 = 18
        if(S !== 4'b0010 || Cout !== 1'b1) begin
            error = error + 1;
            $display("Error! Golden (S, Cout) = (%b, %b), Yours = (%b, %b)", 4'b0010, 1'b1, S, Cout);
        end

        if(error === 0)begin
            $display("	*******************************               ");
			$display("	**                          **       |\__||  ");
			$display("	**    Congratulations !!    **      / O.O  | ");
			$display("	**                          **    /_____   | ");
			$display("	**    Simulation PASS!!     **   /^ ^ ^ \\  |");
			$display("	**                          **  |^ ^ ^ ^ |w| ");
			$display("	******************************   \\m___m__|_|");
        end
        else begin
            $display("	******************************               ");
			$display("	**                          **       |\__||  ");
			$display("	**    OOPS!!                **      / X,X  | ");
			$display("	**                          **    /_____   | ");
			$display("	**    Simulation Failed!!   **   /^ ^ ^ \\  |");
			$display("	**                          **  |^ ^ ^ ^ |w| ");
			$display("	******************************   \\m___m__|_|");
        end

        $finish;
    end
endmodule