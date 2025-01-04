`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Ratner Surf Designs
// Engineer:  James Ratner
// 
// Create Date: 07/07/2018 08:05:03 AM
// Design Name: 
// Module Name: fsm_template
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Generic FSM model with both Mealy & Moore outputs. 
//    Note: data widths of state variables are not specified 
//
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created (07-07-2018)
// Revision 1.01 - File used in Fibonacci Sequence lab. Updated by Micah Briney 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module fsm_template(btn, clr_fsm, rco_in, sel, clk, clr, ld, we); 
    input  btn, clr_fsm, rco_in, clk; 
    output reg sel, clr, ld, we;
     
    //- next state & present state variables
    reg [1:0] NS, PS; 
    //- bit-level state representations
    parameter [1:0] hold=2'b00, ini_first=2'b01, ini_second=2'b10, sum=2'b11; 
    

    //- model the state registers
    always @ (negedge clr_fsm, posedge clk)
       if (clr_fsm == 0)                    //active high reset. Not used 
          PS <= hold; 
       else
          PS <= NS; 
    
    
    //- model the next-state and output decoders
    always @ (btn,rco_in, PS)
    begin
       sel = 0;
       ld = 0; 
       we = 0; 
       clr = 0; // initailize all outputs low
       case(PS)
          hold:
          begin
             sel = 0;
             ld = 0;
             we = 0;       
             if (btn == 1)
             begin
                clr = 1;        //If btn is high clr counter
                NS = ini_first; 
             end  
             else               //Holding when btn is not pressed
             begin
                clr = 0; 
                NS = hold; 
             end  
          end
          
          ini_first:
             begin
                ld = 1;         //Load registers with mux value
                we = 1;         //Write enable RAM
                sel = 1;        //sel 1 for muxs sends 1'b1 to register and RAM
                clr = 0;
                NS = ini_second;//Unconditional state change
             end   
             
          ini_second:
             begin
                ld = 0;         //Do not load registers
                we = 1;         //always writing to RAM
                sel = 1;        //sel 1 for mux sends 1'b1 to RAM. Reg do not load
                clr = 0; 
                NS = sum;       //unconditional state change
            end
             
          sum:
             begin
                ld = 1;         //Load registers with mux output
                we = 1;         //Always writing to RAM
                sel = 0;        //Mux data line change
                clr = 0;        //
                if (rco_in == 0)//Remain in state till counter resets
                begin                    
                    NS = sum; 
                end  
                else
                begin           //Go to hold after all memory is loaded
                    NS = hold; 
                end  
            end   
             
        default: NS = hold; 
            
      endcase
  end              
endmodule

