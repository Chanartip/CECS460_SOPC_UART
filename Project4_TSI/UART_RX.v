`timescale 1ns / 1ps
//*****************************************************************************//
//    This document contains information proprietary to the                    //
//    CSULB student that created the file - any reuse without                  //
//    adequate approval and documentation is prohibited                        //
//                                                                             //
//    Class:         CECS460 System on Chip Design                             //
//    Project name:  Project3_UART_RX                                          //
//    File name:     UART_RX.v                                                 //
//                                                                             //
//    Created by Chanartip Soonthornwan on March 18, 2018.                     //
//    Copyright @ 2018 Chanartip Soonthornwan. All rights reserved.            //
//                                                                             //
//    Abstract:      A top level displaying interconnection wire between       //
//                   Datapath and Control Unit of RX Engine.                   //
//                                                                             //
//    In submitting this file for class work at CSULB                          //
//    I am confirming that this is my work and the work                        //
//    of no one else.                                                          //
//                                                                             //
//    In the event other code sources are utilized I will                      //
//    document which portion of code and who is the author                     //
//                                                                             //
//    In submitting this code I acknowledge that plagiarism                    //
//    in student project work is subject to dismissal from the class           //
//                                                                             //
//*****************************************************************************//
module UART_RX(
   input         i_clk,     // System clk
   input         i_rst,     // System reset
   input         i_read,    // Read signal from TramelBlaze to clear flag status
   input         i_rx,      // RX line, 1-bit data input
   input         i_eight,   // Eight bit Control
   input         i_pen,     // Parity bit Control
   input         i_ohel,    // Odd/Even bit Control
   input  [18:0] i_rate,    // Buad Rate
   
   output        o_rxrdy,   // RX enginge ready status
   output        o_perr,    // Parity bit error status
   output        o_ferr,    // Framing error status
   output        o_ovf,     // Overflow error status
   output [ 7:0] o_rx_dout  // Received Data output to TramelBlaze
    );

   // Wires from Controls to Datapath
   wire w_btu;
   wire w_done;
   wire w_start;
   
   // Receive Engine Control Unit
   RX_CONTROL rx_ctrl_inst(
      .i_clk(i_clk), 
      .i_rst(i_rst), 
      .i_rate(i_rate),
      .i_rx(i_rx),
      .i_eight(i_eight),
      .i_pen(i_pen),

      .o_btu(w_btu),
      .o_done(w_done),
      .o_start(w_start)
       );
       
   // Receive Engine Datapath
   RX_DATAPATH rx_dp_inst(
      .i_clk(i_clk),
      .i_rst(i_rst),
      .i_read(i_read), 
      .i_btu(w_btu),
      .i_done(w_done),
      .i_start(w_start),
      .i_rx(i_rx),
      .i_eight(i_eight),
      .i_pen(i_pen),
      .i_ohel(i_ohel),

      .o_rxrdy(o_rxrdy),
      .o_perr(o_perr),
      .o_ferr(o_ferr),
      .o_ovf(o_ovf),
      .o_rx_byte(o_rx_dout)
       );

endmodule
