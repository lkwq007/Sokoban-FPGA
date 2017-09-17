//==================================================================================================
//  Filename      : ms_round.v
//  Created On    : 2017-07-13 22:28:53
//  Last Modified : 2017-07-16 11:10:29
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : 8*8 round cal 
//
//
//==================================================================================================
module ms_round(/*autoport*/
//output
			count_flat,is_zero,
//input
			mine);
	input[63:0] mine;
	output[255:0] count_flat;
	output[63:0] is_zero;
	// not supported in verilog 2001 or before
/*	output[3:0] count[63:0];
	reg[3:0] count[63:0];*/
	reg[63:0] count_0=0,count_1=0,count_2=0,count_3=0;
	reg[63:0] is_zero=0;
	assign count_flat={count_0,count_1,count_2,count_3};
/*	wire[255:0] pool;
	assign pool={
		mine[7:0],8'h0,
		mine[15:8],8'h0,
		mine[23:16],8'h0,
		mine[31:24],8'h0,
		mine[39:32],8'h0,
		mine[47:40],8'h0,
		mine[55:48],8'h0,
		mine[63:56],8'h0,
		128'h0
	};*/
	integer i=0;
	always @(*) begin
		for(i=0;i<64;i=i+1) begin
			if(i==0) begin
				{count_3[i],count_2[i],count_1[i],count_0[i]}=
					                 {3'b00,mine[i+1]}+
					{3'b00,mine[i+8]}+{3'b00,mine[i+9]};
			end
			else if(i==7) begin
				{count_3[i],count_2[i],count_1[i],count_0[i]}=
					{3'b00,mine[i-1]}+
					{3'b00,mine[i+7]}+{3'b00,mine[i+8]};
			end
			else if(i==56) begin
				{count_3[i],count_2[i],count_1[i],count_0[i]}=
					{3'b00,mine[i-8]}+{3'b00,mine[i-7]}+
					                 {3'b00,mine[i+1]};
			end
			else if(i==63) begin
				{count_3[i],count_2[i],count_1[i],count_0[i]}=
					{3'b00,mine[i-9]}+{3'b00,mine[i-8]}+
					{3'b00,mine[i-1]};
			end
			else if(i/8==0) begin
				{count_3[i],count_2[i],count_1[i],count_0[i]}=
					{3'b00,mine[i-1]}+{3'b00,mine[i+1]}+
					{3'b00,mine[i+7]}+{3'b00,mine[i+8]}+{3'b00,mine[i+9]};
			end
			else if(i/8==7) begin
				{count_3[i],count_2[i],count_1[i],count_0[i]}=
					{3'b00,mine[i-7]}+{3'b00,mine[i-8]}+{3'b00,mine[i-9]}+
					{3'b00,mine[i-1]}+{3'b00,mine[i+1]};
			end
			else if(i%8==0) begin
				{count_3[i],count_2[i],count_1[i],count_0[i]}=
					{3'b00,mine[i-8]}+{3'b00,mine[i-7]}+
					                 {3'b00,mine[i+1]}+
					{3'b00,mine[i+8]}+{3'b00,mine[i+9]};
			end
			else if(i%8==7) begin
				{count_3[i],count_2[i],count_1[i],count_0[i]}=
					{3'b00,mine[i-8]}+{3'b00,mine[i-9]}+
					{3'b00,mine[i-1]}+
					{3'b00,mine[i+7]}+{3'b00,mine[i+8]};
			end
			else begin
				{count_3[i],count_2[i],count_1[i],count_0[i]}=
					{3'b00,mine[i-7]}+{3'b00,mine[i-8]}+{3'b00,mine[i-9]}+
					{3'b00,mine[i-1]}+{3'b00,mine[i+1]}+
					{3'b00,mine[i+7]}+{3'b00,mine[i+8]}+{3'b00,mine[i+9]};
			end
		end
	end
	integer j;
	always @(*) begin
		for(j=0;j<64;j=j+1) begin
			if({count_3[j],count_2[j],count_1[j],count_0[j]}==3'd0) begin
				is_zero[j]=1;
			end
			else begin
				is_zero[j]=0;
			end
		end
	end
/*	integer y,x=1;
	always @(*) begin
		for(y=1;y<7;y=y+1) begin
			//for(x=0;x<8;x=x+1) begin
				{count_3[y*8+x],count_2[y*8+x],count_1[y*8+x],count_0[y*8+x]}=
				{3'b00,pool[(y)*16+(x+1)]}+
				{3'b00,pool[(y+1)*16+(x+1)]}+
				{3'b00,pool[(y-1)*16+(x+1)]}+
				{3'b00,pool[(y)*16+(x-1)]}+
				{3'b00,pool[(y+1)*16+(x-1)]}+
				{3'b00,pool[(y-1)*16+(x-1)]}+
				{3'b00,pool[(y+1)*16+(x)]}+
				{3'b00,pool[(y-1)*16+(x)]};
			//end
		end
	end*/
endmodule