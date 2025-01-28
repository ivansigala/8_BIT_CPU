
//Diego Iván Sigala Sánchez
//Sistemas digitales

module CONTROL_UNIT(
    input [3:0]opcode, //viene de la rom
    input [7:0]K,
    input Z,//bandera de alu si es 0 z=1
 
    output reg WE,
    output reg WE_ACC,
    output reg sel_br,//
    output reg sel_pc,
    output reg sel_mem,
    output reg [2:0]sel_alu,
    output reg [7:0]PC_IN,
    output reg [7:0]RAM_ADDR
    );
    
    always @(*) begin
        RAM_ADDR = K;
        PC_IN    = K;
        case(opcode)
            'b0000: begin  //Carga el registro K de la RAM en el acumulador
                    sel_alu  = 'b000;
                    sel_mem  = 'b0;
                    sel_pc   = 'b0;
                    sel_br   = 'b0;
                    WE       = 'b0;
                    WE_ACC   = 'b1;
                    end
            'b0001: begin  //Suma K a lo que hay en el acumulador 
                    sel_alu  = 'b001;
                    sel_mem  = 'b1;
                    sel_pc   = 'b0;
                    sel_br   = 'b0;
                    WE       = 'b0;
                    WE_ACC   = 'b1;
                    end
            'b0010: begin //Resta K a lo que hay en el acumulador
                    sel_alu  = 'b010;
                    sel_mem  = 'b1; 
                    sel_pc   = 'b0;
                    sel_br   = 'b0;
                    WE       = 'b0;
                    WE_ACC   = 'b1;
                    end
            'b0011: begin //Suma lo que este en el registro K al Acc
                    sel_alu  = 'b001;
                    sel_mem  = 'b0; 
                    sel_pc   = 'b0;
                    sel_br   = 'b0;
                    WE       = 'b0;
                    WE_ACC   = 'b1;
                    end
            'b0100: begin //Resta lo que este en el registro K AL Acc
                    sel_alu  = 'b010;
                    sel_mem  = 'b0; 
                    sel_pc   = 'b0;
                    sel_br   = 'b0;
                    WE       = 'b0;
                    WE_ACC   = 'b1;
                    end
            'b0101: begin //Guarda lo que este en el Acc en la dirección K de la RAM
                    sel_alu  = 'b111;
                    sel_mem  = 'b0; 
                    sel_pc   = 'b0;
                    sel_br   = 'b0;
                    WE       = 'b1;
                    WE_ACC   = 'b1;
                    end
            'b0110: begin //Salta a la instruccion del registro K en la ROM
                    sel_alu  = 'b111;
                    sel_mem  = 'b1; 
                    sel_pc   = 'b1;
                    sel_br   = 'b0;
                    WE       = 'b0;
                    WE_ACC   = 'b0;
                    end
            'b0111: begin //Se salta la siguiente instrucción si la bendera Z es igual a 0
                    sel_alu  = 'b111;
                    sel_mem  = 'b1; 
                    sel_pc   = 'b0;
                    
                    if(Z == 1)
                        sel_br   = 'b1;
                    else
                        sel_br   = 'b0;
                        
                    WE       = 'b0;
                    WE_ACC   = 'b0;
                    end                      
            'b1000: begin //Hace una OR con la k de la ROM y el acumulador
                    sel_alu  = 'b011;
                    sel_mem  = 'b1; 
                    sel_pc   = 'b0;
                    sel_br   = 'b0;
                    WE       = 'b0;
                    WE_ACC   = 'b1;
                    end
            'b1001: begin //Hace una AND con la k de la ROM y el acumulador
                    sel_alu  = 'b100;
                    sel_mem  = 'b1; 
                    sel_pc   = 'b0;
                    sel_br   = 'b0;
                    WE       = 'b0;
                    WE_ACC   = 'b1;
                    end
            'b1010: begin //Hace una XOR con la k de la ROM y el acumulador
                    sel_alu  = 'b101;
                    sel_mem  = 'b1; 
                    sel_pc   = 'b0;
                    sel_br   = 'b0;
                    WE       = 'b0;
                    WE_ACC   = 'b1;
                    end
            'b1011: begin //Hace una NOT del registro K de la RAM
                    sel_alu  = 'b110;
                    sel_mem  = 'b0; 
                    sel_pc   = 'b0;
                    sel_br   = 'b0;
                    WE       = 'b0;
                    WE_ACC   = 'b1;
                    end
            'b1100: begin //Hace una OR con el registro k de la RAM y el acumulador
                    sel_alu  = 'b011;
                    sel_mem  = 'b0; 
                    sel_pc   = 'b0;
                    sel_br   = 'b0;
                    WE       = 'b0;
                    WE_ACC   = 'b1;
                    end
            'b1101: begin //Hace una AND con el registro k de la RAM y el acumulador
                    sel_alu  = 'b100;
                    sel_mem  = 'b0; 
                    sel_pc   = 'b0;
                    sel_br   = 'b0;
                    WE       = 'b0;
                    WE_ACC   = 'b1;
                    end
            'b1110: begin //Hace una XOR con el registro k de la RAM y el acumulador
                    sel_alu  = 'b101;
                    sel_mem  = 'b0; 
                    sel_pc   = 'b0;
                    sel_br   = 'b0;
                    WE       = 'b0;
                    WE_ACC   = 'b1;
                    end
            'b1111: begin //Carga la constante K en el Acc
                    sel_alu  = 'b000;
                    sel_mem  = 'b1; 
                    sel_pc   = 'b0;
                    sel_br   = 'b0;
                    WE       = 'b0;
                    WE_ACC   = 'b1;
                    end
            
        endcase
    end
endmodule
