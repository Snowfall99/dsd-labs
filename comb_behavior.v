`timescale 10ns / 1ns

module comb_behavior(Y, A, B, C, D);

output Y;
input A, B, C, D;

reg buffer;

always @(*)
buffer = ~(A | D) & (B & C & (~D));

assign Y = buffer;

endmodule