`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:59 07/13/2017 
// Design Name: 
// Module Name:    bit_counter_k 
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
module bit_counter(sys_clk,reset,counter_reset,counter_en,scan_code_ready);
	
	input sys_clk,reset;
	input counter_reset,counter_en;
	
	output  scan_code_ready;
	wire scan_code_ready;
	reg [3:0]bit_count=0;
	assign scan_code_ready=(bit_count==11);
	always @(posedge sys_clk)
		begin
			if ( reset || scan_code_ready || counter_reset ) 
				bit_count <= 0; // normal reset
			else if ( counter_en) bit_count <= bit_count + 1;
		end
endmodule
