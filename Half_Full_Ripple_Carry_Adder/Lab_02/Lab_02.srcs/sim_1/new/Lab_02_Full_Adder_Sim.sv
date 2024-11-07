`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2019 07:56:03 PM
// Design Name: 
// Module Name: Lab_02_Full_Adder_Sim
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


module Lab_02_Full_Adder_Sim(
    );
    
    logic A, B, Cin;
    logic Sum;
    logic Cout;
    
    Lab_02_Full_Adder Lab_02_Full_Adder_inst (  .A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout)  );
    
    initial
        begin
                for(int i = 0; i < 8; i++)begin
                    A= i[2:2]; B = i[1:1]; Cin = i[0:0]; #10;    
                end

        
    end
endmodule
