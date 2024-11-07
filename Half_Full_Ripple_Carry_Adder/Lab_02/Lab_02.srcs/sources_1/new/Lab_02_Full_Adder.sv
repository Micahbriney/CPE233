`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2019 07:43:19 PM
// Design Name: 
// Module Name: Lab_02_Full_Adder
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


module Lab_02_Full_Adder(
    input A,
    input B,
    input Cin,
    output Cout,
    output Sum
    );
    assign Sum = A^B^Cin;
    assign Cout = A&B|A&Cin|B&Cin;
endmodule
