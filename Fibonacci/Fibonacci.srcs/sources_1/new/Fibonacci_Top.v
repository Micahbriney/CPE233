`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2020 01:37:41 AM
// Design Name: 
// Module Name: Fibonacci_Top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Fibonacci_Top(
    input btn,
    input clk,
    output [3:0] an,
    output [7:0]sseg,
    output [3:0] led
    );
    wire [9:0] t1, t2, t3, t4, t5, t6, t8; 
    wire [3:0] t7;
    wire clk_w, rco_w, sel_w, clr_w, ld_w, we_w;
 
    assign led = t7;
    
    clk_2n_div_test #(.n(24))  MY_DIV (  
                                        .clockin (clk),       
                                        .fclk_only (1'b0),  //1 for simulation
                                        .clockout (clk_w)   
                                      );
    fsm_template               fsm    ( 
                                        .btn(btn), 
                                        .clr_fsm(1'b1), 
                                        .rco_in(rco_w), 
                                        .clk(clk_w), 
                                        .sel(sel_w), 
                                        .clr(clr_w), 
                                        .ld(ld_w), 
                                        .we(we_w)
                                      );
    mux_2t1_nb                 mux_1  ( 
                                        .SEL(sel_w), 
                                        .D0(t1), 
                                        .D1(1'b1), 
                                        .D_OUT(t2)
                                      );
    mux_2t1_nb                 mux_2  ( 
                                        .SEL(sel_w), 
                                        .D0(t3), 
                                        .D1(1'b1), 
                                        .D_OUT(t4)
                                      );
    mux_2t1_nb                 mux_3  ( 
                                        .SEL(sel_w), 
                                        .D0(t3), 
                                        .D1(1'b1), 
                                        .D_OUT(t6)
                                      );
    reg_nb          #(.n(10))  reg_1  ( 
                                        .data_in(t2), 
                                        .clk(clk_w), 
                                        .clr(1'b0), 
                                        .ld(ld_w), 
                                        .data_out(t5)
                                      );
    reg_nb          #(.n(10))  reg_2  ( 
                                        .data_in(t4), 
                                        .clk(clk_w), 
                                        .clr(1'b0), 
                                        .ld(ld_w), 
                                        .data_out(t1)
                                      );
    rca_nb          #(.n(10))  rca    ( 
                                        .a(t5), 
                                        .b(t1), 
                                        .cin(1'b0), 
                                        .sum(t3)
                                      );
    cntr_up_clr_nb  #(.n(4))   cntr   ( 
                                        .clr(clr_w), 
                                        .clk(clk_w), 
                                        .up(1'b1), 
                                        .count(t7), 
                                        .rco(rco_w), 
                                        .D(1'b0), 
                                        .ld(1'b0)
                                      );
    ram_single_port #(.n(4),.m(10))ram( 
                                        .data_in(t6), 
                                        .addr(t7), 
                                        .we(we_w), 
                                        .clk(clk_w), 
                                        .data_out(t8)
                                      );
    univ_sseg             my_univ_sseg( 
                                        .cnt1 ({4'b0,t8}), 
                                        .cnt2 (1'b0), 
                                        .valid (1'b1), 
                                        .dp_en (1'b0), 
                                        .dp_sel (2'b00), 
                                        .mod_sel (2'b10), 
                                        .sign (1'b0), 
                                        .clk (clk), 
                                        .ssegs (sseg), 
                                        .disp_en (an)    
                                      );
endmodule
