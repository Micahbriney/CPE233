`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Bridget Benson 
// Create Date: 10/26/2018 12:57:18 PM
// Description: 8 bit acculumator.  Adds new value to the
// current value when ld is 1.  
//////////////////////////////////////////////////////////////////////////////////


module Accumulator(
    input clk, ld, clr,
    input [7:0] D,
    output logic [7:0] Q = 0
    );
    
    always_ff @ (posedge clk)
    begin
        if (clr)		//when clr = 1 Q will be set to 0
            Q <= 0;
        else if (ld)
            Q <= D + Q;
         
    
    end
endmodule
