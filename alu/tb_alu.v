`timescale 1ns / 1ns
`include "alu.v"

module tb_ALU();
	
	wire [7:0] p_sum;
	wire p_c_out;
	reg [7:0] p_a; 
	reg [7:0] p_b;
	reg p_c_in;
	reg [2:0] p_oper;
	
	ALU p_alu(.c_out(p_c_out), .sum(p_sum), .oper(p_oper), .a(p_a), .b(p_b), .c_in(p_c_in));
	
	initial begin
		p_a = 8'b0000_1111;
		p_b = 8'b1111_0011;
		{p_c_in, p_oper} = 4'b0;
		forever #10 {p_c_in, p_oper} = {p_c_in, p_oper} + 1'b1;
	end

	initial begin
		#5000 $stop;
	end

	initial begin
		$monitor("time: %tns, ", $time, "a=%8b, b=%8b, c_in=%b, c_out=%b, sum=%8b", p_a, p_b, p_c_in, p_c_out, p_sum);
	end
endmodule