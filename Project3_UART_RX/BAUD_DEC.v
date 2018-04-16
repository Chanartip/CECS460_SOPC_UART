`timescale 1ns / 1ps
//*****************************************************************************//
//    This document contains information proprietary to the                    //
//    CSULB student that created the file - any reuse without                  //
//    adequate approval and documentation is prohibited                        //
//                                                                             //
//    Class:         CECS460 System on Chip Design                             //
//    Project name:  Project3_UART_RX                 	                      //
//    File name:     BAUD_DEC.v                                                //
//                                                                             //
//    Created by Chanartip Soonthornwan on March 1, 2018.                      //
//    Copyright @ 2018 Chanartip Soonthornwan. All rights reserved.            //
//                                                                             //
//    Abstract:      A function to select Baud Rate for the UART protocol  	 //
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
module BAUD_DEC(BAUD_VAL,K);

	input	 [ 3:0] BAUD_VAL;
	output [18:0] K;
   reg    [18:0] K;
	// function f() for K
	always@(*)
	  case(BAUD_VAL)
			 19'b0000: K = 19'd333333;
			 19'b0001: K = 19'd 83333;
			 19'b0010: K = 19'd 41667;
			 19'b0011: K = 19'd 20833;
			 19'b0100: K = 19'd 10417;
			 19'b0101: K = 19'd  5208;
			 19'b0110: K = 19'd  2604;
			 19'b0111: K = 19'd  1736;
			 19'b1000: K = 19'd   868;
			 19'b1001: K = 19'd   434;
			 19'b1010: K = 19'd   217;
			 19'b1011: K = 19'd   109;
			 default:  K = 19'd     0;
	  endcase
endmodule
  