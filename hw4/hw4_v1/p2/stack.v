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


// Sequential Part
always@(posedge clk or negedge rst_n)begin
    if (~rst_n) begin
    // Reset Operation
    end
    else begin
    // Normal Operation
    end
end
endmodule