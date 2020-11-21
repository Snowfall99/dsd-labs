`timescale 10ns / 1ns

module comb_str(y, sel, A, B, C, D);

output y;
input sel, A, B, C, D;

wire in0, in1;

nand #(3) nand1(in0, A, B);
nand #(4) nand2(in1, C, D);

not not1(n_sel, sel);
and and1(y0, n_sel, in0);
and and2(y1, sel, in1);
or or1(y, y0, y1);

endmodule
