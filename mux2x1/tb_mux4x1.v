`timescale 10ns / 1ns
`include "mux4x1.v"

module tb_mux4x1();

reg [1:0] p_sel;
reg [3:0] p_din;
wire p_dout;

initial
begin
{p_sel, p_din} = 6'b0;
forever 
	#10 {p_sel, p_din} = {p_sel, p_din} + 1;
end

mux4x1 mux(p_dout, p_sel, p_din);

initial
	$monitor("time: %tns, ", $time, "din = %4b, sel = %2b, dout = %b", p_din, p_sel, p_dout);

endmodule
