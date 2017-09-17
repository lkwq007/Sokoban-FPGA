`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:30:27 07/13/2017 
// Design Name: 
// Module Name:    interface 
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
module	interface(sys_clk,reset,
	ps2_clk,ps2_data,
	scan_code_ready,
	scan_code,
	parity_error);

	input sys_clk,reset;
	input ps2_clk,ps2_data;
	
	output scan_code_ready,parity_error;
	output [7:0]scan_code;
	
	wire scan_code_ready,parity_error;
	wire [7:0]scan_code;
	
	wire timer_reset,timer_done;
	watchdog ps2_keyboard_watchdog(.sys_clk(sys_clk),.reset(reset),.timer_reset(timer_reset),.timer_done(timer_done));
	
	wire ps2_clk_s,ps2_data_s;
	d_ff d_ff(.sys_clk(sys_clk),.reset(reset),.ps2_clk(ps2_clk),.ps2_data(ps2_data),.ps2_clk_s(ps2_clk_s),.ps2_data_s(ps2_data_s));
	
	wire counter_reset,counter_en;
	bit_counter bit_counter_k(.sys_clk(sys_clk),.reset(reset),.counter_reset(counter_reset),.counter_en(counter_en),.scan_code_ready(scan_code_ready));
	
	wire shift_en;
	wire [10:0]q;
	shift_reg shift_reg_k(.sys_clk(sys_clk),.reset(reset),.din(ps2_data_s),.shift_en(shift_en),.q(q));
	
	controller ps2_interface_controller(.sys_clk(sys_clk),.reset(reset),
		.timer_reset(timer_reset),
		.timer_done(timer_done),
		.counter_reset(counter_reset),
		.counter_en(counter_en),
		.ps2_clk_s(ps2_clk_s),
		.shift_en(shift_en),
		.q(q));
	
	assign scan_code=q[8:1];
	assign parity_error=^q[9:1];
	
endmodule
