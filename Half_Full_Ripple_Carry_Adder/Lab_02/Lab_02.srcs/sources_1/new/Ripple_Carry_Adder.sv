`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2019 07:05:25 PM
// Design Name: 
// Module Name: Ripple_Carry_Adder
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


module Ripple_Carry_Adder(
    input [3:0] A,
    input [3:0] B,
    input  Cin,
    output Cout,
    output [3:0] Sum
    );
logic RC1, RC2, RC3;
    
Lab_02_Full_Adder Lab_02_Full_Adder_0( .A(A[0]), .B(B[0]), .Sum(Sum[0]), .Cin(Cin), .Cout(RC1));

Lab_02_Full_Adder Lab_02_Full_Adder_1( .A(A[1]), .B(B[1]), .Sum(Sum[1]), .Cin(RC1), .Cout(RC2));

Lab_02_Full_Adder Lab_02_Full_Adder_2( .A(A[2]), .B(B[2]), .Sum(Sum[2]), .Cin(RC2), .Cout(RC3));

Lab_02_Full_Adder Lab_02_Full_Adder_3( .A(A[3]), .B(B[3]), .Sum(Sum[3]), .Cin(RC3), .Cout(Cout));    


endmodule
