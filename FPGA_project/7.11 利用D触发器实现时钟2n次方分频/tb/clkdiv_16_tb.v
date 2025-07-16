`timescale 1ns/1ps

module clkdiv_16_tb();

	reg clk,rst_n;
	
	wire clk_16;
	
	initial begin
		clk=0;
		rst_n=0;
		#10 rst_n=1;
	end
	
	always #10 clk=~clk;
	
	clkdiv_16 uut (.clk(clk), .rst_n(rst_n), .clk_16(clk_16));

endmodule