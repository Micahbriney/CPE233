`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Micah Briney
// 
// Create Date: 11/15/2019 06:32:50 PM
// Design Name: 
// Module Name: Multiply_FSM_Sim
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


module Multiply_FSM_Sim(
    );
    logic clk;
    logic en;
    logic [3:0] B;
    logic [1:0] sr_sel;
    logic acc_ld;
    logic acc_clr; 
    
    Multiply_FSM Multiply_FSM_01( .*);
    
    always begin
        clk = 0; #5;
        clk = 1; #5;
    end
    
    initial begin
            
            //tests
            B = 4'b0000; en = 1; #10;   //Enable for B = 0
            B = 4'b0000; en = 0; #10;   //No enable
            B = 4'b1111; en = 1; #55;   //Enable for B = f
            B = 4'b0001; en = 1; #55;   //Enable for B = 1
            B = 4'b1111; en = 1; #15;   //Short enable for B = f
            B = 4'b1111; en = 0; #15;   //No enable for B = 1
            B = 4'b0010; en = 1; #30;   //Short enable for B = 2
            B = 4'b1000; en = 1; #15;   //Short enable for B = 8

        end
    
endmodule
