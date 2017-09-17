//==================================================================================================
//  Filename      : top.v
//  Created On    : 2017-07-09 20:15:48
//  Last Modified : 2017-07-16 11:26:02
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : top module for sokoban
//
//
//==================================================================================================
module top(/*autoport*/
//inout
			ps2_data,
			ps2_clk,
			ps2_data_key,
			ps2_clk_key,
//output
			red,
			green,
			blue,
			pixel_clk,
			vga_comp_synch,
			vga_blank_z,
			hsync,
			vsync,
//input
			clk,
			reset_n);
	input clk,reset_n;
	output[7:0] red,green,blue;
	output pixel_clk,vga_comp_synch,vga_blank_z,hsync,vsync;
	inout ps2_data,ps2_clk;
	input ps2_data_key,ps2_clk_key;
	wire reset;
	assign reset=~reset_n;
	
	wire sys_clk;
	VgaDCM dcm_inst(.CLKIN_IN(clk),.CLKDV_OUT(sys_clk),.CLKIN_IBUFG_OUT(),.CLK0_OUT(),.LOCKED_OUT());
	
	wire[9:0] arrow_x,arrow_y;
	wire[5:0] cursor;
	wire game_area,retract,retry,left,right;
	wire[7:0] key;
	wire key_left,key_up,key_down,key_right,key_retry,key_retract,key_next,key_switch;
	ps2_keyboard_top keyboard(
		.clk(sys_clk),
		.reset_n(reset_n),
		.ps2_clk(ps2_clk_key),
		.ps2_data(ps2_data_key),
		.a_left(key_left),
		.w_up(key_up),
		.s_down(key_down),
		.d_right(key_right),
		.esc_retry(key_retry),
		.enter_next(key_next),
		.backspace_retract(key_retract),
		.m_switch(key_switch));
	assign key={key_left,key_up,key_down,key_right,key_retry,key_retract,key_next,key_switch};

	ps2_mouse_interface mouse(.sys_clk(sys_clk),.reset(reset),.ps2_clk(ps2_clk),.ps2_data(ps2_data),
					  .ArrowPosX(arrow_x),.ArrowPosY(arrow_y),.cursor(cursor),.GameArea(game_area),
					  .retract(retract),.retry(retry),.left(left),.right(right));

	wire[63:0] wall,way,box,destination;
	wire[5:0] man;
	wire[1:0] stage;
	wire[7:0] step,step_exp;
	wire win,lose;
	wire[1:0] direction;
	wire switch_reset,win_s,win_m,lose_s,lose_m;
	game_core sokoban(.clk(sys_clk),.game_area(game_area),.retract(retract),.retry(retry),
					  .left(left),.right(right),.wall(wall),.way(way),.box(box),.cursor(cursor),
					  .destination(destination),.man(man),.stage(stage),.win(win_s),.reset(reset|switch_reset),
					  .step(step),.step_exp(step_exp),
					  .direction(direction),.lose(lose_s),.key(key));

	wire[255:0] count_mine;
	wire[63:0] mine,flag,open,doubt;
	ms_top minesweeper(
			.flag(flag),
			.doubt(doubt),
			.open(open),
			.mine(mine),
			.win(win_m),
			.lose(lose_m),
			.count_mine(count_mine),
			.clk(sys_clk),
			.left(left),
			.right(right),
			.game_area(game_area),
			.retry(retry),
			.reset(reset|switch_reset),
			.cursor(cursor));
	wire switch_sel;
	switch switcher(
		.key_switch(key_switch),
		.switch_reset(switch_reset),
		.switch_sel(switch_sel),
		.clk(sys_clk),
		.reset(reset),
		.win_s(win_s),
		.win_m(win_m),
		.lose_s(lose_s),
		.lose_m(lose_m),
		.win(win),
		.lose(lose));

	wire[9:0] x_pos,y_pos;
	assign pixel_clk=sys_clk;
	vga_ctrl vga_ctrl(.sys_clk(sys_clk),.reset(reset),.x_pos(x_pos),.y_pos(y_pos),
		.nblank(),.EndFrame(),.vsync(vsync),.hsync(hsync),.vga_blank_z(vga_blank_z),.vga_comp_synch(vga_comp_synch));

	display display_inst(
		.clk(sys_clk),
		.arrow_y(arrow_y),
		.arrow_x(arrow_x),//.arrow_x(10'd300),//
		.wall(wall),
		.way(way),
		.box(box),
		.destination(destination),
		.man(man),
		.direction(direction),
		.stage(stage),
		.win(win),
		.lose(lose),
		.step(step),
		.step_exp(step_exp),
		.x_pos(x_pos),
		.y_pos(y_pos),
		.red(red),
		.blue(blue),
		.green(green),
		.switch_sel(switch_sel),
		.mine(mine),
		.flag(flag),
		.open(open),
		.doubt(doubt),
		.count(count_mine));
	
endmodule