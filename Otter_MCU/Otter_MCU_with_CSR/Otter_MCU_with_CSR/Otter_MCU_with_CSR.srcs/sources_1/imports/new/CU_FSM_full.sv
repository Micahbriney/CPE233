`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Ratner Surf Designs
// Engineer: James Ratner
// 
// Create Date: 01/07/2020 09:12:54 PM
// Design Name: 
// Module Name: top_level
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Control Unit Template/Starter File for RISC-V OTTER
//
//    //- instantiation template 
//    CU_FSM OTTER_CU_FSM(
//        .intr     (),
//        .clk      (),
//        .RST      (),
//        .funct3   (),   // ir[14:12]
//        .opcode   (),   // ir[6:0]
//        .pcWrite  (),
//        .regWrite (),
//        .memWE2   (),
//        .memRDEN1 (),
//        .memRDEN2 (),
//        .rst      (),
//        .csr_WE,  (),
//        .int_taken(),
//        };
//   
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created - 02-01-2020 (from other people's files)
//          1.01 - (02-08-2020) switched states to enum type
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module CU_FSM(
    input intr,
    input clk,
    input RST,
    input [2:0] funct3,     // ir[14:12]
    input [6:0] opcode,     // ir[6:0]
    output logic pcWrite,
    output logic regWrite,
    output logic memWE2,
    output logic memRDEN1,
    output logic memRDEN2,
    output logic rst,
    output logic csr_WE,
    output logic int_taken
  );
//----------------------------------------------------------------
//--Enumerated datatypes for symbolic naming----------------------
//----------------------------------------------------------------
//--Register state names------------------------------------------
    typedef enum logic [1:0] {
        st_FET,
        st_EX,
        st_WB,
        st_INTR
    }   state_type;
//--RISC-V opcodes------------------------------------------------
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
        SYS    = 7'b1110011             //CSR opcode
    }   opcode_t;
//--CSR--------------------------------
    typedef enum logic [2:0] {	             //Not used
        CSRRW = 3'b001,	                    //Not used
        MRET  = 3'b000	                     //Not used
    }   func3_t;	                           //Not used
//--Define FUNC3, OPCODE, NS, NS, temp_NS-------------------------
	opcode_t OPCODE;	                      //Not used
	state_type NS, PS, temp_NS;        //temp_NS value of next state
	func3_t FUNC3;	                            //Not used
//--Assign and cast inputs ---------------------------------------
	assign FUNC3  = func3_t'(funct3);	         //Not used
	assign OPCODE = opcode_t'(opcode); 
//--Assign reset output-------------------------------------------
	assign rst = RST;
	//assign temp_NS = st_FET;
//----------------------------------------------------------------
//--State register------------------------------------------------
//----------------------------------------------------------------
	always @ (posedge clk)
        if (RST == 1)begin
            PS  <= st_FET;
        end else begin 
            PS  <= NS;
    end
//----------------------------------------------------------------
//--Interrupt Controller------------------------------------------
//----------------------------------------------------------------
    always_comb begin
        if(intr)begin                       //Interrupt check
            temp_NS <= st_INTR;             //temporary NS
        end else begin
            temp_NS <= st_FET;              //default to st_FET
        end
    end
//----------------------------------------------------------------
//--Controller----------------------------------------------------
//----------------------------------------------------------------    
    always_comb begin              
//------schedule all output to avoid latch------------------------
        pcWrite   <= 1'b0;    
		regWrite  <= 1'b0;      
		memWE2    <= 1'b0;     
		memRDEN1  <= 1'b0;    
		memRDEN2  <= 1'b0;
		csr_WE    <= 1'b0;
		int_taken <= 1'b0;
//------State controls--------------------------------------------
        case (PS)
//------Waiting State---------------------------------------------
            st_FET: begin
                    memRDEN1 <= 1'b1;
                    NS       <= st_EX; 
            end
//----------Decode + Execute State--------------------------------
            st_EX:  begin
                    pcWrite  <= 1'b1;
                    regWrite <= 1'b1;
				    memRDEN1 <= 1'b0;

//------------------Check instruction OPCODES---------------------                
                    case (OPCODE)
                        LOAD: 	 begin                  //Instructions: LB, LH, LW, LBU, LHU
                                 pcWrite  <= 1'b0;
                                 regWrite <= 1'b0;
                                 memRDEN2 <= 1'b1;
                                 NS       <= st_WB;
                        end
                        LUI:     NS       <= temp_NS;
                        AUIPC:   NS       <= temp_NS;
                        JAL:     NS       <= temp_NS;
                        JALR:    NS       <= temp_NS;
                        OP_IMM:  NS       <= temp_NS;   //Instructions: ADDI, SLTI, SLTIU, ORI, XORI, ANDI, SLLI, SRLI, SRAI
                        OP_RG3:	 NS       <= temp_NS;   //Instructions: ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND
                        BRANCH:  begin                  //Instructions: BEQ, BNE, BLT, BGE, BLTU, BGEU
                                 regWrite <= 1'b0;
                                 NS       <= temp_NS;
                        end
                        STORE:	 begin                  //Instructions: SB, SH, SW
                                 regWrite <= 1'b0;
                                 memWE2   <= 1'b1;
                                 NS       <= temp_NS;
                        end
                        SYS:     begin
                                 csr_WE   <= 1'b1;
                        end
                        default: begin
                                 regWrite <= 1'b0;
                                 NS       <= temp_NS;
                        end
                    endcase
                    
//                    if(opcode == STORE)begin
//                        NS <= st_WB;
//                    end
//                    else if(opcode == SYS)
//                        NS <= 
//                    end
            end
//----------Writeback state---------------------------------------
            st_WB:  begin
				    regWrite <= 1'b1;
				    pcWrite  <= 1'b1;
				    memRDEN2 <= 1'b0;
				    NS       <= temp_NS;
            end
//----------Interrupt state---------------------------------------
            st_INTR: begin
                     pcWrite   <= 1'b1;
                     regWrite  <= 1'b1;
                     memWE2    <= 1'b0;
                     csr_WE    <= 1'b1;      //might be redundent
                     int_taken <= 1'b1;
                     NS        <= st_FET;
            end
//----------Default state-----------------------------------------
            default: NS <= st_FET;
        endcase
    end
endmodule