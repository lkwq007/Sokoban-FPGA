//==================================================================================================
//  Filename      : ms_gen.v
//  Created On    : 2017-07-13 22:51:53
//  Last Modified : 2017-07-16 11:49:10
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : mine pool generator
//
//
//==================================================================================================
module ms_gen(/*autoport*/
//output
			mine,
			gen_done,
//input
			clk,
			reset,
			rand);
	parameter RESET=4'd0,START=4'd1,CONFRIM=4'd2,DONE=4'd3;
	input clk,reset;
	input[5:0] rand;
	output[63:0] mine;
	output gen_done;
	reg[3:0] state=0;
	reg[63:0] mine=64'd0;
	wire counter_clr=(state==RESET);
	wire confirm=(state==CONFRIM);
	wire[3:0] count;
	ms_counter mine_counter(.clk(clk),.en(confirm),.rst(counter_clr),.q(count),.co());
	assign gen_done=(state==DONE);
	always @(posedge clk) begin
		if (reset) begin
			state=RESET;
		end
		else begin
			case(state)
				RESET: begin
					state=START;
					mine=64'd0;
				end
				START: begin
					if(count>=4'd9) begin
						state=DONE;
					end
					else if(mine[rand]==1'b1) begin
						state=START;
					end
					else begin
						state=CONFRIM;
						mine[rand]=1'b1;
					end
				end
				CONFRIM: begin
					state=START;
				end
				DONE: begin
					state=DONE;
				end
				default: begin
					state=RESET;
				end
			endcase
		end
	end
endmodule