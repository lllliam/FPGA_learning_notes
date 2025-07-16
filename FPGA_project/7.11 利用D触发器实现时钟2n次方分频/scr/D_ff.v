module D_ff(
    input wire clk,rst_n,D,
    
    output reg Q
);

    always @(posedge clk or negedge rst_n)
    begin 
        if(!rst_n)
            Q=0;
        else begin
            Q=D;
			end
    end

endmodule