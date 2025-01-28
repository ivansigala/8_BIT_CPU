
//Diego Iván Sigala Sánchez
//Sistemas digitales

module prescaler(
    input clk,
    input [27:0] scale_factor,
    output reg clk_out
    );
    
    reg [27:0]count;
    
    always @ (posedge clk) begin
       
        if(count == scale_factor)
            begin
                count <= 0;
                clk_out <= ~clk_out;
            end
        else
            count <= count + 1; 
     end    
endmodule
