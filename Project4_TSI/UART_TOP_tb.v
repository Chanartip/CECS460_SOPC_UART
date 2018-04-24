`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:20:12 03/20/2018
// Design Name:   UART_TOP
// Module Name:   C:/Users/Chana/OneDrive/2018Spring_CSULB/CECS460_SOC/Projects/Project3_RX_Engine/UART_TOP_tb.v
// Project Name:  Project3_RX_Engine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UART_TOP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module UART_TOP_tb;

	// Inputs
	reg i_clk;
	reg i_rst;
	reg [3:0] i_baud;
	reg i_write;
	reg [1:0] i_read;
	reg [7:0] i_byte;
	reg i_rx;
	reg i_eight;
	reg i_pen;
	reg i_ohel;

	// Outputs
	wire o_TX;
	wire o_UART_INTR;
	wire [7:0] o_UART_DS;

	integer i;
	reg [0:0] mem [0:999_999];

	// Instantiate the Unit Under Test (UUT)
	UART_TOP uut (
		.i_clk(i_clk), 
		.i_rst(i_rst), 
		.i_baud(i_baud), 
		.i_write(i_write), 
		.i_read(i_read), 
		.i_byte(i_byte), 
		.i_rx(o_TX), 
		.i_eight(i_eight), 
		.i_pen(i_pen), 
		.i_ohel(i_ohel), 
		.o_TX(o_TX), 
		.o_UART_INTR(o_UART_INTR), 
		.o_UART_DS(o_UART_DS)
	);

	always #5 i_clk = ~i_clk;

	initial begin
		// Initialize Inputs
		i_clk = 0;
		i_rst = 1;
		i_baud = 4'b1011;
		i_write = 0;
		i_read = 2'b00;
		i_byte = 8'b01101010;
		i_rx = 0;
		i_eight = 1;
		i_pen = 1;
		i_ohel = 0;
 
      @(negedge i_clk) i_rst = ~i_rst;
		@(negedge i_clk) i_write = 1;
		@(negedge i_clk) i_write = 0;
      
      #50_000 i_read = 1;
      @(negedge i_clk) i_read = 0;
		
      $finish;
//      $readmemb("output2.txt",mem);
//      
//		@(negedge i_clk) i_rst = ~i_rst;
//      
//      for(i=0; i<1_000_000; i=i+1)
//      begin
//         #100
//         i_rx = mem[i];
//      end
	end
      
endmodule

