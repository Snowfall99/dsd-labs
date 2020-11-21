`timescale 10 ns / 1 ns

module comb_Y2(Y, A, B, C, D);

input Y, A, B, C, D;

assign Y = B ? ~(A & C) : (A & C & D);

endmodule
