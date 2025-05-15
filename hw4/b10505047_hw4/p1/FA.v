module FA_4bit( //DO NOT modify interface
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output       Cout,
    output [3:0] S
); 

    // TODO: gate-level 4bit full adder //
// Internal wires to connect carry outputs between 1-bit adders
wire C1, C2, C3;

// Instantiating 4 FA_1bit modules
FA_1bit fa0(.A(A[0]), .B(B[0]), .Cin(Cin), .Cout(C1), .S(S[0]));

FA_1bit fa1(.A(A[1]), .B(B[1]), .Cin(C1), .Cout(C2), .S(S[1]));

FA_1bit fa2(.A(A[2]), .B(B[2]), .Cin(C2), .Cout(C3), .S(S[2]));

FA_1bit fa3(.A(A[3]), .B(B[3]), .Cin(C3), .Cout(Cout), .S(S[3]));
endmodule

module FA_1bit(
    input  A,
    input  B,
    input  Cin,
    output Cout,
    output S
);

    // TODO: gate-level 1bit full adder //
and a1(a1_o, A, B);
and a2(a2_o, B, Cin);
and a3(a3_o, A, Cin);
or  o1(Cout, a1_o, a2_o, a3_o);
xor xr1(S, A, B, Cin);
endmodule