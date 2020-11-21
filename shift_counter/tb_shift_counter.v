`timescale 1ns / 1ns
`include "shift_counter.v"

module tb_shift_counter();
	wire [7:0] p_count;
	reg p_clk, p_reset;

	shift_counter p_shift_counter(.count(p_count), .clk(p_clk), .reset(p_reset));
	
	initial begin
		p_clk = 1'b0;
		forever #10 p_clk = ~p_clk;
	end

	initial begin
		p_reset = 1'b0;
		#200 p_reset = 1'b1;
		#100 p_reset = 1'b0;
		#3000 p_reset = 1'b1;
		#200 p_reset = 1'b0;
	end

	initial begin
		#5000 $stop;
	end

	initial begin
		$monitor("time: %tns  ", $time, "reset=%b, count=%8b", p_reset, p_count);
	end
endmodule
	
	