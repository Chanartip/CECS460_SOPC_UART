`timescale 1ns / 1ps
//*****************************************************************************//
//    This document contains information proprietary to the                    //
//    CSULB student that created the file - any reuse without                  //
//    adequate approval and documentation is prohibited                        //
//                                                                             //
//    Class:         CECS460 System on Chip Design                             //
//    Project name:  Project3_UART_RX                 	                      //
//    File name:     ADDR_DECODER.v                                            //
//                                                                             //
//    Created by Chanartip Soonthornwan on March 1, 2018.                      //
//    Copyright @ 2018 Chanartip Soonthornwan. All rights reserved.            //
//                                                                             //
//    Abstract:      Decoding Address from TramelBlaze's PORT_ID               //
//                   and Read/Write Strobe to 16 addresses inputs/outputs      //
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
/*
   Assigning Each 16 inputs and 16 outputs either reading or writing
   with the wr_strobe and rd_strobe.
   note: port_id == 16'b0 is when TramelBlaze doesn't read or write.
*/
module ADDR_DECODER(port_id, wr_strobe, rd_strobe, writes, reads);

   input  [15:0] port_id;
   input         wr_strobe;
   input         rd_strobe;
   output [15:0] writes;
   output [15:0] reads;
   
   reg [15:0] writes;
   reg [15:0] reads;

   always @(*)
      begin
         writes = 16'b0;
         reads  = 16'b0;
         writes[port_id] = wr_strobe;
         reads[port_id] = rd_strobe;
      end

endmodule
