`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Micah Briney
// Create Date: 10/29/2019 1:03:49 AM
// Description: Finite state machine that utilizes Moore and Mealy outputs to 
// multiply two binary inputs
//////////////////////////////////////////////////////////////////////////////////
 
module Multiply_FSM(
    input clk, en,
    input [3:0] B,                  //Change this variable to match!!
    output logic [1:0] sr_sel = 0,
	output logic acc_ld = 0,
	output logic acc_clr = 0
    );
    
    parameter [2:0] Hold = 0, Start = 1, Bit_0 = 2, Bit_1 = 3, Bit_2 = 4, Bit_3 = 5;
	
	logic [2:0] NS;
	logic [2:0] PS = Hold;
	
    always_ff @ (posedge clk)           //Always flip flip depends on previous sequence
    begin
        PS = NS;
    end
									 
    always_comb                         //Combinatorial logic does not depend on previous output sequence
         begin
			case (PS)               
                                        //First state holds current values 
                                        //previous values remain in register and on display
			Hold:
                begin
                                        //Moore outputs
                    sr_sel = 0;			//Shift register holds when sr_sel = 0 
                    acc_ld = 0; 		//Accumulator does not load when acc_ld = 0
                    acc_clr = 0;		//Accumulator does not clr when acc_clr = 0
                    if (en == 1)        //When en is pressed move to next state
                        NS = Start;
                    else
                        NS = Hold;
                end
                                        //Second state starts the process of the multipication
                                        //by clearing previous values in register and setting the
                                        //shift register to the input value D
			Start:
                begin
                                        //Moore outputs
                    sr_sel = 1;			//Shift register Set Q = D
                    acc_ld = 0;
                    acc_clr = 1;		//Accumulators clears memory
                    NS = Bit_0;	        //Change to state Bit_0
                end
                                        //3rd state checks B's input for Mealy outputs
			Bit_0:
                begin
                                        //Moore outputs
                    sr_sel = 2;			//Shift regisets shifts left
                    acc_clr = 0;
                                        //Mealey outputs
                    if (B[0] == 1) begin
                            acc_ld = 1; //Accumulator's Q <= Q + D
                        end 
                     else begin
                            acc_ld = 0; //Accumulators's Q <= Q
                        end
                    NS = Bit_1;
                end
                                        //4th state checks B's input for Mealy outputs
			Bit_1:
                begin
                                        //Moore outputs
                    sr_sel = 2;			
                    acc_clr = 0;		
                                        //Mealey outputs
                    if (B[1] == 1) begin
                            acc_ld = 1;
                        end
                    else begin
                            acc_ld = 0;
                        end
                    NS = Bit_2;	        
                end
                                        //5th state checks B's input for Mealy outputs
			Bit_2:
                begin
                                        //Moore outputs
                    sr_sel = 2;
                    acc_clr = 0;
                                        //Mealey outputs
                    if (B[2] == 1) begin
                        acc_ld = 1;
                        end
                    else begin
                        acc_ld = 0;
                        end                                    
                    
                    NS = Bit_3;
                end
                                        //6th state checks B's input for Mealy outputs		
                                        //Returns to hold state when complete
			Bit_3:
                begin
                                        //Moore outputs
                    sr_sel = 0;         //Hold the Shift register
                    acc_clr = 0;
                                        //Mealey outputs
                    if (B[3] == 1) begin
                        acc_ld = 1;
                        end
                    else begin
                        acc_ld = 0;
                        end
                    NS = Hold;
                end
            default: NS = Hold;
        endcase
    end
endmodule