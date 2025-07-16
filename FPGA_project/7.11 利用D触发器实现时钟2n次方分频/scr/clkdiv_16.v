module clkdiv_16(
    input wire clk,rst_n,
    
    output wire clk_16

);
    wire l1,l2,l3;

    D_ff u1 (.clk(clk), .rst_n(rst_n), .D(~l1), .Q(l1));
    D_ff u2 (.clk(l1), .rst_n(rst_n), .D(~l2), .Q(l2));
    D_ff u3 (.clk(l2), .rst_n(rst_n), .D(~l3), .Q(l3));
	 D_ff u4 (.clk(l3), .rst_n(rst_n), .D(~clk_16), .Q(clk_16));

endmodule