`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:54:13 04/23/2018 
// Design Name: 
// Module Name:    TSI 
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
module TSI(

	// FPGA INPUTS
	input       SYS_CLK,         // System Clock
   input       SYS_RST,         // System Reset
	input       i_RX,   
	input [6:0] i_SW,

	// FPGA OUTPUTS
	output 		 o_TX,
	output [7:0] o_LED,

	// INPUTS FROM SOPC CORE
	input			i_TX,
	input	[7:0] i_LED,

	// OUTPUTS TO SOPC CORE
	output		 o_CLK, 
	output   	 o_RST,
	output [6:0] o_SW
	
);
	
	
	
	
	
endmodule
