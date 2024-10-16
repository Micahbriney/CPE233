`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2020 09:34:33 PM
// Design Name: 
// Module Name: debounce_tb
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


module debounce_tb();
    logic clk = 0;
    logic sig_in;
    logic pos_pulse_out; 
    logic neg_pulse_out;

       initial    
      begin       
         clk = 0;   //- init signal        
         forever  #5 clk = ~clk;    
      end  
    one_shot_bdir #(.n(3)) tb(.*);
    
    
    
    initial begin
        sig_in = 1;
        forever  #60 sig_in = ~sig_in; 
    end

endmodule
