`timescale	1ns/1ps

module IRIG_B_tb ();
									   //125Mhz时钟计算时长
parameter   time_10ms = 32'd1249_999  ;//码元长度
parameter   time_8ms  = 32'd999_999   ;//P码高电平时间
parameter   time_5ms  = 32'd624_999   ;//1码高电平时间
parameter   time_2ms  = 32'd249_999   ;//0码高电平时间



reg    clk     ;//125Mhz时钟
reg    rst_n          ;
reg    ex_b_code      ;

wire [3:0] sec_01 ;
wire [2:0] sec_10 ;
wire [3:0] min_01 ;
wire [2:0] min_10 ;
wire [3:0] hou_01 ;
wire [1:0] hou_10 ;
wire [3:0] day_001;
wire [3:0] day_010;
wire [1:0] day_100;
wire [3:0] year_01;
wire [3:0] year_10;




initial
begin
    clk	=	1'b0	;	 
    rst_n     	=	1'b0	;	 
    ex_b_code 	=	1'b0	;	 
	#50_000
	rst_n     	=	1'b1	;
end


always #4	clk = ~clk	;




//定义100个8bit的wire类型的变量
wire [7:0] mem [0:99] ;

assign mem[0]  = 8'h70  ; //p
assign mem[1]  = 8'h70  ; //p
assign mem[2]  = 8'h30  ; //0
assign mem[3]  = 8'h30  ; //0
assign mem[4]  = 8'h30  ; //0
assign mem[5]  = 8'h31  ; //1
assign mem[6]  = 8'h30  ; //0
assign mem[7]  = 8'h30  ; //0
assign mem[8]  = 8'h30  ; //0
assign mem[9]  = 8'h30  ; //0
 
assign mem[10] = 8'h70  ; //p
assign mem[11] = 8'h30  ; //0
assign mem[12] = 8'h30  ; //0
assign mem[13] = 8'h30  ; //0
assign mem[14] = 8'h31  ; //1
assign mem[15] = 8'h30  ; //0
assign mem[16] = 8'h30  ; //0
assign mem[17] = 8'h30  ; //0
assign mem[18] = 8'h31  ; //1
assign mem[19] = 8'h30  ; //0
 
assign mem[20] = 8'h70  ; //p
assign mem[21] = 8'h31  ; //1
assign mem[22] = 8'h30  ; //0
assign mem[23] = 8'h30  ; //0
assign mem[24] = 8'h30  ; //0
assign mem[25] = 8'h30  ; //0
assign mem[26] = 8'h30  ; //0
assign mem[27] = 8'h30  ; //0
assign mem[28] = 8'h30  ; //0
assign mem[29] = 8'h30  ; //0
 
assign mem[30] = 8'h70  ; //p
assign mem[31] = 8'h31  ; //1
assign mem[32] = 8'h30  ; //0
assign mem[33] = 8'h30  ; //0
assign mem[34] = 8'h30  ; //0
assign mem[35] = 8'h30  ; //0
assign mem[36] = 8'h31  ; //1
assign mem[37] = 8'h30  ; //0
assign mem[38] = 8'h31  ; //1
assign mem[39] = 8'h30  ; //0
 
assign mem[40] = 8'h70  ; //p
assign mem[41] = 8'h30  ; //0
assign mem[42] = 8'h31  ; //1
assign mem[43] = 8'h30  ; //0
assign mem[44] = 8'h30  ; //0
assign mem[45] = 8'h30  ; //0
assign mem[46] = 8'h30  ; //0
assign mem[47] = 8'h30  ; //0
assign mem[48] = 8'h30  ; //0
assign mem[49] = 8'h30  ; //0
 
assign mem[50] = 8'h70  ; //p
assign mem[51] = 8'h31  ; //1
assign mem[52] = 8'h30  ; //0
assign mem[53] = 8'h30  ; //0
assign mem[54] = 8'h30  ; //0
assign mem[55] = 8'h30  ; //0
assign mem[56] = 8'h30  ; //0
assign mem[57] = 8'h31  ; //1
assign mem[58] = 8'h30  ; //0
assign mem[59] = 8'h30  ; //0
 
assign mem[60] = 8'h70  ; //p
assign mem[61] = 8'h30  ; //0
assign mem[62] = 8'h30  ; //0
assign mem[63] = 8'h30  ; //0
assign mem[64] = 8'h30  ; //0
assign mem[65] = 8'h30  ; //0
assign mem[66] = 8'h30  ; //0
assign mem[67] = 8'h30  ; //0
assign mem[68] = 8'h30  ; //0
assign mem[69] = 8'h30  ; //0
 
assign mem[70] = 8'h70  ; //p
assign mem[71] = 8'h30  ; //0
assign mem[72] = 8'h30  ; //0
assign mem[73] = 8'h30  ; //0
assign mem[74] = 8'h30  ; //0
assign mem[75] = 8'h30  ; //0
assign mem[76] = 8'h31  ; //1
assign mem[77] = 8'h30  ; //0
assign mem[78] = 8'h30  ; //0
assign mem[79] = 8'h30  ; //0
 
assign mem[80] = 8'h70  ; //p
assign mem[81] = 8'h30  ; //0
assign mem[82] = 8'h30  ; //0
assign mem[83] = 8'h30  ; //0
assign mem[84] = 8'h31  ; //1
assign mem[85] = 8'h31  ; //1
assign mem[86] = 8'h30  ; //0
assign mem[87] = 8'h31  ; //1
assign mem[88] = 8'h30  ; //0
assign mem[89] = 8'h31  ; //1
 
assign mem[90] = 8'h70  ; //p
assign mem[91] = 8'h30  ; //0
assign mem[92] = 8'h30  ; //0
assign mem[93] = 8'h31  ; //1
assign mem[94] = 8'h31  ; //1
assign mem[95] = 8'h30  ; //0
assign mem[96] = 8'h30  ; //0
assign mem[97] = 8'h30  ; //0
assign mem[98] = 8'h30  ; //0
assign mem[99] = 8'h30  ; //0
 

//状态机参数定义

parameter   idel  =  4'd0 ; //判断码元类型
parameter   s0    =  4'd1 ; //模拟发送0码元
parameter   s1    =  4'd2 ; //模拟发送1码元
parameter   s2    =  4'd3 ; //模拟发送p码元
parameter   s3    =  4'd4 ;	//判断一帧是否发送完整


reg [3:0]   state ;
reg [31:0]  cnt_10ms ;
reg [7:0]   num ;


always @(posedge clk ,negedge rst_n) 
begin
    if (~rst_n) 
        begin
            num      <= 8'd96   ;//模拟系统启动接收到的B码是第96个码元开始
            cnt_10ms <= 32'd0  ;
            state    <= idel   ;
            ex_b_code<= 1'b1   ;
        end
    else
        case (state)
            idel:											//判断码元类型，确定要模拟发送的码元
				 if (mem[num] == 8'h30) 		
                     state <= s0 ;
                 else if (mem[num] == 8'h31)
                     state <= s1 ;
                 else if (mem[num] == 8'h70)
                     state <= s2 ;
                 else 
                     state <= state ;
            
            s0: 											//模拟发送0码元
				if (cnt_10ms == time_10ms - 2'd2 ) 			//s3和idle 需要占用两个时钟周期
                    begin
                        cnt_10ms <= 32'd0 ;
                        state <= s3  ;
                    end
                else if (cnt_10ms <= time_2ms )
                    begin
                        ex_b_code <= 1'b1 ;
                        cnt_10ms <= cnt_10ms + 1'b1  ;
                    end
                else 
                    begin
                        ex_b_code <= 1'b0 ;
                        cnt_10ms <= cnt_10ms + 1'b1  ;
                    end
            
            s1:												//模拟发送1码元
				if (cnt_10ms == time_10ms - 2'd2 ) 
                    begin
                        cnt_10ms <= 32'd0 ;
                        state <= s3  ;
                    end
                else if (cnt_10ms <= time_5ms )
                    begin
                        ex_b_code <= 1'b1 ;
                        cnt_10ms <= cnt_10ms + 1'b1  ;
                    end
                else 
                    begin
                        ex_b_code <= 1'b0 ;
                        cnt_10ms <= cnt_10ms + 1'b1  ;
                    end
                
            s2: 											//模拟发送P码元
				if (cnt_10ms == time_10ms - 2'd2 ) 
                    begin
                        cnt_10ms <= 32'd0 ;
                        state <= s3  ;
                    end
                else if (cnt_10ms <= time_8ms )
                    begin
                        ex_b_code <= 1'b1 ;
                        cnt_10ms <= cnt_10ms + 1'b1  ;
                    end
                else 
                    begin
                        ex_b_code <= 1'b0 ;
                        cnt_10ms <= cnt_10ms + 1'b1  ;
                    end

            s3: 											//判断一帧数据是否发送完整
				if ( num == 8'd99 ) 						
                    begin
                        num <= 8'd0 ;
                        state <= idel  ;
                    end
                else 
                    begin
                        num <= num + 1'b1  ;
                        state <= idel  ;
                    end

            default: state <= idel   ;
        endcase
end



IRIG_B b_code_inst(
    .clk    (clk)     ,//常用b码时钟125MHz
    .rst_n  (rst_n)     ,//全局复位信号
    .b_code (ex_b_code )     ,//用于解析的b码信号

    .sec_01  (sec_01 ),//解析b码时间（年、日、时、分、秒）
    .sec_10  (sec_10 ),//例（21年251天01：48：08）
    .min_01  (min_01 ),
    .min_10  (min_10 ),
    .hou_01  (hou_01 ),
    .hou_10  (hou_10 ),
    .day_001 (day_001),
    .day_010 (day_010),
    .day_100 (day_100),
    .year_01 (year_01),
    .year_10 (year_10) 

);

endmodule