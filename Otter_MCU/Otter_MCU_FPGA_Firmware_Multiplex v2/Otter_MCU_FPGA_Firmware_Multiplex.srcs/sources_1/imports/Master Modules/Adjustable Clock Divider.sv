`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Micah Briney
// 
// Create Date: 11/25/2019 10:13:19 PM
// Design Name: 
// Project Name: Clock Shot
// Target Devices: Basys3 Board
// Description: Clock divider will take input and calculate the "hold" time. The
// hold time will maintain the output signal. run the clock at and output the 
// desired frequency. The div_value formula is for boards with 100Mz internal clocks.
// If the board utilizes a differnt internal clock rate then the numerator value will
// be different.
//
//
//      //- Usage example for instantiating 3 Hz clock
//      Clk_Div MY_CLK (
//      	.clk     (board_clk),
//      	.fclk    (1),           //1 - board_clk; 0 - impulse_freq
//      	.div     (impulse_freq),
//      	.div_clk (slo_clk)
//      	);  
//
// The input data signal div is a decimal value of the desired frequency.
// Example: .div  (10) will cause slo_clk signal to have a frequency of 10 Hz. 
//          .fclk (1)  will override .div (10) resulting in slo_clk <= board_clk.
//
//          .div  (3) will cause div_clk to output a clock rate of 3 Hz.
//          .fclk (0) will result in slo_clk having a divided signal.
// Revision:
// Revision 1.00 - File Created: 11/25/2019
// Revision 1.01 - Added additional comments and made more modular. 1/15/2020
// Revision 1.02 - Added clk passthrough fclk for testing purposes. 1/16/2020
//
//////////////////////////////////////////////////////////////////////////////////

//Counter based
module Clk_Div(
    input clk,                  //100 MHz signal
    input fclk,                 //Passthrough control signal
    input int div,              //Desired frequency
    output logic div_clk = 0    //Divided clock output signal
    );
    
    integer div_value;          //sentinel 
    integer i = 0;              //counter
    
    //formula for hold time using desired frequency
    //div_value will store the counter range
    assign div_value = 100000000 / (2 * div) - 1;   //Unsure how floating point numbers are handled
    
    //count up to hold value
    always@ (posedge clk) begin
            if (i == div_value)
                i <= 0;          //reset count
            else
                i <= i + 1;       //increment count
        end
    
    //divide clock
    always@ (posedge clk) begin
            if (fclk == 1)
                div_clk = 0;          //passthrough
            else if (i == div_value)
                div_clk <= ~div_clk;    //flip the signal
            else
                div_clk <= div_clk;     //store value
        end
endmodule
