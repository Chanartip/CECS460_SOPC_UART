`timescale 1ns / 1ps
//*****************************************************************************//
//    This document contains information proprietary to the                    //
//    CSULB student that created the file - any reuse without                  //
//    adequate approval and documentation is prohibited                        //
//                                                                             //
//    Class:         CECS460 System on Chip Design                             //
//    Project name:  Project3_UART_RX                                          //
//    File name:     RX_Control.v                                              //
//                                                                             //
//    Created by Chanartip Soonthornwan on March 18, 2018.                     //
//    Copyright @ 2018 Chanartip Soonthornwan. All rights reserved.            //
//                                                                             //
//    Abstract:      Manipulate Datapath control, Generating bit time          //
//                   and bit count corresponded to control input,              //
//                   utilizing a Finite State Machine detecting a             //
//                   High-to-Low Transition(Start bit)                         //
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
module RX_CONTROL(
    input        i_clk,     // System clk
    input        i_rst,     // System reset
    input [18:0] i_rate,    // Constant count for bard rate
    input        i_rx,      // Receiving bit input
    input        i_eight,   // Eight bit selection
    input        i_pen,     // Parity bit selection

    output  o_btu,          // Bit Time Up signal
    output  o_done,         // Done receiving a data frame signal
    output  o_start         // Start receiving a new frame signal
    );

    // Registers and Parameters for Finite State machine
    reg              doit;     
    reg            n_doit;
    reg             start;
    reg           n_start;
    reg  [ 1:0]     state;
    reg  [ 1:0]   n_state;

    parameter IDLE = 2'b00, START = 2'b01, DOIT = 2'b10;

    // Registers for Bit-Time counter and Bit-count coutner
    wire [18:0]   k;
    reg  [18:0]   count; 
    reg  [ 3:0]   bit_count;
    reg  [ 3:0]   num_bit;

    // BIT_TIME_COUNTER
    //    a pulse maker creates a pulse(o_btu)
    //    when bit time is up by incrementing
    //    a 19-bit counter to reach bit_time value(k)
    //    then generates a pulse with one clock period.
    //       k is a time constant holding either 
    //       regular baud rate or half baud rate.
    //       Half baud rate will be selected on the
    //       event of starting receiving a new frame of data.
    assign   o_btu = (count == k);
    assign       k = (start)? i_rate>>1 : i_rate;

    always@(posedge i_clk, posedge i_rst)
        if(i_rst)  count <= 19'b0; else
        if(o_btu)  count <= 19'b0; else
        if(doit)   count <= count + 19'b1;
        else       count <= 19'b0;

    // BIT_COUNTER
    //    a pulse maker creates a pulse(w_done)
    //    when the number of TX bits are transmitted(num_bit),
    //    and has a counter(bit_count) to keep tracking
    //    of number of bits for each bit time up.
    //       num_bit is the number of bits per frame
    //       from the transmission (start bit + data bits + stop bit)
    assign   o_done = (bit_count == num_bit);

    always@(posedge i_clk, posedge i_rst)
        if(i_rst)     bit_count <= 4'b0; else
        if(doit) begin
            if(o_btu) bit_count <= bit_count + 4'b1;
            else      bit_count <= bit_count;
        end
        else          bit_count <= 4'b0;

    always@(*)
        case({i_eight, i_pen})
        2'b00: num_bit = 4'd9;
        2'b01: num_bit = 4'd10;
        2'b10: num_bit = 4'd10;
        2'b11: num_bit = 4'd11;
    endcase

    // Finite State Machine(FSM)
    //    a state machine responses for polling RX_line(i_rx) 
    //    looking for high to low transition indicating the
    //    arrival of START bit(IDLE -> START state),
    //    and ensures that the start bit remains active(low active)
    //    for half bit-time which is the arrival of collecting
    //    data time. (START state).
    //    At the data collecting time, the state machine 
    //    signals 'doit' for datapath (DOIT state) until the
    //    end of data frame, then signals done.
    assign o_start = start;
    
    always@(posedge i_clk, posedge i_rst)
        if(i_rst) {state, start, doit} <= {2'b0,1'b0,1'b0};
        else      {state, start, doit} <= {n_state, n_start, n_doit};

    always@(*) begin
        case(state)
            IDLE: begin
                {n_state, n_start, n_doit} = (i_rx)   ? { IDLE, 2'b00} : 
                                                        {START, 2'b11} ;
                end
            START: begin
                {n_state, n_start, n_doit} = (i_rx)   ? { IDLE, 2'b00} : 
                                             (!o_btu) ? {START, 2'b11} :
                                                        { DOIT, 2'b01} ;
            end
            DOIT: begin
                {n_state, n_start, n_doit} = (o_done) ? { IDLE, 2'b00} :
																	     { DOIT, 2'b01} ;
            end
            default: {n_state, n_start, n_doit} = { IDLE, 2'b00} ;
        endcase
    end 

endmodule
