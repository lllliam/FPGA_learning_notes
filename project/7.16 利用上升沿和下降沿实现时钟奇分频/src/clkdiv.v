module clkdiv_cnt_c(
    input wire clk,rst_n,
    
    output wire clkdiv_7
);

	reg [3:0] cnt1,cnt2;
     
    reg clk1,clk2;

    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)
            cnt1=0;
        else if(cnt1==6)
            cnt1=0;
        else
            cnt1=cnt1+1;
    end
    
    always @ (negedge clk or negedge rst_n) begin
        if(!rst_n)
            cnt2=0;
        else if(cnt2==6)
            cnt2=0;
        else
            cnt2=cnt2+1;
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)
            clk1=0;
        else if(cnt1==3 || cnt1==6)
            clk1=~clk1;
			else clk1=clk1;
    end
    
    always @ (negedge clk or negedge rst_n) begin
        if(!rst_n)
            clk2=0;
        else if(cnt2==3 || cnt2==6)
            clk2=~clk2;
			else clk2=clk2;
				
    end
    

    assign    clkdiv_7= clk1 | clk2;


endmodule