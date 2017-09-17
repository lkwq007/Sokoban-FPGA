//==================================================================================================
//  Filename      : ms_counter.v
//  Created On    : 2017-07-13 22:50:23
//  Last Modified : 2017-07-13 23:25:41
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : gen counter for minesweeper
//
//
//==================================================================================================
module ms_counter(clk,en,rst,co,q);
	parameter N=16,CounterBits=4;
	input clk,en,rst;
	output co;
	output reg[CounterBits-1:0] q=0;
	assign co=(q==N-1);
	always @(posedge clk) begin
		if(rst) begin
			q=0;		
		end
		else begin
			if(en) begin
				if(q==N-1) begin
					q=0;
				end
				else begin
					q=q+1;
				end
			end
			else begin
				q=q;
			end
		end
	end
endmodule