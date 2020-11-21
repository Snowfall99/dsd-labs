`timescale 10 ns / 1 ns

module comb_dataflow(Y, A, B, C, D);
output Y;
input A, B, C, D;
assign Y = (~(A | D)) & (B & C & (~D));

endmodule
