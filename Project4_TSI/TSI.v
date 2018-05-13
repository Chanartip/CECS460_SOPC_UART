`timescale 1ns / 1ps
//*****************************************************************************//
//    This document contains information proprietary to the                    //
//    CSULB student that created the file - any reuse without                  //
//    adequate approval and documentation is prohibited                        //
//                                                                             //
//    Class:         CECS460 System on Chip Design                             //
//    Project name:  Project4_TSI                                              //
//    File name:     TSI.v                                                     //
//                                                                             //
//    Created by Chanartip Soonthornwan on May  5, 2018.                       //
//    Copyright @ 2018 Chanartip Soonthornwan. All rights reserved.            //
//                                                                             //
//    Abstract:      Technology Specific Interface as a buffer for SOPC I/O    //
//                                                                             //
//    Version 1.0:   Date: May  5, 2018.                                       //
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
module TSI(

    // FPGA INPUTS
    input       SYS_CLK,         // System Clock
    input       SYS_RST,         // System Reset
    input       i_RX,   
    input [6:0] i_SW,

    // FPGA OUTPUTS
    output       o_TX,          // Transmit Line Output
    output [7:0] o_LED,         // On-Board LEDs

    // INPUTS FROM SOPC CORE
    input        i_TX,
    input  [7:0] i_LED,

    // OUTPUTS TO SOPC CORE
    output       o_CLK, 
    output       o_RST,
    output       o_RX,
    output [6:0] o_SW
    
);

    // Dedicated Input Clock Buffer
    IBUFG #( .IOSTANDARD("DEFAULT") )
    SYSTEM_CLK(
        .O(  o_CLK),
        .I(SYS_CLK)
    );
    
    // System Reset
    IBUF #( .IOSTANDARD("DEFAULT") )
    SYSTEM_RESET(
        .O(  o_RST),
        .I(SYS_RST)
    );
    
    // UART I/O
    OBUF #( .IOSTANDARD("DEFAULT") )
    TX(
        .O(o_TX),
        .I(i_TX)
    );
    IBUF #( .IOSTANDARD("DEFAULT") )
    RX(
        .O(o_RX),
        .I(i_RX)
    );
    
    // LEDs
    OBUF #( .IOSTANDARD("DEFAULT") )
    STAT_LED [7:0](
        .O(o_LED[7:0]),
        .I(i_LED[7:0])
    );
    
    // Switches
    IBUF #( .IOSTANDARD("DEFAULT") )
    SWITCHES[6:0](
        .O(o_SW[6:0]),
        .I(i_SW[6:0])
    );
    
    
endmodule
