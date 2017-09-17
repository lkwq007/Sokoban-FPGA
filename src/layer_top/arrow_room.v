`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:51 07/11/2017 
// Design Name: 
// Module Name:    arrow_room 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module arrow_rom(addr, dout);
    input [4:0] addr;
    output [7:0] dout;
    reg [7:0] dout;
	always @(*) 
	  case(addr)
	   0:dout=8'h9F;
		1:dout=8'hFF;
		2:dout=8'h8F;
		3:dout=8'hFF;
		4:dout=8'h87;
		5:dout=8'hFF;
		6:dout=8'h83;
		7:dout=8'hFF;
		8:dout=8'h81;
		9:dout=8'hFF;
		10:dout=8'h80;
		11:dout=8'hfF;
		12:dout=8'h80;
		13:dout=8'h7F;
		14:dout=8'h80;
		15:dout=8'h3F;
      16:dout=8'h80;
		17:dout=8'h1F;
		18:dout=8'h80;
		19:dout=8'h0F;
		20:dout=8'h80;
		21:dout=8'h07;
		22:dout=8'h80;
		23:dout=8'h7f;
		24:dout=8'h88;
		25:dout=8'h7F;
		26:dout=8'h9c;
		27:dout=8'h3F;
		28:dout=8'hbc;
		29:dout=8'h3f;
		30:dout=8'hfe;
		default:dout=8'h1f;
	  endcase
endmodule

