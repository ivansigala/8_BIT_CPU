module W_REGISTER(
    input [7:0]I,
    input clk,
    input reset,
    input WE,
    output reg [7:0]OUT
    );
    
    always @ (posedge clk) begin
        if(reset == 'b1) 
            OUT <= 0;
        else if(WE == 'b1)
            OUT <= I;
        else 
            OUT <= OUT;
    end
    
endmodule
