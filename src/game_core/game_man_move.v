//==================================================================================================
//  Filename      : game_man_move.v
//  Created On    : 2017-07-04 15:21:33
//  Last Modified : 2017-07-13 15:49:35
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : different from the method in textbook
//
//
//==================================================================================================
module game_man_move(/*autoport*/
//output
			game_state_next,
			result,
			direction,
//input
			game_state,
			cursor);
	parameter UP=2'd0,DOWN=2'd1,LEFT=2'd2,RIGHT=2'd3;
	input[133:0] game_state;
	input[5:0] cursor;
	output[133:0] game_state_next;
	output result;
	output[1:0] direction;
	reg result=0;
	wire[63:0] box,way;
	wire[5:0] man;
	wire[2:0] man_x,man_y,cursor_x,cursor_y;
	reg[2:0] next_x,next_y,skip_x,skip_y;
	reg[5:0] man_next;
	reg[63:0] box_next,way_next;
	reg[1:0] direction=0;
	assign game_state_next={way_next,box_next,man_next};
	assign way=game_state[133:70];
	assign box=game_state[69:6];
	assign man=game_state[5:0];
	assign man_x=game_state[2:0];
	assign man_y=game_state[5:3];
	assign cursor_x=cursor[2:0];
	assign cursor_y=cursor[5:3];
	// will never check boundary as x, y cannot be 0 or 7
	always @(*) begin
		if(man_x>=cursor_x&&man_y>=cursor_y) begin
			if(man_x-cursor_x>man_y-cursor_y) begin
				next_x=man_x-1;
				next_y=man_y;
				skip_x=man_x-2;
				skip_y=man_y;
				direction=LEFT;
			end
			else begin
				next_x=man_x;
				next_y=man_y-1;
				skip_x=man_x;
				skip_y=man_y-2;
				direction=UP;
			end
		end
		else if(man_x>=cursor_x&&man_y<=cursor_y) begin
			if(man_x-cursor_x>cursor_y-man_y) begin
				next_x=man_x-1;
				next_y=man_y;
				skip_x=man_x-2;
				skip_y=man_y;
				direction=LEFT;
			end
			else begin
				next_x=man_x;
				next_y=man_y+1;
				skip_x=man_x;
				skip_y=man_y+2;
				direction=DOWN;
			end
		end
		else if(man_x<=cursor_x&&man_y<=cursor_y) begin
			if(cursor_x-man_x>cursor_y-man_y) begin
				next_x=man_x+1;
				next_y=man_y;
				skip_x=man_x+2;
				skip_y=man_y;
				direction=RIGHT;
			end
			else begin
				next_x=man_x;
				next_y=man_y+1;
				skip_x=man_x;
				skip_y=man_y+2;
				direction=DOWN;
			end
		end
		else begin
			if(cursor_x-man_x>man_y-cursor_y) begin
				next_x=man_x+1;
				next_y=man_y;
				skip_x=man_x+2;
				skip_y=man_y;
				direction=RIGHT;
			end
			else begin
				next_x=man_x;
				next_y=man_y-1;
				skip_x=man_x;
				skip_y=man_y-2;
				direction=UP;
			end
		end
		if(cursor==man) begin
			box_next=box;
			way_next=way;
			man_next=man;
			result=1'b0;
		end
		else if(way[{next_y,next_x}]) begin
			box_next=box;
			way_next=way;
			man_next={next_y,next_x};
			result=1'b1;
		end
		else if (box[{next_y,next_x}]) begin
			if(way[{skip_y,skip_x}]) begin
				way_next=way;
				way_next[{next_y,next_x}]=1'b1;
				way_next[{skip_y,skip_x}]=1'b0;
				box_next=box;
				box_next[{next_y,next_x}]=1'b0;
				box_next[{skip_y,skip_x}]=1'b1;
				man_next={next_y,next_x};
				result=1'b1;
			end
			else begin
				box_next=box;
				way_next=way;
				man_next=man;
				result=1'b0;
			end
		end
		else begin
			box_next=box;
			way_next=way;
			man_next=man;
			result=1'b0;
		end
	end
endmodule