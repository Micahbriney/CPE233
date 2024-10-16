`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2020 05:59:49 PM
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
    reg op_rst, op_pc_write;
    reg [1:0] op_pc_source;
    reg op_clk;
    wire [31:0] ir;
    
    Top_Level Top_Level_Sim(
        .op_clk(op_clk),
        .op_rst(op_rst),
        .op_pc_write(op_pc_write),
        .op_pc_source(op_pc_source),
        .ir(ir)
    );
    
    always
    begin
        op_clk = 1; #5;
        op_clk = !op_clk; #5;
    end
    
    initial
    begin
        //test 1 rset the Program Counter
        op_rst       = 1; #15;
        op_pc_write  = 1; #15;
        op_pc_source = 1; #15;
        
        //test 2
        op_rst       = 0; #15;
        op_pc_write  = 1; #15;
        op_pc_source = 1; #15;
        
        //test 3
        op_rst       = 0; #15;
        op_pc_write  = 0; #15;
        op_pc_source = 1; #15;
        
        //test 4
        op_rst       = 0; #15;
        op_pc_write  = 0; #15;
        op_pc_source = 0; #15;
        
        //test 5
        op_rst       = 1; #15;
        op_pc_write  = 0; #15;
        op_pc_source = 1; #15;
                
        //test 6
        op_rst       = 1; #15;
        op_pc_write  = 0; #15;
        op_pc_source = 0; #15;
        
        //test 7
        op_rst       = 1; #15;
        op_pc_write  = 1; #15;
        op_pc_source = 0; #15;
        
        //test 8
        op_rst       = 1; #15;
        op_pc_write  = 1; #15;
        op_pc_source = 1; #15;
    end
    
endmodule
