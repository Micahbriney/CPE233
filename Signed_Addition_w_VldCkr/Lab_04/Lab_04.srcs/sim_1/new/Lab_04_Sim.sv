`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Micah Briney
// 
// Create Date: 10/21/2019 08:43:27 PM
// Design Name: 
// Module Name: Lab_04_Sim
// Project Name: Lab_04
// Target Devices: 
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


module Lab_04_Sim(

    );
    
    logic [3:0] A, B; 
    logic sub;
    logic [6:0] seg; 
    logic AN, neg;
        
    Lab_04 Lab_04_inst (  .*);
        
     initial
        begin
            A =  8; B =  7; sub = 0; #10;   //unsigned
            A =  8; B =  7; sub = 1; #10;   //unsigned
            A = -8; B =  7; sub = 0; #10;   //signed
            A = -8; B =  7; sub = 1; #10;   //signed
            A =  1; B =  0; sub = 0; #10;   //signed same as unsigned
            A =  1; B =  0; sub = 1; #10;   //signed same as unsigned
            A = 11; B = 13; sub = 0; #10;   //unsigned
            A = 11; B = 13; sub = 1; #10;   //unsigned    
            A = -5; B = -3; sub = 0; #10;   //signed
            A = -5; B = -3; sub = 1; #10;   //signed
        end
     

endmodule
