//==================================================================================================
//  Filename      : ms_update.v
//  Created On    : 2017-07-14 10:25:21
//  Last Modified : 2017-07-15 21:43:44
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : update minesweeper pool
//
//
//==================================================================================================
module ms_update(/*autoport*/
//output
			open_next,
			can_update,
//input
			check,
			flag,
			open,
			doubt);
	input[63:0] check,flag,open,doubt;
	output[63:0] open_next;
	output can_update;
	wire[63:0] should_open;
	assign should_open=check&(~open)&(~flag)&(~doubt);
	assign can_update=|(should_open);
	assign open_next=open|should_open;
endmodule