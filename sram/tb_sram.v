`timescale 1ns / 1ns
`include "sram.v"

module tb_sram();
	wire [7:0] p_dout;
	reg [7:0] p_din;
	reg [7:0] p_addr;
	reg p_wr, p_rd, p_cs;

	integer k;
	
	sram p_sram(.dout(p_dout), .din(p_din), .addr(p_addr), .wr(p_wr), .rd(p_rd), .cs(p_cs));
	
	initial begin
		p_cs = 1'b1;
		p_wr = 1'b1;
		p_rd = 1'b0;
		p_addr = 8'b0;
	
		for (k=0; k<256; k=k+1) begin:WRITE
			#10;
			p_addr = k;
			p_din = ($random) % 256;
		end

		#20 p_cs = 1'b0;
		#20 p_cs = 1'b1;
		p_wr = 1'b0;
		p_rd = 1'b1;
		
		for(k=0; k<256; k=k+1) begin:READ
			#10;
			p_addr = ($random) % 256;
		end
	end
	
	initial begin 
		$monitor("time: %tns, ", $time, "cs=%b, wr=%b, rd=%b, din=%8b, addr=%8b, dout=%8b", p_cs, p_wr, p_rd, p_din, p_addr, p_dout);
	end
endmodule