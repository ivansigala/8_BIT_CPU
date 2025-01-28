module five_bit_4x1_mux(
    input [4:0] A,
    input [4:0] B,
    input [4:0] C,
    input [4:0] D,
    input [2:0] set,
    output [4:0] Y
    );
    
    assign Y = 
        (set == 'b00) ? A:
        (set == 'b01) ? B:
        (set == 'b10) ? C:
                        D;
        
    
endmodule
