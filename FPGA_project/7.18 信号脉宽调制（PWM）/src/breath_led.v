module breath_led
#(
    parameter CNT_MAX_1us=6'd49
)
(
    input clk,rst_n,
    
    output reg [3:0] led
);

    reg [5:0] cnt_us;
	reg [9:0] cnt_ms,cnt_s;
    
    //PWM:
    //cnt 1us
    always @(posedge clk or negedge rst_n)begin
        if(~rst_n)
            cnt_us<=0;
        else if(cnt_us==CNT_MAX_1us)
            cnt_us<=0;
        else 
            cnt_us<=cnt_us+1;
    end
    
    //cnt 1ms
    always @(posedge clk or negedge rst_n)begin
        if(~rst_n)
            cnt_ms<=0;
        else if((cnt_ms==10'd999)&&(cnt_us==CNT_MAX_1us))
            cnt_ms<=0;
        else if(cnt_us==CNT_MAX_1us)
            cnt_ms<=cnt_ms+1;
        else
            cnt_ms<=cnt_ms;
    end
    
    //cnt 1s
    always @(posedge clk or negedge rst_n)begin
        if(~rst_n)
            cnt_s<=0;
        else if((cnt_s==10'd999)&&(cnt_ms==10'd999)&&(cnt_us==CNT_MAX_1us))
            cnt_s<=0;
        else if((cnt_ms==10'd999)&&(cnt_us==CNT_MAX_1us))
            cnt_s<=cnt_s+1;
        else
            cnt_s<=cnt_s;
    end
    
    //两个状态的状态机，0表示由弱到强，1表示由强到弱
    reg led_state;    
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)
            led_state<=0;
        else if((cnt_s==10'd999)&&(cnt_ms==10'd999)&&(cnt_us==CNT_MAX_1us))
            led_state<=~led_state;
        else
            led_state<=led_state;
    end
    
    
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)
            led=4'b1111;
        else case(led_state)
            0:  if(cnt_s>cnt_ms)
                    led<=4'b0000;
                else
                    led<=4'b1111;
            1:  if(cnt_s>cnt_ms)
                    led<=~4'b0000;
                else
                    led<=~4'b1111;
        endcase
    end

endmodule