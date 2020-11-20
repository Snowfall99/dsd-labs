`timescale 10ns / 1ns
`include "comb_str_8.v"

module tb_comb_str();

reg p_sel, p_a, p_b, p_c, p_d;
wire p_y;

comb_str p_comb_str(p_y, p_sel, p_a, p_b, p_c, p_d);

initial 
begin 
{p_sel, p_a, p_b, p_c, p_d} = 5'b0;
forever
#10 {p_sel, p_a, p_b, p_c, p_d} = {p_sel, p_a, p_b, p_c, p_d} + 1'b1;
end

initial
#500 $stop;

initial
$monitor("time: %tns", $time, "sel = %b, ABCD = %4b, Y = %b", p_sel, {p_a, p_b, p_c, p_d}, p_y);

endmodule