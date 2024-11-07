`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Micah Briney
// 
// Create Date: 11/10/2019 12:01:14 AM
// Design Name: 
// Module Name: Lab_06_SIM
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


module Lab_06_SIM(
    );
    logic [7:0] SWITCHES;
    logic bt0;
    logic clk;
    logic [7:0] SEGMENTS;
    logic [7:0] LEDS;
    logic [3:0] DISP_EN;
    
    LAB_06 LAB_06_01( .*);
    
    initial
        begin
            //Test 1
            SWITCHES = 8'b00000001; bt0 = 0; #50; 
            //Test 2
            SWITCHES = 8'b00000000; bt0 = 0; #50;   
            //Test 3
            SWITCHES = 8'b00000001; bt0 = 0; #50;
            //Test 4
            SWITCHES = 8'b00000011; bt0 = 0; #50;
            //Test 5
            SWITCHES = 8'b00000111; bt0 = 0; #50;
            //Test 6
            SWITCHES = 8'b00001110; bt0 = 0; #50;
            //Test 7
            SWITCHES = 8'b00011101; bt0 = 0; #50;
            //Test 8
            SWITCHES = 8'b00111011; bt0 = 0; #50;
        end

endmodule
