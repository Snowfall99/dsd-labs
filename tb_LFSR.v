`timescale 10ns / 1ns
`include "LFSR.v"

module tb_LFSR();

wire [1:26] p_q;
reg p_clk;
reg p_rst_n;
reg p_load;
reg [1:26] p_din;

LFSR lfsr(p_q, p_clk, p_rst_n, p_load, p_din);

initial 
begin
p_clk = 1'b0;
forever
#10 p_clk = ~p_clk;
end

initial 
begin
p_rst_n = 1'b0;
#5 p_rst_n = 1'b1;
end

initial
begin
p_din = 26'b1101_1001_0101_1010_1101_0110_01;
p_load = 1'b1;
#45 p_load = 1'b0;
end

initial
$monitor("time: %tns, ", $time, "q = %26b", p_q);

endmodule