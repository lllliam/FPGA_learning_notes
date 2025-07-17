module fsm(
    input wire clk,rst_n,
    input wire pi_money,
    
    output reg po_cola
);
    
    parameter P0=3'b001;
    parameter P1=3'b010;
    parameter P2=3'b100;
    
    reg [2:0] state;
    
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)
            state<=3'b001;
        else case(state)
            P0: if(pi_money==1)
                    state<=P1;
                else
                    state<=state;
            P1: if(pi_money==1)
                    state<=P2;
                else
                    state<=state;
            P2: if(pi_money==1)
                    state<=P0;
                else
                    state<=P0;
            default:state=P0;
        endcase
    end
    
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)
            po_cola<=0;
        else if((state==P2)&&(pi_money==1))
            po_cola<=1;
        else po_cola=0;
    end

endmodule