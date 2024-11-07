`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2019 07:27:35 PM
// Design Name: 
// Module Name: Lab_02_Ripple_Carry_Adder_Sim
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


module Lab_02_Ripple_Carry_Adder_Sim(

    );
    
    logic [3:0] A, B;
    logic Cout;
    logic [3:0] Sum;
    
       
        
    initial
        begin    
        A = 3; B = 5; #10;
        A = 8; B = 2; #10;
        A = 7; B = 7; #10;
        end 
endmodule
