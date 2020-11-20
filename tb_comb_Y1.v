`timescale 10ns / 1ns
`include "comb_Y1.v"

module tb_comb_Y1();

reg p_A, p_B, p_C;
wire p_Y;

comb_Y1 comb_y1(p_Y, p_A, p_B, p_C);

initial
begin
{p_A, p_B, p_C} = 3'b0;
#10 {p_A, p_B, p_C} = {p_A, p_B, p_C} + 1;
#10 {p_A, p_B, p_C} = {p_A, p_B, p_C} + 1;
#10 {p_A, p_B, p_C} = {p_A, p_B, p_C} + 1;
#10 {p_A, p_B, p_C} = {p_A, p_B, p_C} + 1;
#10 {p_A, p_B, p_C} = {p_A, p_B, p_C} + 1;
#10 {p_A, p_B, p_C} = {p_A, p_B, p_C} + 1;
#10 {p_A, p_B, p_C} = {p_A, p_B, p_C} + 1;
#10 $stop;
end

initial
$monitor("time: %tns, ", $time, "ABC = %3b, Y = %b", {p_A, p_B, p_C}, p_Y);

endmodule