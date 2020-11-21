`timescale 1ns / 1ns

module counter8b_updown(count, clk, reset, dir);

	output reg [7:0] count;
	input clk, reset, dir;

	always @(negedge reset) begin
		count <= 8'b0;
	end

	always @(posedge clk) begin
		case (dir)
			1'b1: count <= count + 1'b1;
			1'b0: count <= count - 1'b1;
			default: count <= 8'b0;
		endcase
	end

endmodule