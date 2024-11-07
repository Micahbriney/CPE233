`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2019 08:05:46 PM
// Design Name: 
// Module Name: Lab_03_BB
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


module Lab_03_BB(
        input [3:0] A,
        input [3:0] B,
        output [6:0] Seg,
        output [3:0] AN
    );
        logic       Sel;
        logic [3:0] bcd;
        logic [3:0] zero = 4'b1110;
        logic [3:0] one  = 4'b1111;
        
        Ripple_Carry_Adder RCA1 ( .A(A), .B(B), .Cout(Sel), .Sum(bcd));
        mux2 mux2( .sel(Sel), .mux_out(AN), .zero(zero), .one(one));
        Svn_Seg_Display Svn_Seg_Display( .binary(bcd), .seg(Seg));
    
endmodule
