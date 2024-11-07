`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Bridget Benson 
// Create Date: 10/26/2018 01:04:29 PM
// Description: 8 bit shift register 
// sel: 0 - HOLD
//      1 - LOAD
//      2 - LEFT SHIFT
//      3 - RIGHT SHIFT
//////////////////////////////////////////////////////////////////////////////////


module Shift_Reg(

    input clk, clr ,
    input [7:0] D,
    input [1:0] sel,
    output logic [7:0] Q = 0

    );
    
    always_ff @ (posedge clk)
    begin
    
        if (clr)
            Q <= 0;
        else  
            case (sel)
                1: Q <= D;
                2: Q <= {Q[6:0] , 1'b0};
                3: Q <= {1'b0, Q[7:1]};
                //option zero means hold               
             endcase
             
     end
             
       
    
endmodule
