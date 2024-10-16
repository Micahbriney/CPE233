`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2020 06:44:00 PM
// Design Name: 
// Module Name: Wrapper_tb
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


module Wrapper_tb();
    
    reg CLK;
    reg BTNL;
    reg BTNC;               //Reset button
    reg [15:0] SWITCHES;
    wire [15:0] LEDS;
    wire [7:0] CATHODES;
    wire [3:0] ANODES;

OTTER_Wrapper tb_wrap(
    .CLK(CLK),
    .BTNL(BTNL),
    .BTNC(BTNC),
    .SWITCHES(SWITCHES),
    .LEDS(LEDS),
    .CATHODES(CATHODES),
    .ANODES(ANODES)
    );
   //- Generate periodic clock signal    
   initial    
      begin       
         CLK = 0;   //- init signal        
         forever  #5 CLK = ~CLK;    
      end  

    initial
    begin
        BTNC = 1;
        BTNL = 0;
        SWITCHES = 0;
        
        #40;
        BTNC = 0;
        #700;
        //SWITCHES = 'hffff;
        BTNL = 1; #510
        
        BTNL = 0;
        
    end
endmodule