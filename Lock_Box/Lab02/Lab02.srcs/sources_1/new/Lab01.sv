`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2019 07:19:18 PM
// Design Name: 
// Module Name: Lab01
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


module Lab02(
    input A,
    input B,
    input C,
    input D,
    output F
    );
    //assign F=~A&B&~C&D|~A&B&C&~D|~A&B&C&D|A&~B&~C&D|A&~B&C&~D|A&~B&C&D|A&B&~C&D|A&B&C&~D|A&B&C&D;
    assign F=(A|B)&(C|D);
endmodule
