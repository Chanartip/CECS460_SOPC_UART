`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:52:39 03/20/2018
// Design Name:   SOPC_Core
// Module Name:   C:/Users/Chana/OneDrive/2018Spring_CSULB/CECS460_SOC/Projects/Project3_RX_Engine/SOPC_Core_tb.v
// Project Name:  Project3_RX_Engine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SOPC_Core
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SOPC_Core_tb;

	// Inputs
	reg SYS_CLK;
	reg SYS_RST;
	reg [3:0] SW_BAUD;
	reg SW_EIGHT;
	reg SW_PEN;
	reg SW_OHEL;
	reg i_RX;

	// Outputs
	wire [7:0] o_LED;
	wire o_TX;
    
	// Instantiate the Unit Under Test (UUT)
	SOPC_Core uut (
		.SYS_CLK(SYS_CLK), 
		.SYS_RST(SYS_RST), 
		.SW_BAUD(SW_BAUD), 
		.SW_EIGHT(SW_EIGHT), 
		.SW_PEN(SW_PEN), 
		.SW_OHEL(SW_OHEL), 
		.i_RX(i_RX), 
		.o_LED(o_LED), 
		.o_TX(o_TX)
	);
	
	always #5 SYS_CLK = ~SYS_CLK;

	initial begin
		// Initialize Inputs
		SYS_CLK = 0;
		SYS_RST = 1;
		SW_BAUD = 4'b1011;
		SW_EIGHT = 1;
		SW_PEN = 1;
		SW_OHEL = 0;
		i_RX = 0;
        
		@(negedge SYS_CLK) SYS_RST = ~SYS_RST;


	end
      
endmodule

