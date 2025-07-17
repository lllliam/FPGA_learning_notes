`timescale 1ns/1ps

module fsm_tb();
	reg clk,rst_n;
	reg pi_money;
	
	wire po_cola;
	
	initial begin
		clk=0;
		rst_n=0;
		pi_money=0;
		#10
		rst_n=1;
	end
	
	always #10 pi_money={$random}%2;
	
	always #10 clk=~clk;
	
	fsm fsm_inst(
    .clk(clk),
	 .rst_n(rst_n),
    .pi_money(pi_money),
    
    .po_cola(po_cola)
);
	
	
endmodule