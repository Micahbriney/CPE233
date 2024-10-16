`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Surf Designs
// Engineer:  James Ratner
// 
// Create Date: 01/07/2020 12:59:51 PM
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench file for Exp 5
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module otter_tb(); 

   reg RST; 
   reg INTR; 
   reg CLK; 
   reg [31:0] IOBUS_IN; 
   wire [31:0] IOBUS_ADDR; 
   wire [31:0] IOBUS_OUT; 
   wire IOBUS_WR; 

    Lim_Otter_MCU  OTTER_MCU(
         .RST         (RST),
         .INTR        (INTR),
         .CLK         (CLK),
         .IOBUS_IN    (IOBUS_IN),
         .IOBUS_OUT   (IOBUS_OUT), 
         .IOBUS_ADDR  (IOBUS_ADDR), 
         .IOBUS_WR    (IOBUS_WR)
         );
     
   //- Generate periodic clock signal    
   initial    
      begin       
         CLK = 0;   //- init signal        
         forever  #10 CLK = ~CLK;    
      end                        
         
   initial        
   begin           
      RST  = 1;
      INTR = 0;
      IOBUS_IN = 32'h0000FEED;  
    
      #40

      RST = 0;  

    end
        
 endmodule