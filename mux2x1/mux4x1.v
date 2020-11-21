`timescale 10ns / 1ns
`include "mux2x1.v"

module mux4x1(dout, sel, din);

output dout;
input [1:0] sel;
input [3:0] din;

wire lo, hi;

mux2x1 mux2x1_1(lo, sel[0], din[1:0]);
mux2x1 mux2x1_2(hi, sel[0], din[3:2]);
mux2x1 mux2x1_3(dout, sel[1], {hi, lo});

endmodule