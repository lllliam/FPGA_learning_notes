module key_filter(
    input clk,rst_n,
    input key,
    
    output reg key_flag
);
    reg [31:0] cnt;
    
    always @(posedge clk or negedge rst_n)begin
        if(~rst_n)
            cnt<=0;
        else if(!key)begin
            if(cnt==999_999)
                cnt<=999_999;
            else 
                cnt=cnt+1;
        end else cnt=0;
    end
    
    always @(posedge clk or negedge rst_n)begin
        if(~rst_n)
            key_flag=0;
        else if(!key)begin
            if(cnt==999_998)
                key_flag=1;
            else
                key_flag=0;
        end
    end

endmodule