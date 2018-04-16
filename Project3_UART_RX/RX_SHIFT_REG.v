`timescale 1ns / 1ps
//*****************************************************************************//
//    This document contains information proprietary to the                    //
//    CSULB student that created the file - any reuse without                  //
//    adequate approval and documentation is prohibited                        //
//                                                                             //
//    Class:         CECS460 System on Chip Design                             //
//    Project name:  Project3_UART_RX                                          //
//    File name:     RX_SHIFT_REG.v                                            //
//                                                                             //
//    Created by Chanartip Soonthornwan on March 18, 2018.                     //
//    Copyright @ 2018 Chanartip Soonthornwan. All rights reserved.            //
//                                                                             //
//    Abstract:      Shifting Register to shift data received from             //
//                   RX_line into receive engine when High to Low              //
//                   Transmission occured(START bit) and at raising            //
//                   edge of Bit Time Up(BTU).                                 //
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
   Receiving Engine Shifting Register
      Shifiting input from RX_line to REMAP Register when START bit
      has been acknowledged and shifts data out on raising edge
      of bit time up(btu).
      Shifting signal(SH) is the combinational logic of BTU & ~START
*/
module RX_SHIFT_REG(CLK, RST, SH, SDI, SH_DATA);
    input        CLK;                 // System clock
    input        RST;                 // System reset
    input        SH;                  // Shifting signal
    input        SDI;                 // Serial Data Input
    output reg [9:0] SH_DATA;     	  // Shifting output
    
    always@(posedge CLK, posedge RST)
        if(RST) SH_DATA <= 10'b0; else
        if(SH)  SH_DATA <= {SDI, SH_DATA[9:1]};
        else    SH_DATA <= SH_DATA;

endmodule
