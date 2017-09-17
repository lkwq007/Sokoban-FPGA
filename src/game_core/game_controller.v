//==================================================================================================
//  Filename      : game_controller.v
//  Created On    : 2017-07-04 15:49:11
//  Last Modified : 2017-07-14 15:40:04
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : a tedious controller for this game
//
//
//==================================================================================================
module game_controller(/*autoport*/
//output
			game_state_en,
			stage_up,
			win,
			lose,
			sel,
			step_inc,
			step_dec,
//input
			clk,
			retry,
			retract,
			left,
			game_area,
			reset,
			right,
			move_result,
			cursor,
			destination,
			stage,
			game_state,
			step_exp,
			step,
			key_hit,
			key_retry,
			key_retract,
			key_next,
			real_retract);
	parameter RESET=4'd0,INIT=4'd1,WAIT=4'd2,PAUSE=4'd3,OVER=4'd4,NEXT=4'd5,INTERIM=4'd6,RETRACT=4'd7,MOVE=4'd8,LOSE=4'd9;
	input clk,retry,retract,left,game_area,reset,right,move_result;
	input[5:0] cursor;
	input[63:0] destination;
	input[1:0] stage;
	input[133:0] game_state;
	input[7:0] step_exp;
	input[7:0] step;
	input key_hit,key_retry,key_retract,key_next;
	input real_retract;
	output game_state_en,stage_up,win;
	output lose;
	output[1:0] sel;
	output step_inc,step_dec;
	wire[63:0] way,box;
	assign way=game_state[133:70];
	assign box=game_state[69:6];
	reg[3:0] state=0;
	assign sel[0]=(state==RETRACT)||(state==MOVE);
	assign sel[1]=(state==RETRACT);
	assign game_state_en=(state==RESET)||(state==INIT)||(state==RETRACT)||(state==MOVE);
	assign stage_up=(state==NEXT);
	assign win=(state==OVER);
	assign lose=(state==LOSE) ;
	assign step_inc=(state==MOVE);
	assign step_dec=(state==RETRACT);
	always @(posedge clk) begin
			if (reset||right) begin
				state=RESET;
			end
			else begin
				case(state)
					RESET: begin
						state=INIT;
					end
					INIT: begin
						state=WAIT;
					end
					WAIT: begin
						if(box==destination) begin
							if(stage==3) begin
								state=OVER;
							end
							else begin
								state=PAUSE;
							end
						end
						else if(step>=step_exp) begin
							state=LOSE;
						end
						else begin
							if(left) begin
								state=INTERIM;
							end
							else if(key_retry) begin
								state=INIT;
							end
							else if(key_retract&&real_retract) begin
								state=RETRACT;
							end
							else if(key_hit&&move_result) begin
								state=MOVE;
							end
							else begin
								state=WAIT;
							end
						end
					end
					PAUSE: begin
						if(left|key_next) begin
							state=NEXT;
						end
						else begin
							state=PAUSE;
						end
					end
					NEXT: begin
						state=INIT;
					end
					OVER: begin
						state=OVER;
					end
					LOSE: begin
						if(left|key_retry|key_next) begin
							state=INIT;
						end
						else begin
							state=LOSE;
						end
					end
					INTERIM: begin
						if(retry) begin
							state=INIT;
						end
						else if(retract&&real_retract) begin
							state=RETRACT;
						end
						else if(game_area&&move_result) begin
							state=MOVE;
						end
						else begin
							state=WAIT;
						end
					end
					RETRACT: begin
						state=WAIT;
					end
					MOVE: begin
						state=WAIT;
					end
					default: begin
						state=RESET;
					end
				endcase
			end
		end
endmodule