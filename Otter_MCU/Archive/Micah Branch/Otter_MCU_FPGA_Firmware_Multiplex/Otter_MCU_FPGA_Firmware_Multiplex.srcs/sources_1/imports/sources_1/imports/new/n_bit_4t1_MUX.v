`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Surf Designs
// Engineer: James Ratner
// 
// Create Date: 10/23/2018 07:39:17 PM
// Design Name: 
// Module Name: mux_4t1_nb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 4:1 MUX with parametized data widths
//
//  USEAGE: (for 4-bit data instantion)
//
//  n_bit_4t1_MUX  #(.n(4)) my_4t1_mux  (
//       .SEL   (), 
//       .D0    (), 
//       .D1    (), 
//       .D2    (), 
//       .D3    (),
//       .D4    (),
//       .D5    (),
//       .D_OUT ()
//       );  
// 
// Dependencies: 
// 
// Revision History:
// Revision 0.01 - File Created: 10-23-2018
//          1.01 - fixed default width error (10-28-2018)
//          1.02 - switched to non-blocking assignments
//          1.03 - switched to blockign assignments and 
//                 default value for sensitivity list
//                 switched to case statement
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

   
 module n_bit_4t1_MUX (SEL, D0, D1, D2, D3, D_OUT); 
       input  [1:0] SEL; 
       input  [n-1:0] D0, D1, D2, D3;
       output reg [n-1:0] D_OUT;  
       
       parameter n = 8; 
        
       always @(*)
       begin 
          case (SEL) 
          0:      D_OUT = D0;
          1:      D_OUT = D1;
          2:      D_OUT = D2;
          3:      D_OUT = D3;
          default D_OUT = 0;
       endcase 
		  end
                
endmodule
   