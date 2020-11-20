`timescale 10ns / 1ns
`include "ones_count.v"

module tb_ones_count();

wire [3:0] p_count;
reg [7:0] p_mask;
reg [7:0] p_dat_in;

initial
begin
p_mask = 8'b1;
p_dat_in = 8'b0;

forever
begin
#5 p_dat_in = p_dat_in | p_mask;
p_mask = p_mask << 1;
end

end

ones_count p_ones_count(.count(p_count), .dat_in(p_dat_in));

initial
	$monitor("time: %tns", $time, "dat_in = %8b, count = %4b", p_dat_in, p_count);

endmodule