`timescale 1ns / 1ps
//*****************************************************************************//
//    This document contains information proprietary to the                    //
//    CSULB student that created the file - any reuse without                  //
//    adequate approval and documentation is prohibited                        //
//                                                                             //
//    Class:         CECS460 System on Chip Design                             //
//    Project name:  Project3_UART_RX                                          //
//    File name:     UART_TOP.v                                                //
//                                                                             //
//    Created by Chanartip Soonthornwan on March 1, 2018.                      //
//    Copyright @ 2018 Chanartip Soonthornwan. All rights reserved.            //
//                                                                             //
//    Abstract:      A device Receiving and Transmitting data through          //
//                   UART Protocol, without using a common clock between       //
//                   this and destinated device, using number of bits          //
//                   in a frame of data to confirm the correctness             //
//                   off data collection.                                      //
//                                                                             //
//    Version 1.0:   Date: March 1, 2018                                       //
//    Version 1.1:   Date: March 18, 2018.                                     //
//                      - Moved Baud Decoder from UART_TX.v                    //
//                      - Added UART_RX.v                                      //
//    Version 1.2:   Current Date: March 20, 2018.                             //
//                      - Added wires and connections                          //
//                      - Added PEDs                                           //
//                      - Added rx Status/Data mutilplexer                     //
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
   UART TOP consists with 
      UART_TX - Transmitted Engine that shifts 1-bit data out at a Bit Time,
                and generates an interrupt signal(txrdy) indicated it is ready
                for the next transmission.
      PED     - Positive Edge Detector confirms the txrdy signal
      RS_FLOP - To hold the PED confirmation signal for a clock until being 
                reset by TramelBlaze interrupt acknowledge
      TramelBlaze - Microprocessor processes instructions from 4Kx16 bit ROM 
                    and outputint the result through OUT_PORT to UART, therefore
                    UART could transmit the data to a receiver.
      ADDR_DEC - Address Decoder decodes reading and writing strobe and sends
                 them to individual I/O.
      AISO_RST - Synchronize System Reset Signal to the whole design.
*/  
module UART_TOP(
    input        i_clk,         // System Clock
    input        i_rst,         // System Reset
    input  [3:0] i_baud,        // Baud Rate
    input        i_write,       // Write[0] signal from Address Decoder
    input  [1:0] i_read,        // Read[1:0] signal from Address Decoder
    input  [7:0] i_byte,        // Data to Transmit from TramelBlaze
    input        i_rx,          // Received Data from RX_Line
    input        i_eight,       // Eight bit Control
    input        i_pen,         // Parity bit Control
    input        i_ohel,        // Odd/Even Parity bit Control
    output       o_TX,          // Transmission line (TX_line)
    output       o_UART_INTR,   // UART Interrupt flag to TramelBlaze
    output [7:0] o_UART_DS      // UART DATA Selected output
    );

    // Interconnection wires
    wire         w_txrdy;       
    wire         w_rxrdy;
    wire         w_ped_tx_pulse;
    wire         w_ped_rx_pulse;
    wire  [18:0] w_rate;
    wire         w_perr;
    wire         w_ferr;
    wire         w_ovf;
    wire   [7:0] w_rx_dout;
    wire   [7:0] w_RX_STATUS;
    
   // Data Selecting Mux
   //   multiplexing RX_status or RX_data to Tramelblaze
   //   with corrected port_id(i_read[1:0]) requested by the Tramelblaze
    assign o_UART_DS = (i_read[1])? w_RX_STATUS :
                       (i_read[0])? w_rx_dout   : 8'b0;
   
    // Concatenating Status
    assign w_RX_STATUS = {3'b0, w_ovf, w_ferr, w_perr, w_txrdy, w_rxrdy};
         
    // Interrupt Pulse from either TX or RX Engine
    assign o_UART_INTR = w_ped_tx_pulse | w_ped_rx_pulse;
   
    // UART Receive Engine
    UART_RX uart_RX_inst
    (.i_clk(i_clk),
    .i_rst(i_rst),
    .i_read(i_read[0]),
    .i_rx(i_rx),
    .i_eight(i_eight),
    .i_pen(i_pen),
    .i_ohel(i_ohel),
    .i_rate(w_rate),
       
    .o_rxrdy(w_rxrdy),
    .o_perr(w_perr),
    .o_ferr(w_ferr),
    .o_ovf(w_ovf),
    .o_rx_dout(w_rx_dout)
    );

    // UART Transmit Engine
    UART_TX uart_TX_inst
    (.i_clk(i_clk), 
    .i_rst(i_rst),
    .i_write(i_write),
    .i_byte(i_byte),   
    .i_eight(i_eight),  
    .i_pen(i_pen),    
    .i_ohel(i_ohel),    
    .i_rate(w_rate),  

    .o_tx(o_TX),                 
    .o_txrdy(w_txrdy)    
    );


    // Positive Edge Detector(PED)
    //   Generating one-short pulse of 
    //   UART Interrupt signal
    PED 
        ped_txrdy_inst
        (.clk(i_clk), 
         .rst(i_rst), 
         .d_in(w_txrdy), 
         .pulse(w_ped_tx_pulse)
        ),
        ped_rxrdy_inst
        (.clk(i_clk), 
         .rst(i_rst), 
         .d_in(w_rxrdy), 
         .pulse(w_ped_rx_pulse)
        );

    // Baud Decoder
    //    Decode 4-bit input from switches(i_baud)
    //    to 19-bit value(k) for BIT_TIME_COUNTER
    BAUD_DEC baud_dec_inst
    ( 
      .BAUD_VAL(i_baud),
      .K(w_rate)
    );

endmodule
