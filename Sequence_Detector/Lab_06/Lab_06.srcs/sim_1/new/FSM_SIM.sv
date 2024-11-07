`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Micah Briney
// 
// Create Date: 11/09/2019 04:26:21 PM
// Design Name: 
// Module Name: FSM_SIM
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


module FSM_SIM(
    );
    logic CLK;
    logic bt0;
    logic X;
    logic Z;
    
    FSM FSM_01( .*);

    always
        begin
            CLK = 1; #5;
            CLK = 0; #5;
        end

    
    initial
        begin
             //Test 1
             X = 0; bt0 = 0; #10;
             //Test 2
             X = 0; bt0 = 0; #10;
             //Test 3
             X = 1; bt0 = 0; #10;
             //Test 4
             X = 1; bt0 = 0; #10;
             //Test 5
             X = 0; bt0 = 0; #10;
             //Test 6
             X = 0; bt0 = 0; #10;
             //Test 7
             X = 1; bt0 = 0; #10;



             //Test 8
             X = 0; bt0 = 1; #10;
             //Test 9
             X = 0; bt0 = 1; #10;
             //Test 10
             X = 1; bt0 = 1; #10;
             //Test 11
             X = 1; bt0 = 1; #10;
             //Test 12
             X = 1; bt0 = 1; #10;
             //Test 13
             X = 0; bt0 = 1; #10;
             //Test 14
             X = 1; bt0 = 1; #10;
             
         end
 
endmodule