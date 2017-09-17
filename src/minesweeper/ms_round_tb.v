//==================================================================================================
//  Filename      : ms_round_tb.v
//  Created On    : 2017-07-14 09:06:52
//  Last Modified : 2017-07-16 11:11:59
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : 
//
//
//==================================================================================================
module ms_round_tb();
	reg[63:0] mine;
	wire[255:0] count_flat;
	reg[2:0] count[63:0];
	reg[63:0] open;
	wire[63:0] count_0,count_1,count_2,count_3;
	wire[63:0] is_zero,check;
	integer x,y;
	assign  {count_0,count_1,count_2,count_3}=count_flat;
	always @(*) begin
		for(y=0;y<8;y=y+1) begin
			for(x=0;x<8;x=x+1) begin
				count[y*8+x]={count_3[y*8+x],count_2[y*8+x],count_1[y*8+x],count_0[y*8+x]};
			end
		end
	end
	ms_round counter(.mine(mine),.count_flat(count_flat),.is_zero(is_zero));
	ms_round_check checker(.check(check),.is_zero(is_zero),.open(open));
	initial begin
		#100
		mine=0;
		open=0;
		#100
		mine=64'b1111111110000001100000011001000110000001100000011000000111111111;
		#100
		mine=0;
		#100
		mine=1;
		open=8;
		#100
		$stop;
	end

endmodule