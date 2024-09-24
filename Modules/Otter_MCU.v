`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2020 10:31:46 PM
// Design Name: 
// Module Name: Lim_Otter_MCU
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


module Otter_MCU(
    RST,
    INTR,
    CLK,
    IOBUS_IN,
    IOBUS_OUT,
    IOBUS_ADDR,
    IOBUS_WR
    );
    
//---------Input Ports---------------------------------------
    input RST, INTR, CLK;
    input [31:0] IOBUS_IN;
//---------Output ports--------------------------------------
    output [31:0] IOBUS_OUT, IOBUS_ADDR;
    output IOBUS_WR;
//---------Internal Wires------------------------------------
    wire [31:0] pc_plus_four;
    wire [31:0] srcAmux_out_net, srcBmux_out_net;           //ALU operand inputs
//---------Output signals------------------------------------
    wire [31:0] mux_net_pc;                                 //PC_Mux Output
    wire [31:0] rfmux_out_net;                              //Reg_File_Mux Output
    wire [31:0] PCout_net;                                  //PC output
//---------Memory output signals-----------------------------
    wire [31:0] ir, data_out_net;                           //Instruction register
//---------Reg_File output signals---------------------------
    wire [31:0] rs1_net, rs2_net;
//---------IG output signals---------------------------------
    wire [31:0] u_type_net, i_type_net, s_type_net;
    wire [31:0] b_type_net, j_type_net;
//---------BAG output signals--------------------------------
    wire [31:0] bag_jalr_net, bag_branch_net;
    wire [31:0] bag_jal_net;
//---------CU DCDR output signals----------------------------
    wire [3:0] alu_fun_net;
    wire alu_srcA_net;
    wire [1:0] alu_srcB_net, rf_wr_sel_net;
    wire [2:0] pcSource_net;
//---------CU FSM output signals-----------------------------
    wire PCWrite_net, regWrite_net, memWE2_net, memRDEN1_net;
    wire memRDEN2_net, rst_net, csr_WE_net, int_taken_net; 
//---------BCG output signals--------------------------------
    wire br_eq_net_CU_DCDR;
    wire br_lt_net_CU_DCDR;
    wire br_ltu_net_CU_DCDR;
//---------CSR output signals--------------------------------
    wire [31:0] mepc_net_pcMux, mtev_net_pcMux;
    wire [31:0] RD_net_rfMux;
    wire mie_out;
    
    assign pc_plus_four = {PCout_net+'d4};
    assign IOBUS_OUT    = rs2_net;
    assign fms_INTR_in  = INTR && mie_out;
//---------Instantiations------------------------------------
    CSR  CSR_OTTER(
        .CLK       (CLK),
        .RST       (RST),
        .INT_TAKEN (int_taken_net),
        .ADDR      (ir[31:20]),
        .PC        (PCout_net),
        .WD        (rs1_net),
        .WR_EN     (csr_WE_net), 
        .RD        (RD_net_rfMux),
        .CSR_MEPC  (mepc_net_pcMux),  
        .CSR_MTVEC (mtev_net_pcMux), 
        .CSR_MIE   (mie_out)
        ); 

    mux_8t1_nb  #(.n(32)) PC_MUX_OTTER(
        .SEL   (pcSource_net), 
        .D0    (pc_plus_four), 
        .D1    (bag_jalr_net), 
        .D2    (bag_branch_net), 
        .D3    (bag_jal_net),
        .D4    (mtev_net_pcMux),
        .D5    (mepc_net_pcMux),
        .D6    (32'b0),
        .D7    (32'b0),
        .D_OUT (mux_net_pc)
        );

    PC #(.n(32)) MCU_PC_OTTER(
        .data_in  (mux_net_pc), 
        .ld       (PCWrite_net), 
        .clk      (CLK), 
        .clr      (rst_net), 
        .data_out (PCout_net)
        );

    n_bit_4t1_MUX  #(.n(32)) RF_MUX_OTTER(
        .SEL   (rf_wr_sel_net), 
        .D0    (pc_plus_four), 
        .D1    (RD_net_rfMux),
        .D2    (data_out_net), 
        .D3    (IOBUS_ADDR),
        .D_OUT (rfmux_out_net)
        );

    Memory MEMORY_OTTER(
        .MEM_CLK    (CLK),
        .MEM_RDEN1  (memRDEN1_net),
        .MEM_RDEN2  (memRDEN2_net),
        .MEM_WE2    (memWE2_net),
        .MEM_ADDR1  (PCout_net[15:2]),
        .MEM_ADDR2  (IOBUS_ADDR),       //POSSIBLE BUS CONTENSION ISSUE
        .MEM_DIN2   (rs2_net),
        .MEM_SIZE   (ir[13:12]),
        .MEM_SIGN   (ir[14]),
        .IO_IN      (IOBUS_IN),
        .IO_WR      (IOBUS_WR),
        .MEM_DOUT1  (ir),
        .MEM_DOUT2  (data_out_net)
        );

    RegFile RF_OTTER(
        .wd   (rfmux_out_net),
        .clk  (CLK),
        .en   (regWrite_net),
        .adr1 (ir[19:15]),
        .adr2 (ir[24:20]),
        .wa   (ir[11:7]),
        .rs1  (rs1_net),
        .rs2  (rs2_net)
        );
    
    Immed_Gen #(.n(32)) IG_OTTER(
        .ir     (ir),
        .u_type (u_type_net),
        .i_type (i_type_net),
        .s_type (s_type_net),
        .b_type (b_type_net),
        .j_type (j_type_net)
        );
    
    Branch_Adder_Gen #(.n(32)) BAG_OTTER(
        .pc     (PCout_net),
        .j_type (j_type_net),
        .b_type (b_type_net),
        .i_type (i_type_net),
        .rs1    (rs1_net),
        .jal    (bag_jal_net),
        .branch (bag_branch_net),
        .jalr   (bag_jalr_net)
        );
    
    mux_2t1_nb  #(.n(32)) ALU_SRCA_MUX(
        .SEL   (alu_srcA_net), 
        .D0    (rs1_net), 
        .D1    (u_type_net), 
        .D_OUT (srcAmux_out_net)
        );
        
    n_bit_4t1_MUX  #(.n(32)) ALU_SRCB_MUX(
        .SEL   (alu_srcB_net), 
        .D0    (rs2_net), 
        .D1    (i_type_net), 
        .D2    (s_type_net), 
        .D3    (PCout_net),
        .D_OUT (srcBmux_out_net)
        );

    ALU ALU_OTTER(
        .op_1    (srcAmux_out_net),
        .op_2    (srcBmux_out_net),
        .alu_fun (alu_fun_net),
        .result  (IOBUS_ADDR)
        );
    
    Branch_Cond_Gen #(.n(32)) BCG_OTTER(
        .rs1    (rs1_net),
        .rs2    (rs2_net),
        .br_eq  (br_eq_net_CU_DCDR),
        .br_lt  (br_lt_net_CU_DCDR),
        .br_ltu (br_ltu_net_CU_DCDR)
        );

    CU_DCDR CU_DCDR_OTTER(
        .br_eq     (br_eq_net_CU_DCDR), 
        .br_lt     (br_lt_net_CU_DCDR), 
        .br_ltu    (br_ltu_net_CU_DCDR),
        .opcode    (ir[6:0]),
        .func7     (ir[31:25]),
        .func3     (ir[14:12]),
        .intr_taken(int_taken_net),
        .alu_fun   (alu_fun_net),
        .pcSource  (pcSource_net),
        .alu_srcA  (alu_srcA_net),
        .alu_srcB  (alu_srcB_net), 
        .rf_wr_sel (rf_wr_sel_net)
        );

    CU_FSM CU_FSM_OTTER(
        .intr     (fms_INTR_in),
        .clk      (CLK),
        .RST      (RST),
        .funct3   (ir[14:12]),
        .opcode   (ir[6:0]),
        .pcWrite  (PCWrite_net),
        .regWrite (regWrite_net),
        .memWE2   (memWE2_net),
        .memRDEN1 (memRDEN1_net),
        .memRDEN2 (memRDEN2_net),
        .rst      (rst_net),
        .csr_WE   (csr_WE_net),
        .int_taken(int_taken_net)
        );    
        
endmodule
