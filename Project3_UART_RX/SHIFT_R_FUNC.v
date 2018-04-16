`timescale 1ns / 1ps
//*****************************************************************************//
//    This document contains information proprietary to the                    //
//    CSULB student that created the file - any reuse without                  //
//    adequate approval and documentation is prohibited                        //
//                                                                             //
//    Class:         CECS460 System on Chip Design                             //
//    Project name:  Project3_UART_RX                 	                      //
//    File name:     SHIFT_R_FUNC.v                                            //
//                                                                             //
//    Created by Chanartip Soonthornwan on March 1, 2018.                      //
//    Copyright @ 2018 Chanartip Soonthornwan. All rights reserved.            //
//                                                                             //
//    Abstract:      A function block to setup data package for                //
//                   SHIFT_R module                  								    //
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
module SHIFT_R_FUNC(
   // inputs
   BYTE,          // 8-bit data from TramelBlaze out_port
   EIGHT,         // 7-or-8-bit to be trasmitted
   PEN,           // Parity bit Enable
   OHEL,          // Odd-High-Even-Low to clarify which parity bit to send
   // outputs
   DOUT           // 11-bit data package to SHIFT_R
);

   input  [ 7:0] BYTE;
   input         EIGHT;
   input         PEN;
   input         OHEL;
   output [10:0] DOUT;
   reg    [10:0] DOUT;
   
    // Shift Register Data input Logic
   always@(*) begin
     DOUT[8:0] = {BYTE[6:0],1'b0,1'b1};
     case({EIGHT, PEN, OHEL})
       3'b000: DOUT[10:9] = 2'b11;
       3'b001: DOUT[10:9] = 2'b11;
       3'b010: DOUT[10:9] = {1'b1, ^BYTE[6:0]};    // Even Parity[7]
       3'b011: DOUT[10:9] = {1'b1,~^BYTE[6:0]};    // Odd Parity[7]
       3'b100: DOUT[10:9] = {1'b1,BYTE[7]};
       3'b101: DOUT[10:9] = {1'b1,BYTE[7]};
       3'b110: DOUT[10:9] = { ^BYTE[7:0],BYTE[7]}; // Even Parity[8]
       3'b111: DOUT[10:9] = {~^BYTE[7:0],BYTE[7]}; // Odd Parity[8] 
     endcase
   end
   
endmodule
