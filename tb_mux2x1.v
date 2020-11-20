`timescale 10ns / 1ns
`include "mux2x1.v"

module tb_mux2x1();

wire p_dout;
reg [1:0] p_din;
reg p_sel;

initial
begin
	p_sel = 1'b0;
	p_din = 2'b00;
	#10 p_din = 2'b01;
	#10 p_din = 2'b10;
	#10 p_din = 2'b11;
	#10 p_sel = 1'b1;
	#10 p_din = 2'b10;
	#10 p_din = 2'b01;
	#10 p_din = 2'b00;
end

mux2x1 mux(p_dout, p_sel, p_din);

initial
	$monitor("time: %tns, ", $time, "din = %2b, sel = %b, dout = %b", p_din, p_sel, p_dout);

endmodule
