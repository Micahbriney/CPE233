`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2019 08:41:04 PM
// Design Name: 
// Module Name: Lab_03_BB_Sim
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


module Lab_03_BB_Sim(

    );
    
    logic [3:0] A, B;
    logic [6:0] Seg;
    logic [3:0] AN;
    
    Lab_03_BB Lab_03_BB_inst( .A(A), .B(B), .Seg(Seg), .AN(AN));
    
    initial
        begin
            for(int i = 0; i < 128; i++)begin
                A = i[7:4]; B= i[3:0]; #10;
            end
        end
    
endmodule
