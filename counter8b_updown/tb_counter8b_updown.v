`timescale 1ns / 1ns
`include "counter8b_updown.v"

module tb_counter8b_updown();
	wire [7:0] p_count;
	reg p_clk, p_reset, p_dir;
	
	counter8b_updown p_counter8b_updown(.count(p_count), .clk(p_clk), .reset(p_reset), .dir(p_dir));
	
	initial begin
		p_clk = 1'b0;
		forever #10 p_clk = ~p_clk;
	end
	
	initial begin
		p_reset = 1'b1;
		#100 p_reset = 1'b0;
		#100 p_reset = 1'b1;
	end
	
	initial begin
		p_dir = 1'b1;
		#10 p_dir = 1'b0;
		#1000 p_dir = 1'b1;
	end
	
	initial 
		$monitor("time: %tns, ", $time, "clk = %b, reset = %b, dir = %b, count = %8b", p_clk, p_reset, p_dir, p_count);

	initial
		#2000 $stop;

endmodule
