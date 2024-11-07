`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2019 07:21:48 PM
// Design Name: 
// Module Name: Lab_02_Half_Adder_Sim
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


module Lab_02_Half_Adder_Sim(
    );
    
    logic A, B;
    logic Cout;
    logic Sum;
    
    Lab_02_Half_Adder Lab_02_Half_Adder_inst(  .A(A), .B(B), .Cout(Cout), .Sum(Sum)  );
    
    initial
        begin
           for(int i = 0; i < 4; i++)begin
            A= i[1:1]; B = i[0:0]; #10;
           end
        end
endmodule

