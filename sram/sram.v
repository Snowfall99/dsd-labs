`timescale 1ns / 1ns

module sram(dout, din, addr, wr, rd, cs);
	
	output reg [7:0] dout;
	input [7:0] din;
	input [7:0] addr;
	input wr, rd, cs;
	
	reg [7:0] mem [255:0];
	
	always @(*) begin
		if (cs)
			case ({wr, rd})
				2'b10: mem[addr] <= din;
				2'b01: dout <= mem[addr];
				default: ;
			endcase
	end
endmodule