`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:44:18 04/24/2018 
// Design Name: 
// Module Name:    TopLevel 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
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
