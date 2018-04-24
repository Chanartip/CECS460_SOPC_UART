`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:19:48 03/20/2018
// Design Name:   RX_REMAP
// Module Name:   C:/Users/Chana/OneDrive/2018Spring_CSULB/CECS460_SOC/Projects/Project3_RX_Engine/RX_REMAP_tb.v
// Project Name:  Project3_RX_Engine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RX_REMAP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RX_REMAP_tb;

	// Inputs
	reg i_eight;
	reg i_pen;
	reg [9:0] i_data;

	// Outputs
	wire [9:0] o_data;

	// Instantiate the Unit Under Test (UUT)
	RX_REMAP uut (
		.i_eight(i_eight), 
		.i_pen(i_pen), 
		.i_data(i_data), 
		.o_data(o_data)
	);

	initial begin
		// Initialize Inputs
		i_eight = 0;
		i_pen = 0;
		i_data = 10'b11_0000_1010;
	
		#10 i_eight = 0; i_pen = 0;
		#10 i_eight = 1; i_pen = 0;
		#10 i_eight = 0; i_pen = 1;
		#10 i_eight = 1; i_pen = 1;
		#10 i_eight = 0; i_pen = 0;
      #10 $finish;
		
		
	end
      
endmodule

