`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2019 12:17:50 AM
// Design Name: 
// Module Name: Svn_Seg_Display_Sim
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


module Svn_Seg_Display_Sim(

    );
    
    logic [3:0] binary;    
    logic [6:0] seg; 
    
    Svn_Seg_Display Svn_Seg_Display_inst(.*);
    
    initial
        begin
            for(int i = 0; i<16; i++)begin
                binary = i[3:0]; #10;
            end
        end
endmodule
