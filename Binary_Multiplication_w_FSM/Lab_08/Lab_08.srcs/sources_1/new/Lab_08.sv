`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Micah Briney
// Create Date: 11/15/2019 12:23:10 PM
// Module Name: Lab_08
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


module Lab_08(
    input clk,
    input [3:0] A,
    input [3:0] B,
    input en,
    output [7:0] sseg,
    output [3:0] an
    );


logic [1:0] T1;
logic T2, T3;
logic [7:0] T4, T5;

Multiply_FSM Multiply_FSM_01( 
                            .clk(clk), 
                            .en(en), 
                            .B(B), 
                            .sr_sel(T1), 
                            .acc_ld(T2), 
                            .acc_clr(T3)
                            );
                            
Shift_Reg Shift_Reg_01( 
                            .clk(clk), 
                            .clr(1'b0), 
                            .sel(T1), 
                            .D({4'b0,A}), 
                            .Q(T4)
                        );
                        
Accumulator Accumulator_01( 
                            .clk(clk), 
                            .ld(T2), 
                            .clr(T3), 
                            .D(T4), 
                            .Q(T5)
                            );
                            
Univ_SSeg Univ_SSeg_01(     
                            .clk(clk), 
                            .cnt1({6'b0,T5}), 
                            .valid(1'b1), 
                            .ssegs(sseg), 
                            .disp_en(an)
                            );


endmodule