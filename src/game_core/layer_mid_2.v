`include "parameter_vga.v"
//==================================================================================================
//  Filename      : layer_mid_2.v
//  Created On    : 2017-07-06 09:26:43
//  Last Modified : 2017-07-13 15:38:43
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : 
//
//
//==================================================================================================
module layer_mid_2(/*autoport*/
//output
			RqFlag2,
			Red2,
			Blue2,
			Green2,
//input
			clk,
			x_pos,
			y_pos,
			man,
			direction);
	parameter TOP=`Y_BOUNDARY_UP,LEFT=`X_BOUNDARY_LEFT,WIDTH=10'd32*8,HEIGHT=10'd32*8;
	parameter MAN_UP=2'd0,MAN_DOWN=2'd1,MAN_LEFT=2'd2,MAN_RIGHT=2'd3;
	input clk;
	input[9:0] x_pos,y_pos;
	input[5:0] man;
	input[1:0] direction;
	output RqFlag2;
	reg RqFlag2=0;
	output[7:0] Red2,Blue2,Green2;
	reg[7:0] Red2,Blue2,Green2;
	wire rom_en;
	wire[9:0] addr;
	wire[9:0] x_offset,y_offset;
	wire[5:0] cursor;
	assign rom_en=(x_pos>=LEFT)&&(x_pos<LEFT+WIDTH)&&(y_pos>=TOP)&&(y_pos<TOP+HEIGHT);
	assign x_offset=x_pos-LEFT;
	assign y_offset=y_pos-TOP;
	// assume 64*64 block
	assign addr={y_offset[4:0],x_offset[4:0]};
	assign cursor={y_offset[7:5],x_offset[7:5]};
	wire[7:0] man_red_down,man_blue_down,man_green_down;
	wire[7:0] man_red_left,man_blue_left,man_green_left;
	wire[7:0] man_red_up,man_blue_up,man_green_up;
	wire[7:0] man_red_right,man_blue_right,man_green_right;
	reg[7:0] man_red,man_green,man_blue;
	always @(*) begin
		case(direction)
			MAN_UP: begin
				man_red=man_red_up;
				man_blue=man_blue_up;
				man_green=man_green_up;
			end
			MAN_DOWN: begin
				man_red=man_red_down;
				man_blue=man_blue_down;
				man_green=man_green_down;
			end
			MAN_LEFT: begin
				man_red=man_red_left;
				man_blue=man_blue_left;
				man_green=man_green_left;
			end
			MAN_RIGHT: begin
				man_red=man_red_right;
				man_blue=man_blue_right;
				man_green=man_green_right;
			end
		endcase
	end
	always @(*) begin
	//man_red!=8'hff&&man_green!=8'hff&&man_blue!=8'hcc
		if(rom_en&&cursor==man&&{man_red,man_green,man_blue}!=24'hffffcc) begin
			Red2=man_red;
			Blue2=man_blue;
			Green2=man_green;
			RqFlag2=1;
		end
		else begin
			Red2=0;
			Blue2=0;
			Green2=0;
			RqFlag2=0;
		end
	end
	manRom man_inst_down(
		.addr(addr),
		.clk(clk),
		.dout({man_red_down,man_green_down,man_blue_down}),
		.en(rom_en));
	manRomLeft man_inst_left(
		.addr(addr),
		.clk(clk),
		.dout({man_red_left,man_green_left,man_blue_left}),
		.en(rom_en));
	manRomRight man_inst_right(
		.addr(addr),
		.clk(clk),
		.dout({man_red_right,man_green_right,man_blue_right}),
		.en(rom_en));
	manRomUp man_inst_up(
		.addr(addr),
		.clk(clk),
		.dout({man_red_up,man_green_up,man_blue_up}),
		.en(rom_en));

endmodule