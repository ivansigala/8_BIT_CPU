module four_displays_driver(
    input [4:0]A,
    input [4:0]B,
    input [4:0]C,
    input [4:0]D,
    input clk,
    input reset,
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
        
    wire [1:0]count;
    wire [4:0]num, clk_out;
    
    five_bit_4x1_mux M0(
        
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .set(count),
        .Y(num)
        
        );
    
    prescaler M1(
    
        .clk(clk),
        .scale_factor(250_000),
        .clk_out(clk_out)
        
        );
    
    contador_bit_2 M2(
        .clk(clk_out),
        .reset(reset),
        .count(count)
    );
    
    sev_seg_decoder M3(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g),
        .Ci(num[4]),  
        .Co(Dpout),
        .s(num[3:0])
        
        );

    one_cold_decoder M4(
        .A(count),
        .B(enable)
    );
    
endmodule
