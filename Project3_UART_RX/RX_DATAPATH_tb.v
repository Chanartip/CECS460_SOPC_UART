`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:12:56 03/24/2018
// Design Name:   RX_DATAPATH
// Module Name:   C:/Users/Charles/OneDrive/2018Spring_CSULB/CECS460_SOC/Projects/Project3_RX_Engine/RX_DATAPATH_tb.v
// Project Name:  Project3_RX_Engine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RX_DATAPATH
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RX_DATAPATH_tb;

	// Inputs
	reg i_clk;
	reg i_rst;
	reg i_read;
	reg i_btu;
	reg i_done;
	reg i_start;
	reg i_rx;
	reg i_eight;
	reg i_pen;
	reg i_ohel;
      
	// Outputs
	wire o_rxrdy;
	wire o_perr;
	wire o_ferr;
	wire o_ovf;
	wire [7:0] o_rx_byte;

	// Instantiate the Unit Under Test (UUT)
	RX_DATAPATH uut (
		.i_clk(i_clk), 
		.i_rst(i_rst), 
		.i_read(i_read), 
		.i_btu(i_btu), 
		.i_done(i_done), 
		.i_start(i_start), 
		.i_rx(i_rx), 
		.i_eight(i_eight), 
		.i_pen(i_pen), 
		.i_ohel(i_ohel), 
		.o_rxrdy(o_rxrdy), 
		.o_perr(o_perr), 
		.o_ferr(o_ferr), 
		.o_ovf(o_ovf), 
		.o_rx_byte(o_rx_byte)
	);

   always #5 i_clk = ~i_clk;
   
	initial begin
		// Initialize Inputs
		i_clk = 0;
		i_rst = 1;
		i_read = 0;
		i_btu = 0;
		i_done = 0;
		i_start = 0;
		i_rx = 0;
		i_eight = 1;
		i_pen = 1;
		i_ohel = 0;
      @(negedge i_clk) i_rst = ~i_rst;
      
//      rxrdy_verif;
//      perr_verif;
//      ferr_verif;
      ovf_verif; 
      #100 $finish;
	end
      
   task rxrdy_verif;
      begin
         @(negedge i_clk) i_done = 1;
         @(negedge i_clk) i_done = 0;
         
         repeat(4) @(negedge i_clk);
         
         @(negedge i_clk) i_done = 1;
         @(negedge i_clk) i_read = 1;
         
         repeat(4) @(negedge i_clk);
         @(negedge i_clk) i_read = 0;
      end
   endtask
   
   task perr_verif;
      begin
         @(negedge i_clk) uut.rx_remap_inst.o_data = 10'b11_0110_1100;
         @(negedge i_clk) i_done = 1;
         @(negedge i_clk) i_done = 0;
         
         @(negedge i_clk) i_read = 1;
         @(negedge i_clk) i_read = 0;
         
         @(negedge i_clk) uut.rx_remap_inst.o_data = 10'b10_0110_1100;
         @(negedge i_clk) i_done = 1;
         @(negedge i_clk) i_done = 0;
      end
   endtask
   
   task ferr_verif;
      begin
         @(negedge i_clk) uut.rx_remap_inst.o_data = 10'b00_0110_1100;
         @(negedge i_clk) i_done = 1;
         @(negedge i_clk) i_done = 0;
         
         @(negedge i_clk) i_read = 1;
         @(negedge i_clk) i_read = 0;
         
         @(negedge i_clk) uut.rx_remap_inst.o_data = 10'b10_0110_1100;
         @(negedge i_clk) i_done = 1;
         @(negedge i_clk) i_done = 0;
      end
   endtask
   
   task ovf_verif;
      begin
        i_done = 1;
        repeat(4) @(negedge i_clk);
         @(negedge i_clk) i_read = 1;
         @(negedge i_clk) i_read = 0; 
         @(negedge i_clk) i_done = 0;
      end
   endtask
      
endmodule

