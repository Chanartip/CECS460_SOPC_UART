`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:44:34 03/23/2018
// Design Name:   RX_CONTROL
// Module Name:   C:/Users/Charles/OneDrive/2018Spring_CSULB/CECS460_SOC/Projects/Project3_RX_Engine/RX_CONTROL_tb.v
// Project Name:  Project3_RX_Engine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RX_CONTROL
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RX_CONTROL_tb;

	// Inputs
	reg i_clk;
	reg i_rst;
	reg [18:0] i_rate;
	reg i_rx;
	reg i_eight;
	reg i_pen;

	// Outputs
	wire o_btu;
	wire o_done;
	wire o_start;

	// Instantiate the Unit Under Test (UUT)
	RX_CONTROL uut (
		.i_clk(i_clk), 
		.i_rst(i_rst), 
		.i_rate(i_rate), 
		.i_rx(i_rx), 
		.i_eight(i_eight), 
		.i_pen(i_pen), 
		.o_btu(o_btu), 
		.o_done(o_done), 
		.o_start(o_start)
	);
   
   always #5 i_clk = ~i_clk;

	initial begin
		// Initialize Inputs
		i_clk = 0;
		i_rst = 1;
		i_rate = 19'd109;
		i_rx = 1;
		i_eight = 0;
		i_pen = 0;

		@(negedge i_clk) i_rst = ~i_rst;
      #100	  i_rx=0;
//      #10_000 i_eight=1;
//      #10_000 i_pen=1;
      #10_000 $finish;
	end
       
endmodule

