`timescale 1ns / 1ns
`include "seq_detect.v"

module tb_seq_detect();
	wire p_flag;
	reg p_clk;
	reg p_rst_n;
	
	reg [2:0] p_buffer;
	reg p_din;
	
	seq_detect p_seq_detect(.flag(p_flag), .din(p_din), .clk(p_clk), .rst_n(p_rst_n));

	initial begin
		p_clk = 1'b0;
		forever 
			#10 p_clk = ~p_clk;
	end
		
	initial begin
		p_rst_n = 1'b1;
		#5 p_rst_n = 1'b0;
		#5 p_rst_n = 1'b1;
	end
	
	initial begin 
		{p_buffer, p_din} = 4'bxxx1;
		#10 {p_buffer, p_din} = 4'bxx10;
		#10 {p_buffer, p_din} = 4'bx101;
		#10 {p_buffer, p_din} = 4'b1011;
		#10 {p_buffer, p_din} = 4'b0110;
		#10 {p_buffer, p_din} = 4'b1101;
		#10 {p_buffer, p_din} = 4'b1011;
		#10 {p_buffer, p_din} = 4'b0111;
		#10 {p_buffer, p_din} = 4'b1110;
		#10 {p_buffer, p_din} = 4'b1101;
		#10 {p_buffer, p_din} = 4'b1010;
	end
endmodule
	
