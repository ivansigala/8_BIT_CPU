module MUX_8_BIT(
    input sel,
    input [7:0]C,
    input [7:0]K,
    output reg [7:0]out
    );
    
    always @ * begin
        case(sel)
            'b0: out =  C;
            'b1: out =  K;
        endcase
    end
    
endmodule
