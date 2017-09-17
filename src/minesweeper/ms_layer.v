`include "parameter_vga.v"
module ms_layer(/*autoport*/
//output
			RqFlag1,
			Red1,
			Blue1,
			Green1,
//input
			clk,
			lose,
			flag,
			doubt,
			mine,
			open,
			x_pos,
			y_pos,
			count);
	input clk,lose;
	input[63:0] flag,doubt,mine,open; 
	input[9:0] x_pos,y_pos;
	input[255:0] count;
	output RqFlag1;
	output[7:0] Red1,Blue1,Green1;
	reg[7:0] Red1,Blue1,Green1;
	reg rqflag=0,mask=0;
	wire[9:0] addr;
	wire[13:0] open_addr;
	wire[9:0] x_offset,y_offset;
	wire[5:0] cursor;
	parameter TOP=`Y_BOUNDARY_UP,LEFT=`X_BOUNDARY_LEFT,WIDTH=10'd32*8,HEIGHT=10'd32*8;
	assign x_offset=x_pos-LEFT;
	assign y_offset=y_pos-TOP;
	// assume 64*64 block
	assign addr={y_offset[4:0],x_offset[4:0]};
	assign open_addr={count[cursor],count[cursor+64],count[cursor+128],count[cursor+192],addr};
	assign cursor={y_offset[7:5],x_offset[7:5]};
	assign RqFlag1=mask&rqflag;
	wire rom_en;
	assign rom_en=(x_pos>=LEFT)&&(x_pos<LEFT+WIDTH)&&(y_pos>=TOP)&&(y_pos<TOP+HEIGHT);
	wire[7:0] mine_open_red,mine_open_blue,mine_open_green;
	wire[7:0] flag_red,flag_blue,flag_green;
	wire[7:0] back_red,back_blue,back_green;
	wire[7:0] doubt_red,doubt_blue,doubt_green;
	wire[7:0] mine_red,mine_blue,mine_green;
	wire[7:0] open_red,open_blue,open_green;
	reg[4:0] zk;
	always @(*) begin
		if(x_pos<LEFT||y_pos<TOP||x_pos>=LEFT+WIDTH||y_pos>=TOP+HEIGHT) begin
			mask<=0;
		end
		else begin
			mask<=1;
		end
		if(mine[cursor]==1&&open[cursor]==1) begin
			Red1<=mine_open_red;
			Blue1<=mine_open_blue;
			Green1<=mine_open_green;
			rqflag<=1;
		end
/*		else if(mine[cursor]==1) begin
			Red1<=mine_red;
			Blue1<=mine_blue;
			Green1<=mine_green;
			rqflag<=1;
		end*/
		else if(flag[cursor]==1) begin
			Red1<=flag_red;
			Blue1<=flag_blue;
			Green1<=flag_green;
			rqflag<=1;
		end
		else if(doubt[cursor]==1) begin
			Red1<=doubt_red;
			Blue1<=doubt_blue;
			Green1<=doubt_green;
			rqflag<=1;
		end
		else if(open[cursor]==1) begin
			Red1<=open_red;
			Blue1<=open_blue;
			Green1<=open_green;
			rqflag<=1;
		end
		else begin
			Red1<=back_red;
			Blue1<=back_blue;
			Green1<=back_green;
			rqflag<=1;
		end
	end

	openRom open_inst(
		.addr(open_addr),
		.clk(clk),
		.dout({open_red,open_green,open_blue}),
		.en(rom_en));
	flagRom flag_inst(
		.addr(addr),
		.clk(clk),
		.dout({flag_red,flag_green,flag_blue}),
		.en(rom_en));
	cellRom cell_inst(
		.addr(addr),
		.clk(clk),
		.dout({back_red,back_green,back_blue}),
		.en(rom_en));
	mineRom mine_open_inst(
		.addr(addr),
		.clk(clk),
		.dout({mine_open_red,mine_open_green,mine_open_blue}),
		.en(rom_en));
	doubtRom doubt_inst(
		.addr(addr),
		.clk(clk),
		.dout({doubt_red,doubt_green,doubt_blue}),
		.en(rom_en));
endmodule