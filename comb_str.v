`timescale 10ns / 1ns

module comb_str(Y, A, B, C, D);
output Y;
input A, B, C, D;

wire out1, out2, out3, out4;

not u1(out2, D);
or u3(out1, A, D);
not u2(out3, out1);
and u4(out4, B, C, out2);
and u5(Y, out3, out4);

endmodule