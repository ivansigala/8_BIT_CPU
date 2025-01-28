
module CPU(
    input clk,
    input reset,
    
    output Carry,
    
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output Dpout,
    output [3:0]enable
    );
    
    reg Z;
    
    wire clk_out;

    //Outputs of the control unit
    wire WE;
    wire [7:0]K;
    wire sel_br;
    wire sel_pc;
    wire WE_ACC;
    wire sel_mem;
    wire [2:0]sel_alu; 
    
    
    wire [7:0]addr;    //PC OUTPUT
    wire [7:0]outMUX;  //Output og the MUX that selects between RAM and ROM for the ALU input
    wire [7:0]outRAM;  //Output of the RAM
    wire [7:0]outW_R;  //Output of the Acc or working register
    wire [7:0]outALU;  //Output of the ALU
    wire [11:0]outROM; //Output OF the ROM
    
    prescaler M0(
        .clk(clk),
        .scale_factor(100_000_000),
        .clk_out(clk_out)
        );
    
    PC M1(
        .K(K),
        .clk(clk_out),
        .reset(reset),
        .sel_pc(sel_pc),
        .sel_br(sel_br),
        .out(addr)
        );
    
    ROM M2(
        .addr(addr),
        .out(outROM)
        );
        
    MUX_8_BIT M3(
        .sel(sel_mem),
        .C(outRAM),
        .K(outROM[7:0]),
        .out(outMUX)
        );
    
    ALU M4(
        .A(outW_R),
        .B(outMUX),
        .Sel(sel_alu),
        .Result(outALU),
        .Carry(Carry)
        );
        
    W_REGISTER M5(
       .I(outALU),
       .WE(WE_ACC),
       .clk(clk_out),
       .reset(reset),
       .OUT(outW_R)
       );
        
    RAM M7(
        .clk(clk_out),
        .WE(WE),
        .addr(K),
        .IN(outW_R),
        .out(outRAM)
        );
        
    always @ (posedge clk_out)begin
        if(outALU == 0)
            Z <= 1;
        else
            Z <= 0;
    end
    
    CONTROL_UNIT M8(
        .opcode(outROM[11:8]),
        .K(outROM[7:0]),
        .Z(Z),
        .WE(WE),
        .WE_ACC(WE_ACC),
        .sel_br(sel_br),
        .sel_pc(sel_pc),
        .sel_mem(sel_mem),
        .sel_alu(sel_alu),
        .PC_IN(K),
        .RAM_ADDR(K)
        );        
        
   four_displays_driver M9(
        .A(outW_R[3:0]),
        .B(outW_R[7:4]),
        .C(addr[3:0]),
        .D(addr[7:4]),
        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g),
        .Dpout(Dpout),
        .enable(enable)
        );
     
        
endmodule
