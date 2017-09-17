//==================================================================================================
//  Filename      : ms_controller.v
//  Created On    : 2017-07-13 23:38:12
//  Last Modified : 2017-07-19 12:40:19
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : 
//
//
//==================================================================================================
module ms_controller(/*autoport*/
//output
			flag,
			doubt,
			open,
			gen_reset,
			win,
			lose,
			start,
			stop,
			clr,
			state,
//input
			gen_done,
			clk,
			reset,
			retry,
			left,
			right,
			game_area,
			mid,
			cursor,
			mine,
			check,
			quick,
			open_quick);
	parameter RESET=4'd0,GEN=4'd1,GEN_WAIT=4'd2,GEN_DONE=4'd3,WAIT=4'd4,LEFT=4'd5,RIGHT=4'd6,WIN=4'd7,LOSE=4'd8,UPDATE=4'd9,QUICK=4'd10;
	parameter UPDATE1=4'd11,UPDATE2=4'd12;
	input gen_done,clk,reset,retry,left,right,game_area,mid;
	input[5:0] cursor;
	input[63:0] mine,check,quick,open_quick;
	output[63:0] flag,doubt,open;
	output gen_reset,win,lose,start,stop,clr;
	output[3:0] state;
	reg[3:0] state=0;
	reg[63:0] flag=0,doubt=0,open=0;
	wire[63:0] open_next;
	wire can_update;
	wire[63:0] should_open;
	assign should_open=check&(~open)&(~flag)&(~doubt);
	assign can_update=|(should_open);
	assign open_next=open|should_open;
	assign gen_reset=(state==GEN);
	assign win=(state==WIN);
	assign lose=(state==LOSE);
	assign start=(state==LEFT||state==RIGHT);
	assign stop=(state==WIN||state==LOSE);
	assign clr=(state==GEN||state==GEN_DONE);
	wire[63:0] open_mine;
	assign open_mine=open|mine;
	wire[63:0] open_quick_correct;
	assign open_quick_correct=open_quick&(~flag);
	wire safe;
	assign safe=~(|(open_quick_correct&mine));
	always @(posedge clk) begin
		if (reset) begin
			state=RESET;
		end
		else begin
			case(state)
				RESET: begin
					state=GEN;
					flag=0;
					doubt=0;
					open=0;
				end
				GEN: begin
					state=GEN_WAIT;
				end
				GEN_WAIT: begin
					if(gen_done) begin
						state=GEN_DONE;
					end
					else begin
						state=GEN_WAIT;
					end
				end
				GEN_DONE: begin
					state=WAIT;
					flag=0;
					doubt=0;
					open=0;
				end
				WAIT: begin
					if(~open==mine) begin
						state=WIN;
						flag=mine;
						doubt=0;
					end
					else if(game_area&mid) begin
						state=QUICK;
					end
					else if(left) begin
						state=LEFT;
					end
					else if(game_area&right) begin
						state=RIGHT;
					end
					else begin
						state=WAIT;
					end
				end
				LEFT: begin
					if(retry) begin
						state=GEN_DONE;
					end
					else if(game_area==1&&open[cursor]==0&&flag[cursor]==0&&doubt[cursor]==0) begin
						if(mine[cursor]==1) begin
							open=open_mine;
							state=LOSE;
						end
						else begin
							open[cursor]=1;
							state=UPDATE;
						end
					end
					else begin
						state=WAIT;
					end
				end
				WIN: begin
					if(left) begin
						state=RESET;
					end
					else begin
						state=WIN;
					end
				end
				LOSE: begin
					if(left) begin
						state=RESET;
					end
					else begin
						state=LOSE;
					end
				end
				UPDATE: begin
					state=UPDATE1;
				end
				UPDATE1: begin
					if(can_update) begin
						open=open_next;
						state=UPDATE2;
					end
					else begin
						state=WAIT;
					end
				end
				UPDATE2: begin
					state=UPDATE;
				end
				RIGHT: begin
					if(open[cursor]==0&&flag[cursor]==0&&doubt[cursor]==0) begin
						flag[cursor]=1;
						state=WAIT;
					end
					else if(open[cursor]==0&&flag[cursor]==1) begin
						flag[cursor]=0;
						doubt[cursor]=1;
						state=WAIT;
					end
					else if (open[cursor]==0&&doubt[cursor]==1) begin
						doubt[cursor]=0;
						state=WAIT;
					end
					else begin
						state=WAIT;
					end
				end
				QUICK: begin
					if(open[cursor]==1&&quick[cursor]==1&&safe) begin
						open=open_quick_correct;
						state=UPDATE;
					end
					else if(open[cursor]==1&&quick[cursor]==1) begin
						open=open_quick_correct;
						state=LOSE;
					end
					else begin
						state=WAIT;
					end
				end
			endcase
		end
	end
endmodule