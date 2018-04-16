`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:20:08 04/11/2018
// Design Name:   UART_RX
// Module Name:   C:/Users/Chana/OneDrive/2018Spring_CSULB/CECS460_SOC/Projects/Project3_RX_Engine/UART_RX_tb.v
// Project Name:  Project3_RX_Engine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UART_RX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module UART_RX_tb;

	// Inputs
	reg i_clk;
	reg i_rst;
	reg i_read;
	reg i_rx;
	reg i_eight;
	reg i_pen;
	reg i_ohel;
	reg [18:0] i_rate;

	// Outputs
	wire o_rxrdy;
	wire o_perr;
	wire o_ferr;
	wire o_ovf;
	wire [7:0] o_rx_dout;

	reg [0:0] mem [0:999_999];
	integer i;

	// Instantiate the Unit Under Test (UUT)
	UART_RX uut (
		.i_clk(i_clk), 
		.i_rst(i_rst), 
		.i_read(i_read), 
		.i_rx(i_rx), 
		.i_eight(i_eight), 
		.i_pen(i_pen), 
		.i_ohel(i_ohel), 
		.i_rate(i_rate), 
		.o_rxrdy(o_rxrdy), 
		.o_perr(o_perr), 
		.o_ferr(o_ferr), 
		.o_ovf(o_ovf), 
		.o_rx_dout(o_rx_dout)
	);

	always #5 i_clk = ~i_clk;

	initial begin
		// Initialize Inputs
		i_clk = 0;
		i_rst = 1;
		i_read = 0;
		i_rx = 1;
		i_eight = 1;
		i_pen = 1;
		i_ohel = 0;
		i_rate = 19'd109;
		$readmemb("output2.txt",mem);
		
//		@(negedge i_clk) i_rst = ~i_rst;
		#100 
		i_rst = 0;
		
		for(i=0; i< 1_000_000; i= i+1)
			begin
			#100
			i_rx = mem[i];

			end
		@(negedge i_clk) i_read = 1;
		@(negedge i_clk) i_read = 0;

	end
      
endmodule

