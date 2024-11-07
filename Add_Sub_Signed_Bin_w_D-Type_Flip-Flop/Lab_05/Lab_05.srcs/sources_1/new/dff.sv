`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Micah Briney
// 
// Create Date: 10/28/2019 07:26:31 PM
// Module Name: dff
// Project Name: Lab_05
// Description: D-Type flip flop register. This will store information for later.
//////////////////////////////////////////////////////////////////////////////////

module dff # (parameter WIDTH = 1)(
    input clk,
    input en,                       //enter
    input clr,                      //reset
    input [WIDTH - 1:0] D,          //variable length input. Length provided
    input set,                      //tied to clr for the validity checker
    output logic [WIDTH -1:0] Q = 0 //variable lenght output
    );
    
    always_ff @ (posedge clk)
    begin
        if (clr)    //if clear button is pressed
            Q = 0;
        else if (en)//if en button is pressed
            Q = D;
        else if(set)//if set = 1
            Q = 1;
    end
endmodule
