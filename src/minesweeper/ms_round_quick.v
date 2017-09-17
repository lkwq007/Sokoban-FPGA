module ms_round_quick(/*autoport*/
//output
			quick,
			open_quick,
//input
			open,
			cursor,
			count_flag,
			count_mine);
	input[63:0] open;
	input[5:0] cursor;
	input[255:0] count_flag,count_mine;
	output[63:0] quick,open_quick;
	reg[63:0] quick,open_quick;
	integer i;
	always @(*) begin
		for(i=0;i<64;i=i+1) begin
			if({count_flag[i],count_flag[i+64],count_flag[i+128],count_flag[i+192]}=={count_mine[i],count_mine[i+64],count_mine[i+128],count_mine[i+192]}) begin
				quick[i]=1;
			end
			else begin
				quick[i]=0;
			end
		end
	end
	always @(*) begin
		if(cursor==0) begin
			open_quick=open;
			open_quick[cursor+1]=1;
			open_quick[cursor+8]=1;
			open_quick[cursor+9]=1;
		end
		else if(cursor==7) begin
			open_quick=open;
			open_quick[cursor-1]=1;
			open_quick[cursor+7]=1;
			open_quick[cursor+8]=1;
		end
		else if(cursor==56) begin
			open_quick=open;
			open_quick[cursor-8]=1;
			open_quick[cursor-7]=1;
			open_quick[cursor+1]=1;
		end
		else if(cursor==63) begin
			open_quick=open;
			open_quick[cursor-9]=1;
			open_quick[cursor-8]=1;
			open_quick[cursor-1]=1;
		end
		else if(cursor[5:3]==0) begin
			open_quick=open;
			open_quick[cursor-1]=1;
			open_quick[cursor+1]=1;
			open_quick[cursor+7]=1;
			open_quick[cursor+8]=1;
			open_quick[cursor+9]=1;
		end
		else if(cursor[5:3]==7) begin
			open_quick=open;
			open_quick[cursor-7]=1;
			open_quick[cursor-8]=1;
			open_quick[cursor-9]=1;
			open_quick[cursor-1]=1;
			open_quick[cursor+1]=1;
		end
		else if(cursor[2:0]==0) begin
			open_quick=open;
			open_quick[cursor-8]=1;
			open_quick[cursor-7]=1;
			open_quick[cursor+1]=1;
			open_quick[cursor+8]=1;
			open_quick[cursor+9]=1;
		end
		else if(cursor[2:0]==7) begin
			open_quick=open;
			open_quick[cursor-8]=1;
			open_quick[cursor-9]=1;
			open_quick[cursor-1]=1;
			open_quick[cursor+7]=1;
			open_quick[cursor+8]=1;
		end
		else begin
			open_quick=open;
			open_quick[cursor-7]=1;
			open_quick[cursor-8]=1;
			open_quick[cursor-9]=1;
			open_quick[cursor-1]=1;
			open_quick[cursor+1]=1;
			open_quick[cursor+7]=1;
			open_quick[cursor+8]=1;
			open_quick[cursor+9]=1;
		end
	end
endmodule