`timescale 1ns/1ps

module flow_led_tb();
    reg clk,rst_n;
	 reg key;

	 wire [3:0]led;

    
    initial begin
        rst_n=0;
        clk=0;
		  key=1;
        #30
        rst_n=1;
		  #200
		  key=0;
    end
    
    always #20 clk=~clk;
	 
	 flow_led
	#(
		.CNT_MAX(32'd24_9)
	)
	flow_led_inst(
    .clk(clk),
	 .rst_n(rst_n),
    .key(key),
	 
    .led(led)
	);

    
endmodule
