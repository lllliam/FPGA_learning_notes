`timescale 1ns/1ps

module key_filter_tb();
    reg clk,rst_n;
    reg key;
    
    wire key_flag;
    
    initial begin
        rst_n=0;
        clk=0;
        key=1;
        #30
        rst_n=1;
		  #1111
		  key=0;
		  #2111
		  key=1;
		  #3111
		  key=0;
		  #4111
		  key=1;
		  #5111
		  key=0;
		  #30_000_000
		  key=1;
    end
    
    always #10 clk=~clk;
    
    key_filter key_filter_inst(
        .clk        (clk),
        .rst_n      (rst_n),
        .key        (key),
    
        .key_flag   (key_flag)
    );
    
endmodule