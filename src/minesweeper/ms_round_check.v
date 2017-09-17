//==================================================================================================
//  Filename      : ms_round.v
//  Created On    : 2017-07-13 22:28:53
//  Last Modified : 2017-07-14 10:27:44
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : 8*8 round cal 
//
//
//==================================================================================================
module ms_round_check(/*autoport*/
//output
			check,
//input
			is_zero,
			open);
	input[63:0] is_zero;
	input[63:0] open;
	output[63:0] check;
	reg[63:0] check;
	wire[63:0] temp;
	assign temp=open&is_zero;
	integer i=0;
	always @(*) begin
		for(i=0;i<64;i=i+1) begin
			if(i==0) begin
				check[i]=
					            {temp[i+1]}|
					{temp[i+8]}|{temp[i+9]};
			end
			else if(i==7) begin
				check[i]=
					{temp[i-1]}|
					{temp[i+7]}|{temp[i+8]};
			end
			else if(i==56) begin
				check[i]=
					{temp[i-8]}|{temp[i-7]}|
					            {temp[i+1]};
			end
			else if(i==63) begin
				check[i]=
					{temp[i-9]}|{temp[i-8]}|
					{temp[i-1]};
			end
			else if(i/8==0) begin
				check[i]=
					{temp[i-1]}|{temp[i+1]}|
					{temp[i+7]}|{temp[i+8]}|{temp[i+9]};
			end
			else if(i/8==7) begin
				check[i]=
					{temp[i-7]}|{temp[i-8]}|{temp[i-9]}|
					{temp[i-1]}|{temp[i+1]};
			end
			else if(i%8==0) begin
				check[i]=
					{temp[i-8]}|{temp[i-7]}|
					                 {temp[i+1]}|
					{temp[i+8]}|{temp[i+9]};
			end
			else if(i%8==7) begin
				check[i]=
					{temp[i-8]}|{temp[i-9]}|
					{temp[i-1]}|
					{temp[i+7]}|{temp[i+8]};
			end
			else begin
				check[i]=
					{temp[i-7]}|{temp[i-8]}|{temp[i-9]}|
					{temp[i-1]}|{temp[i+1]}|
					{temp[i+7]}|{temp[i+8]}|{temp[i+9]};
			end
		end
	end
endmodule