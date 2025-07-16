`timescale 1ns/1ps

module clkdiv_cnt_c_tb();
    reg clk,rst_n;
    
    wire clkdiv_7;
    
    initial begin
        rst_n=0;
        clk=0;
        #20
        rst_n=1;
    end
    
    always #20 clk=~clk;
    
    
    
    clkdiv_cnt_c clkdiv_cnt_c_inst(
        .clk        (clk),
        .rst_n      (rst_n),
    
        .clkdiv_7   (clkdiv_7)
    );
    
endmodule