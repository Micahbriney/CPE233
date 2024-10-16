`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:   Ratner Surf Designs
// Engineer:  James Ratner
// 
// Create Date: 09/08/2018 07:17:37 PM
// Design Name: 
// Module Name: reg_nb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Model for generic register (defaults to 8 bits)
//                with asynchronous clear 
//
//      //- Usage example for instantiating 16-bit register
//      reg_nb #(31) MY_REG (
//          .data_in  (my_data_in), 
//          .pc_write       (my_ld), 
//          .clk      (my_clk), 
//          .rst      (my_clr), 
//          .data_out (my_data_out)
//          );  
//
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created: 09-09-2018
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module program_counter(data_in, clk, rst, pc_write, data_out); 
    input  [n-1:0] data_in; 
    input  clk, rst, pc_write; 
    output reg [n-1:0] data_out; 

    parameter n = 31; 
    
    always @(posedge rst, posedge clk)
    begin 
       if (rst == 1)     // asynch clr
          data_out <= 0;
       else if (pc_write == 1) 
          data_out <= data_in; 
    end
    
endmodule