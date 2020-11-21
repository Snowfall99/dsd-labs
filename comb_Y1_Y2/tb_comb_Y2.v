`timescale 10ns / 1ns
`include "comb_Y2.v"

module tb_comb_Y2();

wire p_Y;
reg p_A, p_B, p_C, p_D;

initial 
begin
{p_A, p_B, p_C, p_D} = 4'b0;
#10 {p_A, p_B, p_C, p_D} = {p_A, p_B, p_C, p_D} + 1'b1;
#10 {p_A, p_B, p_C, p_D} = {p_A, p_B, p_C, p_D} + 1'b1;
#10 {p_A, p_B, p_C, p_D} = {p_A, p_B, p_C, p_D} + 1'b1;
#10 {p_A, p_B, p_C, p_D} = {p_A, p_B, p_C, p_D} + 1'b1;
#10 {p_A, p_B, p_C, p_D} = {p_A, p_B, p_C, p_D} + 1'b1;
#10 {p_A, p_B, p_C, p_D} = {p_A, p_B, p_C, p_D} + 1'b1;
#10 {p_A, p_B, p_C, p_D} = {p_A, p_B, p_C, p_D} + 1'b1;
#10 {p_A, p_B, p_C, p_D} = {p_A, p_B, p_C, p_D} + 1'b1;
#10 {p_A, p_B, p_C, p_D} = {p_A, p_B, p_C, p_D} + 1'b1;
#10 {p_A, p_B, p_C, p_D} = {p_A, p_B, p_C, p_D} + 1'b1;
#10 {p_A, p_B, p_C, p_D} = {p_A, p_B, p_C, p_D} + 1'b1;
#10 {p_A, p_B, p_C, p_D} = {p_A, p_B, p_C, p_D} + 1'b1;
#10 {p_A, p_B, p_C, p_D} = {p_A, p_B, p_C, p_D} + 1'b1;
#10 {p_A, p_B, p_C, p_D} = {p_A, p_B, p_C, p_D} + 1'b1;
#10 {p_A, p_B, p_C, p_D} = {p_A, p_B, p_C, p_D} + 1'b1;
end

comb_Y2 comb_y2(p_Y, p_A, p_B, p_C, p_D);

initial
$monitor("time: %tns, ", $time, "ABCD = %4b, Y2 = %b", {p_A, p_B, p_C, p_D}, p_Y);

endmodule