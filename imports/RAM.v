
//Diego Iván Sigala Sánchez
//Sistemas digitales

module RAM(
    input WE,
    input clk,
    input [7:0]IN,
    input [7:0]addr,
    output reg [7:0]out
    );
    
    reg [7:0]mem[0:255]; 
    
    always @ (posedge clk) begin
        if(WE)
            mem[addr] <= IN;  
    end
    
    always @ * begin
        out = mem[addr];
    end
    
endmodule
