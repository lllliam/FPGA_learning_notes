module flow_led
#(
    parameter CNT_MAX=32'd24_999_999
)
(
    input clk,rst_n,
    input key,
    
    output reg [3:0] led
);
    reg [31:0] cnt;
    reg [2:0] choose_led;
    
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)
            cnt<=0;
        else if(!key)begin
            if(cnt==CNT_MAX)
                cnt<=0;
            else
                cnt<=cnt+1;
        end else cnt=0;
    end
    
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)
		  choose_led<=0;
        else if(!key)begin
		if(choose_led==4)
			choose_led<=0;
		else if(cnt==CNT_MAX)
			choose_led<=choose_led+1;
	end else choose_led<=0;
    end
    
    
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)
            led=~4'b0000;
        else if(!key)
		case(choose_led)
			0:led<=~4'b0001;
			1:led<=~4'b0010;
			2:led<=~4'b0100;
			3:led<=~4'b1000;
			default:led<=4'b0000;
		endcase
	else led<=~4'b0000;
    end

endmodule
