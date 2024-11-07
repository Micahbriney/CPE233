`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Micah Briney
// 
// Create Date: 10/21/2019 07:56:02 PM
// Design Name: 
// Module Name: v_chk
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Validity checker checks the signs of the two inputs and 
// the sign of the output is valid
// 
//////////////////////////////////////////////////////////////////////////////////


module v_chk(
    input A, B, S,
    output logic V //0 is invalid, anode will be off
    );
    always_comb
        begin
            if( A == 0 && B == 0 && S == 1)     //Invalid case 1
                V = 0;                          //Set to invalid
            else if( A == 1 && B == 1 && S == 0)//Invalid case 2
                V = 0;                          //Set to invalid
            else                                //All other cases are valid
                V = 1;                          //Set to valid
        end
endmodule
