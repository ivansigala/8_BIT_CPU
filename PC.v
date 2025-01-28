
//Diego Iván Sigala Sánchez
//Sistemas digitales


module PC(
    input [7:0]K,
    input clk,
    input reset,
    input sel_pc,
    input sel_br,
    output reg [7:0]out
    );
        
    always @(posedge clk) begin
        if(reset == 'b1)
            out <= 0;
        else if(sel_pc == 'b1)
            out <= K;
        else if(sel_br == 'b1)
            out <= out + 2;
        else
            out <= out + 1; 
    end
    
    
endmodule
