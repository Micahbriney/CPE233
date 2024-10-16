`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:   Ratner Surf Designs
// Engineer:  James Ratner
// 
// Create Date: 11/14/2018 02:46:31 PM
// Design Name: 
// Module Name: cntr_up_clr_nb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Otter Wrapper: interfaces RISC-V OTTER to basys3 board. 
//
// Dependencies: 
// 
// Revision:
// Revision 1.02 - (02-02-2020) first released version; not fully tested
//          1.03 - (02-06-2020) removed typos, connected output to regs
//          1.04 - (02-08-2020) removed typo for anodes
//            
// Additional Comments: Shamelessly stolen from Joseph & Paul & Celina
// 
//////////////////////////////////////////////////////////////////////////////////

module OTTER_Wrapper(
    input clk,
    input [4:0] buttons,
    input [15:0] switches,
    output logic [15:0] leds,
    output logic [7:0] segs,
    output logic [3:0] an
    );
       
   //- INPUT PORT IDS ---------------------------------------------------------
   localparam SWITCHES_PORT_ADDR = 32'h11008000;  // 0x1100_8000
   localparam BUTTONS_PORT_ADDR  = 32'h11008004;  // 0x1100_8004
              
   //- OUTPUT PORT IDS --------------------------------------------------------
   localparam LEDS_PORT_ADDR     = 32'h1100C000;  // 0x1100_C000
   localparam SEGS_PORT_ADDR     = 32'h1100C004;  // 0x1100_C004
   localparam ANODES_PORT_ADDR   = 32'h1100C008;  // 0x1100_C008
	
   //- Signals for connecting OTTER_MCU to OTTER_wrapper 
   logic s_interrupt;  
   logic s_reset; 
   logic s_clk = 0;
   
   //- register for dev board output devices ---------------------------------
   logic [7:0]  r_segs;   //  register for segments (cathodes)
   logic [15:0] r_leds;   //  register for LEDs
   logic [3:0]  r_an;     //  register for display enables (anodes)
   
   logic [31:0] IOBUS_out;
   logic [31:0] IOBUS_in;
   logic [31:0] IOBUS_addr;
   logic IOBUS_wr;
   
   logic pos_pulse_net;
   
//   assign s_interrupt = buttons[4];
   assign s_reset = buttons[3];

   //- Instantiate RISC-V OTTER MCU 
   Otter_MCU  Otter_MCU(
        .RST        (s_reset),
        .INTR       (pos_pulse_net),
        .CLK        (s_clk),
        .IOBUS_IN   (IOBUS_in),
        .IOBUS_OUT  (IOBUS_out), 
        .IOBUS_ADDR (IOBUS_addr), 
        .IOBUS_WR   (IOBUS_wr)
    );
//// Declare Seven Segment Display /////////////////////////////////////////
//    SevSegDisp SSG_DISP (
//        .DATA_IN (r_SSEG),
//        .CLK     (s_clk),
//        .MODE    (1'b0),
//        .CATHODES(CATHODES),
//        .ANODES  (ANODES)
//    );
        
//--Declare Debouncer One Shot-------------------------------------------
    DBounce #(.n(16)) DB(  //Adjust n parameter to change dbounce
        .clk    (s_clk),
        .sig_in (buttons[4]),
        .DB_out (s_interrupt)
    );
//--
    one_shot_bdir  #(.n(3)) OneShot(
        .clk           (s_clk),
        .sig_in        (s_interrupt),
        .pos_pulse_out (pos_pulse_net),     //Not sure why there are two outputs
        .neg_pulse_out ()                   //Not sure which one to use
    );
    //- Divide clk by 2 
    always_ff @ (posedge clk)
	    s_clk <= ~s_clk;
  
    //- Drive dev board output devices with registers 
    always_ff @ (posedge s_clk)
    begin
       if (IOBUS_wr == 1)
       begin
          case(IOBUS_addr)
             LEDS_PORT_ADDR:   r_leds <= IOBUS_out[15:0];    
             SEGS_PORT_ADDR:   r_segs <= IOBUS_out[7:0];
             ANODES_PORT_ADDR: r_an  <= IOBUS_out[3:0];
             default:  	r_leds <= 0; 
          endcase
       end
    end
   
    //- MUX to route input devices to I/O Bus
	//-   IOBUS_addr is the select signal to the MUX
	always_comb
    begin
        IOBUS_in=32'b0;
        case(IOBUS_addr)
            SWITCHES_PORT_ADDR : IOBUS_in[15:0] = switches;
			BUTTONS_PORT_ADDR  : IOBUS_in[4:0]  = buttons;
            default: IOBUS_in=32'b0;
        endcase
    end
	
	//- assign registered outputs to actual outputs 
	assign leds = r_leds; 
	assign segs = r_segs; 
	assign an   = r_an; 
	
endmodule




//OLD Wrapper
//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Engineer: J. Calllenes
////           P. Hummel
//// 
//// Create Date: 01/20/2019 10:36:50 AM
//// Description: OTTER Wrapper (with Debounce, Switches, LEDS, and SSEG)
////
//// revision: made it support James' mcu definitions (lettering case) 
////          1.001 Made it support Micah Brineys MCU definitions. 
////                Instantation readability.
////
////////////////////////////////////////////////////////////////////////////////////

//module OTTER_Wrapper(
//   input CLK,
//   input BTNL,
//   input BTNC,
//   input [15:0] SWITCHES,
//   output logic [15:0] LEDS,
//   output [7:0] CATHODES,
//   output [3:0] ANODES
//   );
       
   
//    // INPUT PORT IDS ////////////////////////////////////////////////////////
//    // Right now, the only possible inputs are the switches
//    // In future labs you can add more MMIO, and you'll have
//    // to add constants here for the mux below
//    localparam SWITCHES_AD = 32'h11000000;
              
//    // OUTPUT PORT IDS ///////////////////////////////////////////////////////
//    // In future labs you can add more MMIO
//    localparam LEDS_AD     = 32'h11080000;
//    localparam SSEG_AD     = 32'h110C0000;
   
    
//   // Signals for connecting OTTER_MCU to OTTER_wrapper /////////////////////////
//    logic s_interrupt, btn_int;
//    logic s_reset,s_load;
//    //logic sclk = 1'b0;            //Uncomment to simulate. Comment to Synthesis
   
 
//    logic [15:0]  r_SSEG;// = 16'h0000;
     
//    logic [31:0] IOBUS_out,IOBUS_in,IOBUS_addr;
//    logic IOBUS_wr;
    
//    assign s_interrupt = btn_int;
    
//       //- Instantiate RISC-V OTTER MCU 
//    Otter_MCU  Otter_MCU(
//        .RST         (s_reset),
//        .INTR        (s_interrupt),
//        .CLK         (sclk),
//        .IOBUS_IN    (IOBUS_in),
//        .IOBUS_OUT   (IOBUS_out), 
//        .IOBUS_ADDR  (IOBUS_addr), 
//        .IOBUS_WR    (IOBUS_wr)
//        );

//    // Declare Seven Segment Display /////////////////////////////////////////
//    SevSegDisp SSG_DISP (.DATA_IN (r_SSEG),
//                         .CLK     (CLK),
//                         .MODE    (1'b0),
//                         .CATHODES(CATHODES),
//                         .ANODES  (ANODES)
//                         );
    
//    // Declare Debouncer One Shot  ///////////////////////////////////////////
//    debounce_one_shot DB(.CLK    (sclk),
//                         .BTN    (BTNL),
//                         .DB_BTN (btn_int)
//                         );
    
//    CLK_DIV_FS clk_div(.clk (CLK),
//                      .sclk (sclk)
//                      );
    
//    assign s_reset = BTNC;

//    //Connect Board peripherals (Memory Mapped IO devices) to IOBUS /////////////////////////////////////////
//    always_ff @ (posedge sclk)
//    begin
//    if(IOBUS_wr)
//        case(IOBUS_addr)
//            LEDS_AD: LEDS <= IOBUS_out;    
//            SSEG_AD: r_SSEG <= IOBUS_out[15:0];
//        endcase  
//    end

//    always_comb
//    begin
//        IOBUS_in=32'b0;
//        case(IOBUS_addr)
//            SWITCHES_AD: IOBUS_in[15:0] = SWITCHES;
           
//            default: IOBUS_in=32'b0;
//        endcase
//    end
//endmodule