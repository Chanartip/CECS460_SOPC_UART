`timescale 1ns / 1ps
//*****************************************************************************//
//    This document contains information proprietary to the                    //
//    CSULB student that created the file - any reuse without                  //
//    adequate approval and documentation is prohibited                        //
//                                                                             //
//    Class:         CECS460 System on Chip Design                             //
//    Project name:  Project3_UART_RX                 	                      //
//    File name:     RS_FLOP.v                                                 //
//                                                                             //
//    Created by Chanartip Soonthornwan on March 1, 2018.                      //
//    Copyright @ 2018 Chanartip Soonthornwan. All rights reserved.            //
//                                                                             //
//    Abstract:      RS flip flop is another kind of flop 						    //
//							outputs LOW at posedge of reset or R, 						    //
//							outputs HIGH at posedge of S	  								    //
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
/* PORT LISTS
 * Inputs: CLK - Clock
 *         RST - Reset(System)
 *         R   - Reset(Input)
 *         S   - Set(Input)
 * Output: Q   - Data out
 */
module RS_FLOP(CLK, RST, R, S, Q);
   input       CLK, RST;
   input           R, S;   
   output  reg        Q;  
   
   always@(posedge CLK, posedge RST)
      if(RST) Q <= 1'b0;
      else
         case({S,R})
            2'b00: Q <= Q;
            2'b01: Q <= 1'b0;
            2'b10: Q <= 1'b1;
            2'b11: Q <= Q;
         endcase

endmodule
