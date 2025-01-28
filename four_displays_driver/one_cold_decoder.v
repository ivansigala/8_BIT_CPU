module one_cold_decoder(
    input  [1:0]A,
    output [3:0]B
    );
    
    assign B =
        (A == 'b00) ? 'b1110: 
        (A == 'b01) ? 'b1101:
        (A == 'b10) ? 'b1011:
                       'b0111;
endmodule
