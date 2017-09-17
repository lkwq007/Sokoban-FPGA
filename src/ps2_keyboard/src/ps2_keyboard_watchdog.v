`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:01:06 07/13/2017 
// Design Name: 
// Module Name:    ps2_keyboard_watchdog 
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
module watchdog(sys_clk,reset,timer_reset,timer_done);

	input sys_clk,reset;
	input timer_reset;
	
	output timer_done;
	
	reg [14:0]q=0;
	wire timer_done;
	assign timer_done=(q==30000);
	always@(posedge sys_clk)begin 
		if (reset || timer_reset) q=0;
		else q=q+1;
	end
endmodule
