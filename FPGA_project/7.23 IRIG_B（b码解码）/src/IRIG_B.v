module IRIG_B(
    input clk,rst_n,
    input b_code,
    
    output reg [3:0] sec_01 ,
    output reg [2:0] sec_10 ,
    output reg [3:0] min_01 ,
    output reg [2:0] min_10 ,
    output reg [3:0] hou_01 ,
    output reg [1:0] hou_10 ,
    output reg [3:0] day_001,
    output reg [3:0] day_010,
    output reg [1:0] day_100,
    output reg [3:0] year_01,
    output reg [3:0] year_10
);
    
    parameter CNT_MAX_10ms=21'd1_249_999;
    
    reg [31:0] cnt;
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)
            cnt=0;
        else if(cnt==CNT_MAX_10ms)
            cnt=0;
        else cnt=cnt+1;
    end
    
    reg [7:0] cnt_10ms;
    reg double_p_chick;                                 //后面才赋值，但这里用到了需要先声明
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)
            cnt_10ms=0;
        else if(double_p_chick==1)    //检测到双p时从1开始计数，因为双p中后面的p占了一个码元
            cnt_10ms=1;
        else if((cnt_10ms==99)&&(cnt==CNT_MAX_10ms))
            cnt_10ms=0;
        else if(cnt==CNT_MAX_10ms)
            cnt_10ms=cnt_10ms+1;
        else cnt_10ms=cnt_10ms;
    end
    
    //在每个码元周期内计算码元位宽
    reg [20:0] cnt_wide;
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)
            cnt_wide=0;
        else if(cnt==0)
            cnt_wide=0;
        else if(b_code==1)
            cnt_wide=cnt_wide+1;
        else cnt_wide=cnt_wide;
    end
    
    //根据码元位宽将其翻译成0、1、p,并将其状态保持一个码元周期
    reg flag,p;
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            flag=0;
            p=0;
        end else if(cnt==CNT_MAX_10ms)begin
            if((cnt_wide+1)*10/(CNT_MAX_10ms+1)==8)
                p=1;
            if((cnt_wide+1)*10/(CNT_MAX_10ms+1)==2)begin
                flag=0;
                p=0;
            end else if((cnt_wide+1)*10/(CNT_MAX_10ms+1)==5)begin
                flag=1;
                p=0;
            end else begin
                flag=flag;
                p=p;
            end
        end
    end
    
    //将p信号延时3拍，用于双p检测
    reg l1,l2,p_delay;
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)
            l1=0;
        else l1=p;
    end
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)
            l2=0;
        else l2=l1;
    end

    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)
            p_delay=0;
        else p_delay=l2;
    end
    
    //双p检测
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)
            double_p_chick=0;
        else if((cnt==0)&&(p==1)&&(p_delay==1))
                double_p_chick=1;
        else double_p_chick=0;
    end
    
    //给年月日时分秒赋值
    reg default_item;//防止产生锁存器
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            sec_01 =0;
            sec_10 =0;
            min_01 =0;
            min_10 =0;
            hou_01 =0;
            hou_10 =0;
            day_001=0;
            day_010=0;
            day_100=0;
            year_01=0;
            year_10=0;
        end else case(cnt_10ms/10)
            0:  if(((cnt_10ms%10)>=2)&&((cnt_10ms%10)<=5))
                    sec_01[cnt_10ms%10-2]=flag;
                else if(((cnt_10ms%10)>=7)&&((cnt_10ms%10)<=9))
                    sec_10[cnt_10ms%10-7]=flag;
            1:  if(((cnt_10ms%10)>=1)&&((cnt_10ms%10)<=4))
                    min_01[cnt_10ms%10-1]=flag;
                else if(((cnt_10ms%10)>=6)&&((cnt_10ms%10)<=8))
                    min_10[cnt_10ms%10-6]=flag;
            2:  if(((cnt_10ms%10)>=1)&&((cnt_10ms%10)<=4))
                    hou_01[cnt_10ms%10-1]=flag;
                else if(((cnt_10ms%10)>=6)&&((cnt_10ms%10)<=7))
                    hou_10[cnt_10ms%10-6]=flag;
            3:  if(((cnt_10ms%10)>=1)&&((cnt_10ms%10)<=4))
                    day_001[cnt_10ms%10-1]=flag;
                else if(((cnt_10ms%10)>=6)&&((cnt_10ms%10)<=9))
                    day_010[cnt_10ms%10-6]=flag;
            4:  if(((cnt_10ms%10)>=1)&&((cnt_10ms%10)<=2))
                    day_100[cnt_10ms%10-1]=flag;
            5:  if(((cnt_10ms%10)>=1)&&((cnt_10ms%10)<=4))
                    year_01[cnt_10ms%10-1]=flag;
                else if(((cnt_10ms%10)>=6)&&((cnt_10ms%10)<=9))
                    year_10[cnt_10ms%10-6]=flag;
            default : default_item=0;
        endcase
    end
    

endmodule