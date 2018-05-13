`timescale 1ns / 1ps
//*****************************************************************************//
//    This document contains information proprietary to the                    //
//    CSULB student that created the file - any reuse without                  //
//    adequate approval and documentation is prohibited                        //
//                                                                             //
//    Class:         CECS460 System on Chip Design                             //
//    Project name:  Project4_TSI                                              //
//    File name:     TopLevel.v                                                //
//                                                                             //
//    Created by Chanartip Soonthornwan on March 25, 2018.                     //
//    Copyright @ 2018 Chanartip Soonthornwan. All rights reserved.            //
//                                                                             //
//    Abstract:      Overview of the project shows instantiates of             //
//                   TSI and SOPC modules         			                   //
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
module TopLevel(
    // FPGA INPUTS
    input       SYS_CLK,        // System Clock
    input       SYS_RST,        // System Reset
    input       i_RX,   
    input [6:0] i_SW,

    // FPGA OUTPUTS
    output       o_TX,          // Transmit Line Output
    output [7:0] o_LED          // On-Board LEDs
 );

    wire        w_CLK;
    wire        w_RST;
    wire        w_TX;
    wire        w_RX;
    wire [6:0]  w_SW;
    wire [7:0]  w_LED;
    

    TSI tsi_inst(
        // FPGA INPUTS
        .SYS_CLK(SYS_CLK),      // System Clock
        .SYS_RST(SYS_RST),      // System Reset
        .i_RX(i_RX),   
        .i_SW(i_SW),

        // FPGA OUTPUTS
        .o_TX(o_TX),            // Transmit Line Output
        .o_LED(o_LED),          // On-Board LEDs

        // INPUTS FROM SOPC CORE
        .i_TX(w_TX),
        .i_LED(w_LED),

        // OUTPUTS TO SOPC CORE
        .o_CLK(w_CLK), 
        .o_RST(w_RST),
        .o_RX(w_RX),
        .o_SW(w_SW)
    );

    SOPC_Core sopc_inst(
        .SYS_CLK (w_CLK    ),    // System Clock
        .SYS_RST (w_RST    ),    // System Reset
        .SW_BAUD (w_SW[6:3]),    // Baud Rate Switches input
        .SW_EIGHT(w_SW[2]  ),    // Eight Bit Control
        .SW_PEN  (w_SW[1]  ),    // Parity Bit Control
        .SW_OHEL (w_SW[0]  ),    // Odd/Even Parity Bit Control
        .i_RX    (w_RX     ),    // Receive Line Input
        .o_LED   (w_LED    ),    // On-Board LEDs
        .o_TX    (w_TX     )     // Transmit Line Output
   );
endmodule
