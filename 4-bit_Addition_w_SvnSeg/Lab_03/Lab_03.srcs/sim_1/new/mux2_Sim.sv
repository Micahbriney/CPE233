`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2019 08:50:21 PM
// Design Name: 
// Module Name: mux2_Sim
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


module mux2_Sim(

    );
    logic zero, one, sel;
    logic mux_out;
    
    mux2 mux2_inst( .*);
    
    initial
        begin
        zero = 4'b1110; one  = 4'b1111; sel = 0; #10;
        zero = 4'b1110; one  = 4'b1111; sel = 1; #10;
        end
        
endmodule
