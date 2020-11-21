`timescale 10ns / 1ns
`include "dec_counter.v"

module tb_dec_counter();

wire [3:0] p_count;
reg p_reset, p_clk;

dec_counter p_dec_counter(.count(p_count), .clk(p_clk), .reset(p_reset));

initial
begin
p_clk = 1'b0;
forever
#5 p_clk = ~p_clk;
end

initial
begin
p_reset = 1'b1;
#5 p_reset = 1'b0;
#5 p_reset = 1'b1;
#500 p_reset = 1'b0;
#10 $stop; 
end

initial
$monitor("time: %tns, ", $time, "count = %4b", p_count);
endmodule