`timescale 1ns / 1ps
//*****************************************************************************//
//    This document contains information proprietary to the                    //
//    CSULB student that created the file - any reuse without                  //
//    adequate approval and documentation is prohibited                        //
//                                                                             //
//    Class:         CECS460 System on Chip Design                             //
//    Project name:  Project3_UART_RX                                          //
//    File name:     UART_TX.v                                                 //
//                                                                             //
//    Created by Chanartip Soonthornwan on March 18, 2018.                     //
//    Copyright @ 2018 Chanartip Soonthornwan. All rights reserved.            //
//                                                                             //
//    Abstract:      Transmitted Engine for UART to send data to a receiver    //
//                   with specific Baud Rate, parity, and number of bit        //
//                   in the data package(7 or 8 bit)                           //
//                                                                             //
//    Version 1.0:   Date: March 1, 2018                                       //
//    Version 1.1:   Current Date: March 18, 2018.                             //
//                      - Moved Baud Decoder to UART_TOP.v                     //
//                      - Changed 4-bit i_baud port to 19-bit i_rate           //
//                            for previous k (bit time count constant) value   //
//                      - Changed port name i_ld to i_write                    //
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
   UART Transmit Engine
         Trasmit data to UART Receiver at a specific Baud Rate (assigned by i_baud)
      through BAUD_DEC coverting a 19-bit counter for BIT_TIME_COUNTER to 
      count the period for each bit transmission, while BIT_COUNTER counts bits
      will be sent in a transmission (11-bit at a time.)
      
         Everytime BIT_TIME_COUNTER finished count a bit time, Bit Time Up(w_btu)
      will revoke the BIT_COUNTER to start counting the next bit time, and
      SHIFT_R to start shifting the next bit.
         
         Once all 11-bit has been shifted, BIT_COUNTER set w_done to indicate
      the data package's transmission is finised, and then set o_txrdy
      and reset r_doit for BIT_TIM_COUNTER to reset it's counter for the next
      bit time counting.
*/
module UART_TX(
   input         i_clk,    // System clock
   input         i_rst,    // System reset
   input         i_write,  // Load
   input  [ 7:0] i_byte,   // 8-bit Data_in
   input         i_eight,  // 7-bit/8-bit selection (Low 7-bit, High 8-bit)
   input         i_pen,    // Parity Bit Enable
   input         i_ohel,   // Odd High / Even Low Parity bit
   input  [18:0] i_rate,   // Baud Value for selecting Baud Rate
   
   output        o_tx,     // Transmit wire 
   output reg    o_txrdy   // High when the transmission is finished.
);
   reg  [18:0]   count; 
   reg  [ 3:0]   bit_count;
   reg           r_ld_d1;
   reg  [ 7:0]   r_byte;
  
   wire          w_doit;
   wire          w_btu;
   wire          w_done;
   wire [10:0]   w_sh_data;
   
   // BIT_TIME_COUNTER
   //    a pulse maker creates a pulse(w_btu)
   //    when bit time is up by incrementing
   //    a 19-bit counter to reach bit_time value(k)
   //    then generates a pulse with one clock period.
   assign   w_btu = (count == i_rate);
  
   always@(posedge i_clk, posedge i_rst)
      if(i_rst)  count <= 19'b0; else
      if(w_btu)  count <= 19'b0; else
      if(w_doit) count <= count + 19'b1;
      else       count <= 19'b0;

   // BIT_COUNTER
   //    a pulse maker creates a pulse(w_done)
   //    when the number of TX bits
   //    are transmitted(11 bits), and
   //    has a counter(bit_count) to keep tracking
   //    of number of bits for each bit time up.
   assign   w_done = (bit_count == 4'd11);
   
   always@(posedge i_clk, posedge i_rst)
      if(i_rst)           bit_count <= 4'b0; else
      if(w_doit) begin
            if(w_btu)     bit_count <= bit_count + 4'b1;
            else          bit_count <= bit_count;
         end
      else                bit_count <= 4'b0;
      
   // RS FLOP instances for TXRDY
   //    Set output(o_txrdy) at sys_reset
   //    holding the output until the 11-bit
   //    transmission is done(w_done)
   always@(posedge i_clk, posedge i_rst)
      if(i_rst)    o_txrdy <= 1'b1;
      else
         case({w_done,i_write})
            2'b00: o_txrdy <= o_txrdy;
            2'b01: o_txrdy <= 1'b0;
            2'b10: o_txrdy <= 1'b1;
            2'b11: o_txrdy <= o_txrdy;
         endcase
   
   // RS FLOP instance for DONE
   //    holding w_doit signal until got reset
   //    by w_done.
   RS_FLOP 
       rs_doit_inst
       (.CLK(i_clk), 
       .RST(i_rst), 
       .R(w_done), 
       .S(r_ld_d1), 
       .Q(w_doit)
       );
   
   // LOAD_D1 FLOP
   //    holding load signal for a clock
   always@(posedge i_clk, posedge i_rst)
      if(i_rst) r_ld_d1 <= 1'b0;
      else      r_ld_d1 <= i_write;
   
   // LOAD BYTE for SHIFT REGISTER
   //    loading new 8-bit data when 
   //    got a load signal(i_write)
   always@(posedge i_clk, posedge i_rst)
      if(i_rst)    r_byte <= 8'b0;   else
      if(i_write)  r_byte <= i_byte;
      else         r_byte <= r_byte;
   
   // SHIFT REGISTER FUNCTION
   //    Arrange 8-bit incoming data and 
   //    output an 11-bit data for shift register
   //    according to 3-bit parity control.
   SHIFT_R_FUNC sh_func_inst
   (.BYTE(r_byte),
    .EIGHT(i_eight),
    .PEN(i_pen),
    .OHEL(i_ohel),
    .DOUT(w_sh_data)
   );
   
   // SHIFT REGISTER
   //    Serially shifts right the 11-bit data
   //    through TX(o_tx) every bit-time up,
   //    and receives new 11-bit data at load
   //    signal(r_ld_d1)
   SHIFT_R sh_r_inst
   (.CLK(i_clk),
    .RST(i_rst),
    .LOAD(r_ld_d1),
    .SHIFT(w_btu),
    .SDI(1'b1),
    .DIN(w_sh_data),
    .SDO(o_tx)
   ); 
    
endmodule  
   