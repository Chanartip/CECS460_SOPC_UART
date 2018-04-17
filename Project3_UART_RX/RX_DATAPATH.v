`timescale 1ns / 1ps
//*****************************************************************************//
//    This document contains information proprietary to the                    //
//    CSULB student that created the file - any reuse without                  //
//    adequate approval and documentation is prohibited                        //
//                                                                             //
//    Class:         CECS460 System on Chip Design                             //
//    Project name:  Project3_UART_RX                                          //
//    File name:     RX_DATAPATH.v                                             //
//                                                                             //
//    Created by Chanartip Soonthornwan on April 17, 2018.                     //
//    Copyright @ 2018 Chanartip Soonthornwan. All rights reserved.            //
//                                                                             //
//    Abstract:      Datapath of Receive Engine where passing transmitted      //
//                   data to the TramelBlaze and checking the data             //
//                   transmission's error.                                     //
//                                                                             //
//    Revision 1.1:  Current Date April 17, 2018                               //
//                   - Add a case of 7N1, 7O1, 7E1 outputs to TramelBlaze      //
//                                                                             //
//    Revision 1.0:  Date March 18, 2018                                       //
//                                                                             //
//    In submitting this file for class work at CSULB                          //
//    I am confirming that this is my work and the work                        //
//    of no one else.                                                          //
//                                                                             //
//    In the event other code sources are utilized I will                      //
//    document which portion of code and who is the author                     //
//                                                                             //
//    In submitting this code, I acknowledge that plagiarism                   //
//    in student project work is subject to dismissal from the class           //
//                                                                             //
//*****************************************************************************//
/*
   Receiving Enging Datapath
      Receiving data through RX_line(i_rx) to Shift Register and then REMAPP
      the received data before sending to the TramelBlaze while checking 
      the transmission's error.
*/
module RX_DATAPATH(
   input i_clk,               // System Clock
   input i_rst,               // System Reset
   input i_read,              // interrupt acknowledge from TramelBlaze
   input i_btu,               // Bit Time up signal from RX_Control
   input i_done,              // Done a frame signal from RX_Control
   input i_start,             // Start bit signal from RX_Control
   input i_rx,                // RX_Line serial input from another device
   input i_eight,             // Eight-bit selection
   input i_pen,               // Parity-bit selection
   input i_ohel,              // Odd or Even parity bit selection
   
   output reg o_rxrdy,        // Receive Engine ready signal
   output reg o_perr,         // Parity Error
   output reg o_ferr,         // Framing Error
   output reg o_ovf,          // Overflow Error
   output [7:0] o_rx_byte     // a byte output to TramelBlaze
    );

   wire [9:0] w_sh_data;      // wiring from RX_SHIFT_REG to RX_REMAP
   wire [9:0] w_map_data;     // wiring from RX_REMAP to the rest of DATAPATH

   // Receive Engine Shifting Register
   //    receives serial input through RX_line
   //    and shift a frame of data to REMAP register.
   wire   w_shift;
   assign w_shift = i_btu & ~i_start;
   
   RX_SHIFT_REG rx_shift_reg_inst(
      .CLK(i_clk), 
      .RST(i_rst), 
      .SH(w_shift), 
      .SDI(i_rx), 
      .SH_DATA(w_sh_data)
   );
   
   // Receive Engine Re-mapping Register
   //    re-arrange shifted data before sending
   //    out to TramelBlaze and for Errors Checking.
   RX_REMAP rx_remap_inst(
      .i_eight(i_eight),
      .i_pen(i_pen),
      .i_data(w_sh_data),
      .o_data(w_map_data)
   );

   // Assigning the re-mapped data to TramelBlaze
   assign o_rx_byte = (i_eight)? w_map_data[7:0]: {1'b0, w_map_data[6:0]};

   // PARITY GEN SELECT
   wire   w_par_gen_sel_mux;
   assign w_par_gen_sel_mux = (i_eight)? w_map_data[7]: 1'b0;
   
   wire   w_even;
   assign w_even = ~i_ohel;
   
   wire   w_par_even_mux;
   assign w_par_even_mux = (w_even)? (w_map_data[6:0] ^ w_par_gen_sel_mux):
                                    ~(w_map_data[6:0] ^ w_par_gen_sel_mux);
   // PARITY BIT SELECT
   wire   w_par_bit_sel_mux;
   assign w_par_bit_sel_mux = (i_eight)? w_map_data[8]: w_map_data[7];
   
   // STOP BIT SELECT
   reg w_stop_bit_sel_mux;
   always@(*)
      case({i_eight,i_pen})
         2'b00: w_stop_bit_sel_mux = w_map_data[7];
         2'b01: w_stop_bit_sel_mux = w_map_data[8];
         2'b10: w_stop_bit_sel_mux = w_map_data[8];
         2'b11: w_stop_bit_sel_mux = w_map_data[9];
      endcase
   
   // RXRDY RS_FLOP
   always@(posedge i_clk, posedge i_rst)
      if(i_rst)  o_rxrdy <= 1'b0; else
      if(i_read) o_rxrdy <= 1'b0; else
      if(i_done) o_rxrdy <= 1'b1; 
      else       o_rxrdy <= o_rxrdy;
   
   // PERR RS_FLOP
   wire   w_set_perr;
   assign w_set_perr = i_pen & i_done & (w_par_even_mux ^ w_par_bit_sel_mux);
   always@(posedge i_clk, posedge i_rst)   
      if(i_rst)      o_perr <= 1'b0; else
      if(i_read)     o_perr <= 1'b0; else
      if(w_set_perr) o_perr <= 1'b1;
      else           o_perr <= o_perr;
   
   // FERR RS_FLOP
   wire   w_set_ferr;
   assign w_set_ferr = i_done & ~w_stop_bit_sel_mux;
   always@(posedge i_clk, posedge i_rst)   
      if(i_rst)      o_ferr <= 1'b0; else
      if(i_read)     o_ferr <= 1'b0; else
      if(w_set_ferr) o_ferr <= 1'b1;
      else           o_ferr <= o_ferr;
      
   // OVF RS_FLOP
   wire   w_set_ovf;
   assign w_set_ovf = i_done & o_rxrdy;
   always@(posedge i_clk, posedge i_rst)   
      if(i_rst)      o_ovf <= 1'b0; else
      if(i_read)     o_ovf <= 1'b0; else
      if(w_set_ovf)  o_ovf <= 1'b1; 
      else           o_ovf <= o_ovf;
   
endmodule
