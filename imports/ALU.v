//Diego Iván Sigala Sánchez
//Sistemas digitales

module ALU (
    input [7:0] A,
    input [7:0] B,
    input [2:0] Sel,
    output reg [7:0] Result,
    output reg Carry
);

    always @(*) begin
        
        Carry = 0;
        
        case (Sel)
            3'b000: Result = B;
            3'b001: {Carry, Result} = A + B;
            3'b010: {Carry, Result} = A - B;
            3'b011: Result = A | B;
            3'b100: Result = A & B;
            3'b101: Result = A ^ B;
            3'b110: Result = ~B;
            default: Result = A;
        endcase
    end
