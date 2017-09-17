`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:47:03 07/05/2017 
// Design Name: 
// Module Name:    ps2_mouse_top 
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
module ps2_mouse_interface(sys_clk,reset,ps2_clk,ps2_data,
		ArrowPosX,ArrowPosY,cursor,GameArea,
		retract,retry,left,right);

input reset,sys_clk;
inout ps2_clk,ps2_data;
output  [9:0]ArrowPosX,ArrowPosY;
output  left,right;
output  [5:0]cursor;
output  GameArea,retract,retry;
	
	wire timer_150us_done;
	wire timer_400us_done;
	
	wire falling_edge;
	wire load;
	//wire out_clk,out_data;
	wire bit_reset;
	//wire ps2_clk_in = ps2_clk & out_clk;
	//wire din = ps2_data & out_data;
	wire [32:0]q;
	wire ps2_clk_hiz,ps2_data_hiz;
	wire [6:0]bit_counter;
	
	//output signal 
	wire [9:0]ArrowPosX,ArrowPosY;
	wire [5:0]cursor;
	wire left,right;
	wire GameArea,retract,retry;
	//wire out_clk,out_data;
	
	ps2_mouse_gate gate_clk(.in({1'b0}),.ps2_clk_hiz(ps2_clk_hiz),.out_clk(ps2_clk));
	ps2_mouse_gate2 gate_data(.in({1'b0}),.ps2_data_hiz(ps2_data_hiz),.out_data(ps2_data));
	
	ps2_mouse_interface_fallingtest fallingtest(.reset(reset),.clk(sys_clk),.ps2_clk(ps2_clk),.falling_edge(falling_edge));
	
	ps2_mouse_watchdog watchdog(.reset(reset),.clk(sys_clk),.timer_150us_done(timer_150us_done),.timer_400us_done(timer_400us_done),.falling_edge(falling_edge));
	
	ps2_mouse_shiftreg shiftreg(.falling_edge(falling_edge),.clk(sys_clk),.reset(reset),.din(ps2_data),.load(load),.q(q));
	
	//
	wire data_ready,error_no_ack;
	
	ps2_mouse_interface_controller controller(.reset(reset),.clk(sys_clk),
		.timer_150us_done(timer_150us_done),.timer_400us_done(timer_400us_done),
		.bit_reset(bit_reset),.bit_counter(bit_counter),.ps2_clk_hiz(ps2_clk_hiz),.ps2_data_hiz(ps2_data_hiz),
		.ps2_data(ps2_data),
		.load(load),.q(q),
		.data_ready(data_ready),.error_no_ack(error_no_ack));
		

	ps2_mouse_bit_counter  bit_counter_p(.reset(reset),.clk(sys_clk),.bit_reset(bit_reset),.bit_counter(bit_counter),.falling_edge(falling_edge));
	
	wire left_button,right_button;
	assign left_button=q[1];
	assign right_button=q[2];
	wire[8:0] x_increment,y_increment;
	assign x_increment={q[5],q[19:12]};
	assign y_increment={q[6],q[30:23]};
	
	ps2_dataprogramme ps2_data_programme(.data_ready(data_ready),.reset(reset),.x_increment(x_increment),.y_increment(y_increment),
		.left_button(left_button),.right_button(right_button),
		.sys_clk(sys_clk),.ArrowPosX(ArrowPosX),.ArrowPosY(ArrowPosY),.cursor(cursor),.GameArea(GameArea),
		.retract(retract),.retry(retry),.left(left),.right(right));

endmodule
