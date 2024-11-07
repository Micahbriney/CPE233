`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2019 07:39:03 PM
// Design Name: 
// Module Name: Lab_04
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Additional Comments: Lab_04 top model performs signed addition.
// 
//////////////////////////////////////////////////////////////////////////////////


module Lab_04(
    input [3:0] A,      //input from the 4 right most switches 
    input [3:0] B,      //input from switch 8-5 starting on the right
    input sub,          //subtraction input switch on the far left
    output [6:0] seg,   //segment output to display 7 bits
    output [3:0] AN,    //Anode output turned on/off display
    output neg          //negative LED output
    );
    logic [3:0] T1, T3, T4, T5; //T1,3,4,5 temp variables 4 bits
    logic T7, T6;               //T7, T6 1 bit
    assign T6 = T3[3]&T7;       //T6 And gate sets T6 to 1 when Sum/T3[3] bit and V/T7 both = 1
    assign neg = T6;            //Assign AND gate/T6 output to neg bit LED

    //m_01 decides if B is B or NOT B using sub input
    mux2 m_01( .one(~B), .zero(B), .sel(sub), .mux_out(T1));
    
    //rca_01 performs addition 
    Ripple_Carry_Adder rca_01( .A(A), .B(T1), .Cin(sub), .Sum(T3));
    
    //rca_02 NOTs T3 and adds 1. Applied only when T3[3] AND T7[3] = 1
    Ripple_Carry_Adder rca_02( .A(~T3), .B(4'b0000), .Cin(1), .Sum(T4));

    //v_chk check if T3[3] is valid sign output
    v_chk v_chk_01( .A(A[3]), .B(T1[3]), .S(T3[3]), .V(T7));
    
    //m_02 turns on anode if validity = 1 (true).
    mux2 m_02( .one(4'b1110), .zero(4'b1111), .sel(T7), .mux_out(AN)); 

    //m_02 sends radix complement to Svn_seg_display if T6 && T3[3] are 1
    mux2 m_03( .one(T4), .zero(T3), .sel(T6), .mux_out(T5));

    //ssd output correct bits to illuminate hex value of summed value
    Svn_Seg_Display ssd_01( .binary(T5), .seg(seg));

    
endmodule
