`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2020 01:09:42 AM
// Design Name: 
// Module Name: Top
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


module Top(
    op_clk,        //Clock input
    rst,        //PC Reset control signal
    PCWrite,    //PC Write control signal
    pcSource,   //PC Mux control signal
    u_type_imm, //U_Type instruction output
    s_type_imm  //S_Type instruction output
    );
//---------------Input Ports---------------
    input  op_clk, rst, PCWrite;
    input  [1:0] pcSource;
//---------------Output Ports---------------
    output [31:0] u_type_imm, s_type_imm;  
//---------------Internal Variables--------------- 
    wire  [31:0] pc_nt_mem;                                 //PC  output  to BAG, MUX and MEM inputs
    wire  [31:0] jalr_nt_mux, branch_nt_mux, jal_nt_mux;    //BAG outputs to MUX inputs
    wire  [31:0] j_imm_nt_bag, b_imm_nt_bag, i_imm_nt_bag;  //IG  outputs to BAG inputs
    wire  [31:0] mem_nt_ig;                                 //MEM DOUT1 output to IG
    wire  [31:0] mux_nt_pc;                                 //MUX output  to PC
    
    PC #(.n(32)) MY_PC (
        .data_in    (mux_nt_pc), 
        .ld         (PCWrite), 
        .clk        (op_clk), 
        .clr        (rst), 
        .data_out   (pc_nt_mem)
    );
        
    PC_mux  #(.n(32)) MY_4T1_MUX (
        .SEL        (pcSource), 
        .D0         ({pc_nt_mem + 4}), 
        .D1         (jalr_nt_mux), 
        .D2         (branch_nt_mux), 
        .D3         (jal_nt_mux),
        .D_OUT      (mux_nt_pc) 
    );
    
    OTTER_mem_byte OTTER_MEMORY (
        .MEM_CLK   (op_clk),
        .MEM_RDEN1 (1), 
        .MEM_RDEN2 (0), 
        .MEM_WE2   (0),
        .MEM_ADDR1 (pc_nt_mem[15:2]),
        .MEM_ADDR2 (0),
        .MEM_WD    (0),  
        .MEM_SIZE  (2),
        .MEM_SIGN  (0),
        .IO_IN     (0),
        .IO_WR     (),
        .MEM_DOUT1 (mem_nt_ig),
        .MEM_DOUT2 ()  
    ); 
    
    Branch_Adder_Gen #(.n(32)) MY_BAG(
        .pc         ({pc_nt_mem - 4}),
        .j_type     (j_imm_nt_bag),
        .b_type     (b_imm_nt_bag),
        .i_type     (i_imm_nt_bag),
        .rs1        (32'h0000000C),
        .jal        (jal_nt_mux),
        .branch     (branch_nt_mux),
        .jalr       (jalr_nt_mux)
    );
    
    Immed_Gen #(.n(32)) MY_IG(
        .ir         (mem_nt_ig),
        .u_type     (u_type_imm),
        .i_type     (i_imm_nt_bag),
        .s_type     (s_type_imm),
        .b_type     (b_imm_nt_bag),
        .j_type     (j_imm_nt_bag)
    );
        
endmodule
