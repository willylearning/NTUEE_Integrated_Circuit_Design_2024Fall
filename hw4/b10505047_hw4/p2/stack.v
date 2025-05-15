module stack ( //DO NOT modify interface      
	input         clk,
	input         rst_n,
	input  [7:0]  data_in,
	input  [1:0]  cmd,
    output [2:0]  sp,
    output [7:0]  data_out,
    output        empty,
    output        full,
    output        error
);

    // TODO: RTL-level Design of your stack //
    reg [2:0]  sp_reg;
    reg [7:0]  data_out_reg;
    reg        empty_reg;
    reg        full_reg;
    reg        error_reg;
    reg [7:0]  stack_mem [7:0]; // 8x8 memory for stack

     // Assign output signals to registers
    assign sp       = sp_reg;
    assign data_out = data_out_reg;
    assign empty    = empty_reg;
    assign full     = full_reg;
    assign error    = error_reg;

    // Sequential Part
    always@(posedge clk or negedge rst_n)begin
        if (~rst_n) begin
        // Reset Operation
            sp_reg <= 3'b0;
            data_out_reg <= 8'b0;
            empty_reg <= 1'b1;
            full_reg <= 1'b0;
            error_reg <= 1'b0;
        end
        else begin
        // Normal Operation
            case (cmd)
                2'b00: begin // No operation
                    data_out_reg <= 8'b0;
                    error_reg <= 1'b0;
                end
                2'b01: begin // Clear
                    sp_reg <= 3'b0;
                    data_out_reg <= 8'b0;
                    empty_reg <= 1'b1;
                    full_reg <= 1'b0;
                    error_reg <= 1'b0;
                end
                2'b10: begin // Push
                    if (full_reg) begin
                        error_reg <= 1; // Error if stack is full
                    end
                    else begin
                        sp_reg <= sp_reg + 3'b1;
                        stack_mem[sp_reg] <= data_in; // Push data_in into stack_mem[sp_reg]
                        empty_reg <= 1'b0;
                        full_reg <= (sp_reg == 3'b111); // Stack becomes full if original sp is 7 and then push
                        error_reg <= 1'b0;
                    end
                    data_out_reg <= 8'b0; // data_out is 0 for push
                end
                2'b11: begin // Pop
                    if (empty_reg) begin
                        error_reg <= 1'b1; // Error if stack is empty
                        data_out_reg <= 8'b0;
                    end 
                    else begin
                        sp_reg <= sp_reg - 3'b1; 
                        data_out_reg <= stack_mem[sp_reg - 3'b1]; // Push stack_mem[sp_reg - 3'b1] into data_out_reg
                        empty_reg <= (sp_reg == 3'b1); // Stack becomes empty if original sp is 1 and then pop 
                        full_reg <= 1'b0;
                        error_reg <= 1'b0;
                    end
                end
                default: begin
                    data_out_reg <= 8'b0;
                    error_reg <= 1'b0;
                end
            endcase
        end
    end

endmodule