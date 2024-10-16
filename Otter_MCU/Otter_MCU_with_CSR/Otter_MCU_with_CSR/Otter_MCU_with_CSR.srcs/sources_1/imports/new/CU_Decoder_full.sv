`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Surf Designs
// Engineer: James Ratner
// 
// Create Date: 01/29/2019 04:56:13 PM
// Design Name: 
// Module Name: CU_Decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies:
// 
// CU_DCDR my_cu_dcdr(
//   .br_eq     (), 
//   .br_lt     (), 
//   .br_ltu    (),
//   .opcode    (),    //-  ir[6:0]
//   .func7     (),    //-  ir[31:25]
//   .func3     (),    //-  ir[14:12] 
//   .intr_taken(),
//   .alu_fun   (),
//   .pcSource  (),
//   .alu_srcA  (),
//   .alu_srcB  (), 
//   .rf_wr_sel ()   );
//
// 
// Revision:
// Revision 1.00 - File Created (02-01-2020) - from Paul, Joseph, & Celina
//          1.01 - (02-08-2020) - removed unneeded else's; fixed assignments
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module CU_DCDR(
    input br_eq,
	input br_lt,
	input br_ltu,
    input [6:0] opcode,                 //-  ir[6:0]
	input [6:0] func7,                  //-  ir[31:25]
    input [2:0] func3,                  //-  ir[14:12] 
    input intr_taken,
    output logic [3:0] alu_fun,
    output logic [2:0] pcSource,
    output logic alu_srcA,
    output logic [1:0] alu_srcB,
	output logic [1:0] rf_wr_sel
	);
    
    //- datatypes for RISC-V opcode types
    typedef enum logic [6:0] {
        LUI    = 7'b0110111,
        AUIPC  = 7'b0010111,
        JAL    = 7'b1101111,
        JALR   = 7'b1100111,
        BRANCH = 7'b1100011,
        LOAD   = 7'b0000011,
        STORE  = 7'b0100011,
        OP_IMM = 7'b0010011,
        OP_RG3 = 7'b0110011,
        SYS    = 7'b1110011
    } opcode_t;
    opcode_t OPCODE; //- define variable of new opcode type
    
    assign OPCODE = opcode_t'(opcode); //- Cast input enum 

    //- datatype for func3Symbols tied to values
    typedef enum logic [2:0] {
        //BRANCH labels
        BEQ   = 3'b000,
        BNE   = 3'b001,
        BLT   = 3'b100,
        BGE   = 3'b101,
        BLTU  = 3'b110,
        BGEU  = 3'b111
        //MRET  = 3'b000,     //Same value of BEQ. Possible source of error
        //MTVEC = 3'b001      //Same value of BNE. Possible source of error
    } func3_t;    
    func3_t FUNC3; //- define variable of new opcode type
    
    assign FUNC3 = func3_t'(func3); //- Cast input enum 
       
    always_comb
    begin 
        //- schedule all values to avoid latch
		alu_fun   <= 4'b0000;
		alu_srcA  <= 1'b0;
		alu_srcB  <= 2'b00;
		pcSource  <= 3'b00;
		rf_wr_sel <= 2'b00;
		
		case(OPCODE)
			LUI:    begin
				    alu_fun   <= 4'b1001; 
				    alu_srcA  <= 1'b1;
                    alu_srcB  <= 2'b01;
				    rf_wr_sel <= 2'b11; 
    		end
			AUIPC:  begin
			        alu_srcA  <= 1'b1;
				    alu_srcB  <= 2'b11;
				    rf_wr_sel <= 2'b11; 
			end
			JAL:    pcSource <= 3'b011;
			JALR:   pcSource <= 3'b001;
			LOAD:   begin
				    alu_srcB  <= 2'b01; 
				    rf_wr_sel <= 2'b10;
			end
			STORE:  alu_srcB  <= 2'b10;
			BRANCH: begin
                    case(FUNC3)
                        BEQ:  pcSource <= {1'b0, br_eq, 1'b0};
                        BNE:  pcSource <= {1'b0,!br_eq, 1'b0};
                        BLT:  pcSource <= {1'b0, br_lt, 1'b0};
                        BGE:  pcSource <= {1'b0,!br_lt, 1'b0};
                        BLTU: pcSource <= {1'b0, br_ltu,1'b0};
                        BGEU: pcSource <= {1'b0,!br_ltu,1'b0};
                    endcase
            end
			OP_IMM: begin
				    alu_srcB  <= 2'b01;
				    rf_wr_sel <= 2'b11;
				    case(FUNC3)
				    	3'b101:	 alu_fun = {func7[5], FUNC3};  // instruction: SRAI, SRLI
                        default: alu_fun = {1'b0, FUNC3};      // instructions: ADDI, SLTI, XORI, ANDI, SLLI, ORI, SLTIU
				    endcase
			end
			OP_RG3: begin
                    alu_fun   <= {func7[5],FUNC3};
	                rf_wr_sel <= 2'b11;
			end
			SYS:    begin
			        if(FUNC3 == 3'b000)begin
			            pcSource <= 3'b101;
                    end
            end
		endcase
        if(intr_taken)begin
            pcSource <= 'd4;
        end
    end
endmodule