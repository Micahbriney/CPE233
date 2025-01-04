`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2020 05:25:59 PM
// Design Name: 
// Module Name: Top_Sim
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


module Top_Sim(
    );
    reg btn, clk;
    wire [3:0] an;
    wire [7:0]sseg;
    wire [3:0] led;
    integer i;
    //Fibonacci_Top inst_1( .*); //Wild card port connection only works in SV?
    Fibonacci_Top inst_1( .btn(btn), .clk(clk), .an(an), .sseg(sseg), .led(led));
    
    always
    begin
        clk = 1; #5;
        clk = ~clk; #5;
    end 

    initial begin
            //test 1
            
//            for(i = 0; i < 121; i = i + 5)
//            begin
//                btn = 0; #i;
//                btn = !btn; #i;
//            end
//            btn = 0;
            //btn = 0; #5;
            btn = 1; #15;
            btn = 0;
            
//            btn = 0; #10;
//            btn = 1; #10;
            
//            btn = 0; #15;
//            btn = 1; #15;
            
//            btn = 0; #20;
//            btn = 1; #20;
            
//            btn = 0; #25;
//            btn = 1; #25;
            
            
        end
endmodule
