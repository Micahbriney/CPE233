`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Micah Briney
// 
// Create Date: 11/15/2019 06:32:50 PM
// Design Name: 
// Module Name: Lab_08_Sim
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


module Lab_08_Sim(
    );
    
    logic clk;
    logic [3:0] A;
    logic en;
    logic [3:0] B;
    logic [7:0] sseg;
    logic [3:0] an;
    
    Lab_08 Lab_08_01( .*);
    
    always begin
            clk = 0; #5;
            clk = 1; #5;
        end
        
    initial begin
            //test 1
            A = 4'b0000;  
            B = 4'b0001; 
            en = 0;     #20;
            
            //test 2
            A = 4'b0001; 
            B = 4'b0001; 
            en = 1;     #60;
            
           
            //test 3
            A = 4'b1111; 
            B = 4'b1111; 
            en = 1;     #60;
            

            //test 4
            A = 4'b1111;
            B = 4'b0000;
            en = 1;     #60;


            //test 5
            A = 4'b0000;
            B = 4'b1111;
            en = 1;     #60;


            //test 6
            A = 4'b1000;
            B = 4'b1000;
            en = 1;     #60;    


            //test 7
            A = 4'b1001;
            B = 4'b1001;
            en = 1;     #60;


            //test 8
            A = 4'b0110;
            B = 4'b0110;
            en = 1;     #60;
        end
endmodule