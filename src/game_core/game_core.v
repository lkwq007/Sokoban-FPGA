//==================================================================================================
//  Filename      : game_core.v
//  Created On    : 2017-07-04 14:33:01
//  Last Modified : 2017-07-16 11:26:28
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com
//
//  Description   : The core module for game progress control
//
//
//==================================================================================================
module game_core(/*autoport*/
//output
			win,
			lose,
			stage,
			man,
			wall,
			destination,
			box,
			way,
			step,
			step_exp,
			direction,
//input
			clk,
			game_area,
			retract,
			retry,
			left,
			right,
			reset,
			cursor,
			key);
	parameter UP=2'd0,DOWN=2'd1,LEFT=2'd2,RIGHT=2'd3;
	input clk,game_area,retract,retry,left,right,reset;
	input[5:0] cursor;
	input[7:0] key;
	output win,lose;
	output[1:0] stage;
	output[5:0] man;
	output[63:0] wall,destination,box,way;
	output[7:0] step,step_exp;
	output[1:0] direction;
	reg[1:0] direction=2'd1;
	wire[1:0] direction_temp;
	reg[1:0] direction_key;
	wire game_state_en,stage_up,win,move_result,rst;
	wire[133:0] game_state,game_state_int,game_state_next;
	wire[1:0] sel;
	wire real_retract;
	wire[7:0] step_exp;
	wire key_left,key_up,key_down,key_right,key_retry,key_retract,key_next,key_switch;
	wire key_hit;
	assign {key_left,key_up,key_down,key_right,key_retry,key_retract,key_next,key_switch}=key;
	assign key_hit=key_left|key_up|key_down|key_right;
	assign way=game_state[133:70];
	assign box=game_state[69:6];
	assign man=game_state[5:0];
	assign rst=reset|right;
	wire step_inc,step_dec;
	reg[5:0] cursor_hub;
	always @(posedge clk) begin
		if(left) begin
			direction=direction_temp;
		end
		else if(key_hit) begin
			direction=direction_key;
		end
		else begin
			direction=direction;
		end
	end
	always @(*) begin
		if(key_left) begin
			cursor_hub={man[5:3],man[2:0]-3'o1};
			direction_key=LEFT;
		end
		else if(key_right) begin
			cursor_hub={man[5:3],man[2:0]+3'o1};
			direction_key=RIGHT;
		end
		else if(key_up) begin
			cursor_hub={man[5:3]-1,man[2:0]};
			direction_key=UP;
		end
		else if(key_down) begin
			cursor_hub={man[5:3]+1,man[2:0]};
			direction_key=DOWN;
		end
		else begin
			cursor_hub=cursor;
			direction_key=direction;
		end
	end

	game_controller controller(
		.clk(clk),.game_state(game_state),.move_result(move_result),
		.destination(destination),.cursor(cursor_hub),.retry(retry),.retract(retract),
		.left(left),.game_area(game_area),.reset(reset),.right(right),.stage(stage),
		.stage_up(stage_up),.game_state_en(game_state_en),.sel(sel),.win(win),.lose(lose),
		.real_retract(real_retract),.step_inc(step_inc),.step_dec(step_dec),
		.step(step),.step_exp(step_exp),
		.key_retract(key_retract),.key_hit(key_hit),.key_retry(key_retry),.key_next(key_next));
	
	game_man_move move_next(
		.game_state(game_state),.cursor(cursor_hub),
		.game_state_next(game_state_next),.result(move_result),
		.direction(direction_temp));

	game_stage_counter stage_counter(.clk(clk),.en(stage_up),.rst(rst),.q(stage));

	game_init init(.
		stage(stage),.wall(wall),.destination(destination),
		.game_state_int(game_state_int),.step_exp(step_exp));

	game_retract retracter(
		.clk(clk),.game_state(game_state),
		.game_state_int(game_state_int),.game_state_bm(game_state_next),.game_state_mm(game_state_next),
		.game_state_en(game_state_en),.sel(sel),.real_retract(real_retract));

	wire step_clr=(sel==0)&&(game_state_en==1);
	game_step_counter step_counter(
		.clk(clk),.inc(step_inc),.dec(step_dec),
		.rst(rst|retry|step_clr),.q(step));

endmodule