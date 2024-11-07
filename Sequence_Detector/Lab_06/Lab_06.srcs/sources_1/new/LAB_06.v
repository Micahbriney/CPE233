`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Micah Briney
// 
// Create Date: 11/04/2019 08:56:21 PM
// Module Name: LAB_06
// Project Name: Sequence Detector
// Additional Comments: Top level for lab 6. This includes 3 inputs, 3 outputs and 3 temp variables
// 
//////////////////////////////////////////////////////////////////////////////////


module LAB_06(
    input [7:0] SWITCHES,
    input bt0,
    input clk,
    output [7:0] SEGMENTS,
    output [7:0] LEDS,
    output [3:0] DISP_EN
    );
    
    logic T2, T3, T4;
    
    SEQ_DVR SEQ_DVR_01( .CLK(T2), .SWITCHES(SWITCHES), .LEDS(LEDS), .X(T3));
    clk_div2 clk_div2_01( .clk(clk), .sclk(T2));
    BC_DEC0 BC_DEC0_01( .CLK(clk), .Z(T4), .DISP_EN(DISP_EN), .SEGMENTS(SEGMENTS));
    FSM FSM_01( .bt0(bt0), .CLK(T2), .X(T3), .Z(T4));
    
endmodule
