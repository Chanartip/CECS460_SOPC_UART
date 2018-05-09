`timescale 1ns / 1ps
//*****************************************************************************//
//    This document contains information proprietary to the                    //
//    CSULB student that created the file - any reuse without                  //
//    adequate approval and documentation is prohibited                        //
//                                                                             //
//    Class:         CECS460 System on Chip Design                             //
//    Project name:  Project3_UART_RX                                          //
//    File name:     SOPC_Core.v                                               //
//                                                                             //
//    Created by Chanartip Soonthornwan on March 25, 2018.                     //
//    Copyright @ 2018 Chanartip Soonthornwan. All rights reserved.            //
//                                                                             //
//    Abstract:      Overview of the project shows instanciates of             //
//                   UART, TramelBlaze, and other developed modules            //
//                                                                             //
//    Version 1.0:   Date: March 25, 2018.                                     //
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
module SOPC_Core(
   input       SYS_CLK,         // System Clock
   input       SYS_RST,         // System Reset
   input [3:0] SW_BAUD,         // Baud Rate Switches input
   input       SW_EIGHT,        // Eight Bit Control
   input       SW_PEN,          // Parity Bit Control
   input       SW_OHEL,         // Odd/Even Parity Bit Control
   input       i_RX,            // Receive Line Input
   output reg [7:0] o_LED,      // On-Board LEDs
   output           o_TX        // Transmit Line Output
   );
 
   // Interconnection wires
   wire        w_rst_s;
   wire        w_intr;
   wire        w_int_ack;
   wire [15:0] w_tb_outport;
   wire [15:0] w_tb_port_id;
   wire        w_wr_strobe;
   wire        w_rd_strobe;
   wire [15:0] w_writes;
   wire [15:0] w_reads;
   wire        w_uart_intr;
   wire  [7:0] w_uart_ds;
    
   // Assiging LEDs on board
   always@(posedge SYS_CLK, posedge w_rst_s)
      if(w_rst_s)     o_LED <= 8'b0; else
      if(w_writes[2]) o_LED <= w_tb_outport[7:0];
      else            o_LED <= o_LED;

   // UART Engine
   UART_TOP UART_inst(
    .i_clk(SYS_CLK), 
    .i_rst(w_rst_s), 
    .i_baud(SW_BAUD),
    .i_write(w_writes[0]),
    .i_read(w_reads[1:0]),
    .i_byte(w_tb_outport[7:0]),
    .i_rx(i_RX),
    .i_eight(SW_EIGHT), 
    .i_pen(SW_PEN), 
    .i_ohel(SW_OHEL), 
    .o_TX(o_TX),
    .o_UART_INTR(w_uart_intr),
    .o_UART_DS(w_uart_ds)
   );

   // RS flop to hold the ped pulse till reset 
   //    by TB's interrupt acknowledge 
   RS_FLOP rs_intr_inst
   (.CLK(SYS_CLK), 
    .RST(w_rst_s), 
    .R(w_int_ack), 
    .S(w_uart_intr), 
    .Q(w_intr)
    );
   
   // TramelBlaze (TB)
   tramelblaze_top tb_top
   (.CLK(SYS_CLK), 
    .RESET(w_rst_s), 
    .IN_PORT({8'b0, w_uart_ds}), 
    .INTERRUPT(w_intr), 
    .OUT_PORT(w_tb_outport), 
    .PORT_ID(w_tb_port_id), 
    .READ_STROBE(w_rd_strobe), 
    .WRITE_STROBE(w_wr_strobe), 
    .INTERRUPT_ACK(w_int_ack)
    ); 
    
   // Vector Interrupt Controller (VIC 
//   VIC vic_inst
//   (.clk(SYS_CLK), 
//    .rst(w_rst_s), 
//    .cs(), 
//    .datain(), 
//    .port_id(w_tb_port_id), 
//    .read_strobe(w_rd_strobe), 
//    .write_strobe(), 
//    .dout(), 
//    .interrupts(), 
//    .IntAck(), 
//    .InterruptOut()
//    );
    
   // Address Decoder
   ADDR_DECODER addr_dec_inst
   (.port_id(w_tb_port_id), 
    .wr_strobe(w_wr_strobe), 
    .rd_strobe(w_rd_strobe), 
    .writes(w_writes), 
    .reads(w_reads)
    );
   
   // Asynchronized Input, Synchronized Output
   AISO_RST aiso_inst
   (.clk(SYS_CLK), 
    .rst(SYS_RST), 
    .rst_s(w_rst_s)
   );


endmodule
