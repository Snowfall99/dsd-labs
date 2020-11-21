`timescale 1ns / 1ns

module shift_counter(count, clk, reset);
	
	output reg [7:0] count;
	input clk, reset;

	reg dir;
	reg [1:0] cnt;
	
	always @(posedge clk) begin
		if (reset) begin
			count <= 8'b1;
			cnt <= 2'b0;
			dir <= 1'b1;
		end else begin
			if (!dir) begin 
				if (count == 8'b1) begin 
					dir <= 8'b1;
					cnt <= 2'b0;
				end else count <= count >> 1;
			end else begin
				if (cnt == 2'b11) begin 
					if (count == 8'b1000_0000) dir <= 1'b0;
					else count <= count << 1;
				end else begin
					cnt <= cnt + 1;
					count <= count;
				end
			end
		end
	end
endmodule