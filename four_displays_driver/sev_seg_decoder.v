module sev_seg_decoder(
    input [3:0]s,
    input Ci,
    output reg a,
    output reg b,
    output reg c,
    output reg d,
    output reg e,
    output reg f,
    output reg g,
    output reg Co
    
    );
    
    always @ * begin
        
        case(s)
            'b0000: {a, b, c, d, e, f, g} = 'b0000001;
            'b0001: {a, b, c, d, e, f, g} = 'b1001111;
            'b0010: {a, b, c, d, e, f, g} = 'b0010010;
            'b0011: {a, b, c, d, e, f, g} = 'b0000110;
            'b0100: {a, b, c, d, e, f, g} = 'b1001100;
            'b0101: {a, b, c, d, e, f, g} = 'b0100100;
            'b0110: {a, b, c, d, e, f, g} = 'b0100000;
            'b0111: {a, b, c, d, e, f, g} = 'b0001111;
            'b1000: {a, b, c, d, e, f, g} = 'b0000000;
            'b1001: {a, b, c, d, e, f, g} = 'b0001100;
            'b1010: {a, b, c, d, e, f, g} = 'b0001000;
            'b1011: {a, b, c, d, e, f, g} = 'b1100000;
            'b1100: {a, b, c, d, e, f, g} = 'b0110001;
            'b1101: {a, b, c, d, e, f, g} = 'b1000010;
            'b1110: {a, b, c, d, e, f, g} = 'b0110000;
            default  {a, b, c, d, e, f, g} = 'b0111000;
        endcase
        
        case(Ci)
            'b1: Co = 'b0;
            default Co = 'b1;
        endcase 
    end
    
endmodule
