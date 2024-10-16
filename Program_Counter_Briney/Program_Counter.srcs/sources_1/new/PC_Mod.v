`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Micah Briney
// 
// Create Date: 01/19/2020 01:28:25 AM
// Design Name: 
// Module Name: Top_PC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
//
// pc_module #(.m(32)) PC_MOD(
//      .clk(op_clk),
//      .pc_source(op_pc_source),
//      .pc_write(op_pc_write),
//      .rst(op_rst),
//      .pc_count(pc_net_)
// );
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pc_module(
    input clk, 
    input [1:0] pc_source,
    input pc_write,
    input rst,
    output [m-1:0] pc_count
);

    wire [31:0] mux_sel_1, mux_sel_2, mux_sel_3, mux_net_pc;
    
    
    assign mux_sel_1 = 32'h4444;
    assign mux_sel_2 = 32'h8888;
    assign mux_sel_3 = 32'hcccc;
        
    parameter m = 32;
    
    mux_4t1_nb  #(.n(m)) Mux_1 (
        .SEL   (pc_source),
        .D0    ({pc_count[m-1:0] + 4'b0100}),
        .D1    (mux_sel_1),
        .D2    (mux_sel_2),
        .D3    (mux_sel_3),
        .D_OUT (mux_net_pc)
    );

    program_counter #(.n(m)) PC_Counter_1(
        .data_in  (mux_net_pc),
        .pc_write (pc_write),
        .clk      (clk),
        .rst      (rst),
        .data_out (pc_count)
    );

endmodule




