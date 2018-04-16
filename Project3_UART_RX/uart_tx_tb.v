`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:11:44 03/20/2018
// Design Name:   UART_TX
// Module Name:   C:/Users/Chana/OneDrive/2018Spring_CSULB/CECS460_SOC/Projects/Project3_RX_Engine/uart_tx_tb.v
// Project Name:  Project3_RX_Engine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UART_TX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module uart_tx_tb;

	// Inputs
	reg i_clk;
	reg i_rst;
	reg i_write;
	reg [7:0] i_byte;
	reg i_eight;
	reg i_pen;
	reg i_ohel;
	reg [18:0] i_rate;

	// Outputs
	wire o_tx;
	wire o_txrdy;

	integer f;
	reg flip;
	time	t;

	// Instantiate the Unit Under Test (UUT)
	UART_TX uut (
		.i_clk(i_clk), 
		.i_rst(i_rst), 
		.i_write(i_write), 
		.i_byte(i_byte), 
		.i_eight(i_eight), 
		.i_pen(i_pen), 
		.i_ohel(i_ohel), 
		.i_rate(i_rate), 
		.o_tx(o_tx), 
		.o_txrdy(o_txrdy)
	);

	always #5 i_clk = ~i_clk;
	
	always #t
	begin
	flip = !flip;
	$fwrite(f,o_tx," ");
	end
		
	initial begin
		// Initialize Inputs
		f = $fopen("output2.txt");
		flip = 0;
		i_clk = 0;
		i_rst = 1;
		i_write = 0;
		i_byte = 8'hAE;
		i_eight = 1;
		i_pen = 1;
		i_ohel = 0;
		i_rate = 19'd109;
		t = 100;

//		@(negedge i_clk) i_rst = ~i_rst;

		#100
		i_rst = 1'b0;
		@(negedge i_clk) i_write = 1;
		@(negedge i_clk) i_write = 0;
		#50_000_000
		$fclose(f);
		$finish;
		
	end
      
endmodule

