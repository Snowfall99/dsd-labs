`timescale 10ns / 1ns
`include "Encoder8x3.v"

module tb_Encoder8x3();

reg [7:0] p_data;
wire [2:0] p_code;

Encoder8x3 encoder8x3(.code(p_code), .data(p_data));

initial
begin
	p_data = 8'b0000_0001;
	#10 p_data = p_data << 1;
	#10 p_data = p_data << 1;
	#10 p_data = p_data << 1;
	#10 p_data = p_data << 1;
	#10 p_data = p_data << 1;
	#10 p_data = p_data << 1;
	#10 p_data = p_data << 1;
	#10 $stop;
end

initial
	$monitor("time: %tns,", $time, "data = %8b, code = %3b", p_data, p_code);

endmodule