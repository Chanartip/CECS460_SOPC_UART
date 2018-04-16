`timescale 1ns / 1ps
//*****************************************************************************//
//    This document contains information proprietary to the                    //
//    CSULB student that created the file - any reuse without                  //
//    adequate approval and documentation is prohibited                        //
//                                                                             //
//    Class:         CECS460 System on Chip Design                             //
//    Project name:  Project3_UART_RX                                          //
//    File name:     RX_REMAP.v                                                //
//                                                                             //
//    Created by Chanartip Soonthornwan on March 18, 2018.                     //
//    Copyright @ 2018 Chanartip Soonthornwan. All rights reserved.            //
//                                                                             //
//    Abstract:      A combinational block to re-arrange incoming data         //
//                   by shifting the data to its correct place accroding       //
//                   the data controls, and ensures that the data frame        //
//                   is ready to be for error checking.                        //
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
   Receiving Engine Datapath Remapping module
      Rearranging Received data from RX Shift Register according to
      the control:
      by default: there are 7-bit data plus one stop bit (8 bits)
      if eight  : there are 8-bit data plus one stop bit (9 bits)
      if pen    : there are 7-bit data plus one parity bit 
                  and one stop bit(9 bits)
      if pen and eight: there are 10 bits in total.
      
      such that 8 bits will be stopped shifting and be off by 2 bit,
      therefore 8 bits data will be right shifted by 2.
      likewise, 9 bits will be shifted by 1, but 10 bits will no be shifted.
*/
module RX_REMAP(
   input       i_eight,       // Eight-bit data select
   input       i_pen,         // Parity-bit select
   input [9:0] i_data,        // 10-bit data from RX Shift Register
   output reg [9:0] o_data    // Remapped data
    );
   
   always@(*) begin
      case({i_eight,i_pen})
         2'b00: o_data = {2'b11, i_data[9:2]};
         2'b01: o_data = {1'b1 , i_data[9:1]};
         2'b10: o_data = {1'b1 , i_data[9:1]};
         2'b11: o_data = i_data;
      endcase
   end

endmodule
