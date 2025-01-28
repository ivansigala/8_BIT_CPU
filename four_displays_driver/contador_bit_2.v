module contador_bit_2(
    input clk,
    input reset,
    output reg [1:0] count
    );
    
    always @ (posedge clk) begin
        
        if(reset == 1)
            count <= 0;
        else
            count <= count + 1;    
    end
    
endmodule
