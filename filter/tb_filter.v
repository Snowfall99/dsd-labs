`timescale 1ns / 1ns
`include "filter.v"

module tb_filter();

wire p_sig_out;
reg p_clock, p_reset, p_sig_in;

filter p_filter(.sigout(p_sig_out), .clock(p_clock), .reset(p_reset), .sig_in(p_sig_in));

initial
begin
	p_clock = 1'b0;
	forever 
		#10 p_clock = ~p_clock;
end

initial
begin
	p_reset = 1'b1;
	#100 p_reset = 1'b0;
	#100 p_reset = 1'b1;
end

initial
begin
	p_sig_in = 1'b1;
	forever
		#10 p_sig_in = $random % 2;
end

initial
	$monitor("time: %tns, ", $time, "sig_in = %b, reset = %b, clock = %b, sig_out = %b", p_sig_in, p_reset, p_clock, p_sig_in);

endmodule
