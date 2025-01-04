`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2020 09:15:26 PM
// Design Name: 
// Module Name: Counter_sim
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


module Counter_sim(
    );
    reg  clk, clr, up, ld;                //up and clr control lines will be used
    reg  [n-1:0] D;                       //No data will be loaded to counter
    wire [n-1:0] count;             //Used as address lines for RAM
    wire rco;
    
    parameter n = 4;
    
    
     cntr_up_clr_nb inst_1( .clk(clk), 
                            .clr(clr), 
                            .up(up), 
                            .ld(ld), 
                            .D(D), 
                            .count(count), 
                            .rco(rco)); 
    
    initial begin
            clk = 0;                //initial clock signal
            forever #5 clk = ~clk; //flip clk signal every 10 ns
        end
        
    initial begin
            //test 1
            up = 0; #15;
            up = 1; #20;
            
            up = 0; #10;
            up = 1; #40;
            clr = 1; #10;
            clr = 0;
            
            up = 1;
            
            
        end
    
endmodule
