`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:40:09 03/20/2018
// Design Name:   RX_SHIFT_REG
// Module Name:   C:/Users/Chana/OneDrive/2018Spring_CSULB/CECS460_SOC/Projects/Project3_RX_Engine/RX_SHIFT_REG_tb.v
// Project Name:  Project3_RX_Engine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RX_SHIFT_REG
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RX_SHIFT_REG_tb;

	// Inputs
	reg CLK;
	reg RST;
	reg SH;
	reg SDI;

	// Outputs
	wire [9:0] SH_DATA;

	// Instantiate the Unit Under Test (UUT)
	RX_SHIFT_REG uut (
		.CLK(CLK), 
		.RST(RST), 
		.SH(SH), 
		.SDI(SDI), 
		.SH_DATA(SH_DATA)
	);
	
	always #5 CLK = ~CLK;
	
	initial begin
		// Initialize Inputs
		CLK = 0;
		RST = 1;
		SH = 0;
		SDI = 0;

		@(negedge CLK) RST = ~RST;
		@(negedge CLK) SH = 1;
		repeat (3) begin
			@(negedge CLK) SDI=1;
		end
		repeat (3) begin
			@(negedge CLK) SDI=0;
		end
		repeat (3) begin
			@(negedge CLK) SDI=1;
		end
		@(negedge CLK) SDI=1; 
		@(negedge CLK) SH=0;
		
		#10 $finish;
	end
      
endmodule

