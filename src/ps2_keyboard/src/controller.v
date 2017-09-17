`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:42:47 07/13/2017 
// Design Name: 
// Module Name:    controller 
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
module controller(sys_clk,reset,
	timer_reset,timer_done,
	counter_reset,counter_en,
	ps2_clk_s,
	shift_en,q);

	input sys_clk,reset;
	input timer_done,ps2_clk_s;
	input [10:0]q;
	
	output reg timer_reset,counter_reset,counter_en,shift_en;

	reg [2:0]state,next_state;
	parameter [2:0]start=0,
					ps2_clk_s_h=1,
					falling_edge_marker=2,
					ps2_clk_s_l=3,
					rising_edge_marker=4;
	
	always@(posedge sys_clk)begin
		if (reset) state<=start;
		else state<=next_state;
	end
	always@(*)begin
		case (state)
			start:begin 
				shift_en<=0;	timer_reset<=1;	counter_reset<=1;	
				next_state<=ps2_clk_s_h;
			 end
			ps2_clk_s_h:begin
				shift_en<=0;	timer_reset<=0;	counter_reset<=0;		counter_en<=0;
				if (timer_done)	next_state<=start;
				else if (~ps2_clk_s)	next_state<=falling_edge_marker;
				else next_state<=ps2_clk_s_h;
			end
			falling_edge_marker:begin
				shift_en<=1;	timer_reset<=1;	counter_reset<=0;		counter_en<=1;
				next_state<=ps2_clk_s_l;
			end
			ps2_clk_s_l:begin 
				shift_en<=0;							counter_reset<=0;		counter_en<=0;
				if(ps2_clk_s)	next_state<=rising_edge_marker;
				else next_state<=ps2_clk_s_l;
			end
			//rising_edge_marker
			default:begin
				shift_en<=0;	timer_reset<=1;	counter_reset<=0;		counter_en<=0;
				next_state<=ps2_clk_s_h;
			end
		endcase
	end
endmodule
