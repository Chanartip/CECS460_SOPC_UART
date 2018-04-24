`timescale 1ns / 1ps
//*****************************************************************************//
//    This document contains information proprietary to the                    //
//    CSULB student that created the file - any reuse without                  //
//    adequate approval and documentation is prohibited                        //
//                                                                             //
//    Class:         CECS460 System on Chip Design                             //
//    Project name:  Project3_UART_RX                 	                      //
//    File name:     SHIFT_R.v                                                 //
//                                                                             //
//    Created by Chanartip Soonthornwan on March 1, 2018.                      //
//    Copyright @ 2018 Chanartip Soonthornwan. All rights reserved.            //
//                                                                             //
//    Abstract:      Serial right shifting input through by Serial Data        //
//                   Output(SDO) when received SHIFT signal, and reload        //
//                   new Data package(DIN) when LOAD is active.                //
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
module SHIFT_R(
   // inputs
   CLK,           // System clock
   RST,           // System reset
   LOAD,          // Load new Data Input signal
   SHIFT,         // Shifting signal
   SDI,           // Serial Data input on shifting
   DIN,           // Package Data to shift
   // outputs
   SDO            // a-bit of shifted data
);
   input        CLK;
   input        RST;
   input        LOAD;
   input        SHIFT;
   input        SDI;
   input [10:0] DIN;
   output       SDO;
   
   parameter ONES = 11'h7FF;
   
   reg   [10:0] SR;
   
   // Output is always the LSB of Serial Data
   assign SDO = SR[0];
   
   /* Load new data package when LOAD is active,
      and shift right the data when SHIFT is active. 
      Otherwise, the serial data stay the same. */
   always@(posedge CLK, posedge RST)
      if(RST)  SR <= ONES;   
      else      
         if(LOAD)  SR <= DIN; else 
         if(SHIFT) SR <= {SDI,SR[10:1]};
         else      SR <= SR;
         
endmodule
