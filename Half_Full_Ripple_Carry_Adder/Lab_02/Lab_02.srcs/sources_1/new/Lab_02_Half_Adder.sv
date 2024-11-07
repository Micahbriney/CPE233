`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2019 07:14:33 PM
// Design Name: 
// Module Name: Lab_02_Half_Adder
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


module Lab_02_Half_Adder(
    input A,
    input B,
    output Sum,
    output Cout
    );
    //assign Sum = ~A&B|A&~B;
    assign Sum = A^B;
    assign Cout = A&B;
endmodule
