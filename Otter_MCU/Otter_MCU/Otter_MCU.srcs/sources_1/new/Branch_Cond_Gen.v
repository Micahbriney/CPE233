`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 09:49:34 PM
// Design Name: 
// Module Name: Branch_Cond_Gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
//    Branch_Cond_Gen #(.n(32)) MY_BCG(
//        .rs1(),
//        .rs2(),
//        .br_eq(),
//        .br_lt(),
//        .br_ltu()
//        );
    
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module Branch_Cond_Gen(
    rs1,
    rs2,
    br_eq,
    br_lt,
    br_ltu
    );
    
    input [n-1:0] rs1;
    input [n-1:0] rs2;
    output reg br_eq;
    output reg br_lt;
    output reg br_ltu;
    
    parameter n = 32;
    
    always @ (rs1, rs2)
    begin
        br_eq  = rs1 == rs2;                    //Branch if equal
        br_ltu = rs1 <  rs2;                    //Branch if less than (Unsigned)
        br_lt  = $signed(rs1) < $signed(rs2);   //Branch if less than (Signed)     
    end
   
endmodule
