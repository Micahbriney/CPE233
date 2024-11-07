`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Micah Briney
// 
// Create Date: 10/28/2019 07:26:31 PM
// Module Name: Lab_05
// Project Name: Lab_05
// Description: Use of mux, decoder, RCA, and d-type flip flop to add/subtract
// signed binary.
//////////////////////////////////////////////////////////////////////////////////


module Lab_05(
    input [3:0] A,
    input [3:0] B,
    input en,
    input clr,
    input clk,
    input sub,
    output [7:0] seg,
    output [3:0] an
    );


    logic [3:0] T1; 
    logic [3:0] T3; 
    logic [3:0] T4; 
    logic [3:0] T5; 
    logic [3:0] T8; 
    logic T6; 
    logic T7; 
    logic T9; 
    logic T10;
    
    //T6 And gate sets T6 to 1 when Sum/T3[3] bit and V/T7 both = 1
    assign T6 = T3[3]&T7;       

    //m_01 decides if B is B or NOT B using sub input
    mux2 m_01(
              .one(~B),
              .zero(B),
              .sel(sub),
              .mux_out(T1)
              );
    
    //rca_01 performs addition 
    Ripple_Carry_Adder rca_01(
                              .A(A),
                              .B(T1),
                              .Cin(sub),
                              .Sum(T3)
                              );
    
    //rca_02 NOTs T3 and adds 1. Applied only when T3[3] AND T7[3] = 1
    Ripple_Carry_Adder rca_02(
                              .A(~T3),
                              .B(4'b0000),
                              .Cin(1),
                              .Sum(T4)
                              );

    //v_chk check if T3[3] is valid sign output
    v_chk v_chk_01(
                   .A(A[3]),
                   .B(T1[3]),
                   .S(T3[3]),
                   .V(T7)
                   );
    
    //m_02 sends radix complement to dff_cnt flip-flop if T7 && T3[3] are 1
    mux2 m_02(
              .one(T4),
              .zero(T3),
              .sel(T6),
              .mux_out(T5)
              );
    
    //validty checker D type Flip-Flop
    //set is assigned value clr so that the anode is turned off when clr button is pressed
    dff #(1)dff_valid( 
                       .clk(clk),
                       .en(en),
                       .clr(0),
                       .D(T7),
                       .set(clr),
                       .Q(T10)
                       );

    //sign checker D type Flip-Flop
    dff #(1) dff_sign(
                      .clk(clk),
                      .en(en),
                      .clr(clr),
                      .D(T6),
                      .set(0),
                      .Q(T9)
                      );
    
    //Count of rca_01 or rca_02. It depends on T6 value going to mux_03 
    //variable lenght of 4 bits specified #(4)
    dff #(4) dff_cnt (
                      .clk(clk),
                      .en(en),
                      .clr(clr),
                      .D(T5),
                      .set(0),
                      .Q(T8)
                      );
    
    //8 segment display displays in 100 Mhz
    eight_seg eight_seg_01(
                           .clk(clk),
                           .cnt1({10'b0,T8}),
                           .sign(T9),
                           .valid(T10),
                           .ssegs(seg),
                           .disp_en(an)
                           );
endmodule
