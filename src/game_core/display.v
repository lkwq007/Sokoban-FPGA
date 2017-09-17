//==================================================================================================
//  Filename      : display.v
//  Created On    : 2017-07-09 20:39:46
//  Last Modified : 2017-07-16 16:00:00
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : 
//
//
//==================================================================================================
module display(/*autoport*/
//output
			red,
			green,
			blue,
//input
			clk,
			win,
			lose,
			switch_sel,
			direction,
			step,
			step_exp,
			x_pos,
			y_pos,
			wall,
			way,
			box,
			destination,
			mine,
			flag,
			doubt,
			open,
			count,
			man,
			arrow_x,
			arrow_y,
			stage);
	input clk,win,lose,switch_sel;
	input[1:0] direction;
	input[7:0] step,step_exp;
	input[9:0] x_pos,y_pos;
	input[63:0] wall,way,box,destination,mine,flag,doubt,open;
	input[255:0] count;
	input[5:0] man;
	input[9:0] arrow_x,arrow_y;
	input[1:0] stage;
	output[7:0] red,green,blue;
	wire[7:0] Red0,Green0,Blue0,Red1,Green1,Blue1,Red2,Green2,Blue2,Red3,Green3,Blue3;
	wire[7:0] Redm,Greenm,Bluem;
	wire req_0,req_1,req_2,req_3,req_m;
	wire win_temp;
	assign win_temp=win;
	layer_top layer_top_inst(
		.ArrowPosY(arrow_y),.ArrowPosX(arrow_x),
		.y_pos(y_pos),.x_pos(x_pos),
		.RqFlag3(req_3),.Red3(Red3),.Blue3(Blue3),.Green3(Green3)
		);
	layer_mid_2 layer_mid_2_inst(
		.clk(clk),.y_pos(y_pos),.x_pos(x_pos),.man(man),.direction(direction),
		.RqFlag2(req_2),.Red2(Red2),.Blue2(Blue2),.Green2(Green2)
		);
	layer_mid_1 layer_mid_1_inst(
		.clk(clk),.y_pos(y_pos),.x_pos(x_pos),
		.man(man),.box(box),.way(way),.wall(wall),.destination(destination),
		.RqFlag1(req_1),.Red1(Red1),.Blue1(Blue1),.Green1(Green1)
		);
	bottom_layer layer_bottom_inst(
		.sys_clk(clk),.y_pos(y_pos),.x_pos(x_pos),.stage(stage),.win(win),.step(step),.lose(lose),
		.RqFlag0(req_0),.Red0(Red0),.Blue0(Blue0),.Green0(Green0),.step_exp(step_exp)
		);
	ms_layer layer_mine(
			.RqFlag1(req_m),
			.Red1(Redm),
			.Blue1(Bluem),
			.Green1(Greenm),
			.clk(clk),
			.lose(lose),
			.flag(flag),
			.doubt(doubt),
			.mine(mine),
			.open(open),
			.x_pos(x_pos),
			.y_pos(y_pos),
			.count(count));
	layer_sel layer_sel_inst(
		.RqFlag0(req_0),.Red0(Red0),.Blue0(Blue0),.Green0(Green0),
		.RqFlag1(req_1),.Red1(Red1),.Blue1(Blue1),.Green1(Green1),
		.RqFlag2(req_2),.Red2(Red2),.Blue2(Blue2),.Green2(Green2),
		.RqFlag3(req_3),.Red3(Red3),.Blue3(Blue3),.Green3(Green3),
		.RqFlagm(req_m),.Redm(Redm),.Bluem(Bluem),.Greenm(Greenm),
		.Red(red),.Blue(blue),.Green(green),.switch_sel(switch_sel)
		);
endmodule
