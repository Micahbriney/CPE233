`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2019 08:12:33 PM
// Design Name: 
// Module Name: lab_0
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


module lab_0(
    input A,
    input B,
    input C,
    output Q
    );
    assign Q = ~ (A|B)|(B&C);
endmodule
