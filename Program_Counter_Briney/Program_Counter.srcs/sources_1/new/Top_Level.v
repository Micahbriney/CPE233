`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2020 07:35:06 PM
// Design Name: 
// Module Name: Top_Mod
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


module Top_Level(
    input op_clk,
    input op_rst,
    input op_pc_write,
    input [1:0] op_pc_source,
    output [31:0] ir
);
    
    wire [31:0] pc_net_mem;
    
    pc_module #(.m(32)) PC_MOD(
        .clk(op_clk),
        .pc_source(op_pc_source),
        .pc_write(op_pc_write),
        .rst(op_rst),
        .pc_count(pc_net_mem)
    );
    
    OTTER_mem_byte #( .ACTUAL_WIDTH(14), .NUM_COL(4), .COL_WIDTH(8)) Mem_1(
        .MEM_CLK(op_clk),
        .MEM_ADDR1(pc_net_mem),
        .MEM_ADDR2(32'b0),
        .MEM_DIN2(32'b0),
        .MEM_WRITE2(1'b0),
        .MEM_READ1(1'b0),
        .MEM_READ2(1'b0),
        .ERR(),
        .MEM_DOUT1(ir),
        .MEM_DOUT2(),
        .IO_IN(32'b0),
        .IO_WR(),
        .MEM_SIZE(2'b0),
        .MEM_SIGN(1'b0)
    );
      
    
endmodule
