`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:10:02 07/04/2017 
// Design Name: 
// Module Name:    ps2_mouse_shiftreg 
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
module ps2_mouse_shiftreg(falling_edge,clk,reset,load,q,din);

input reset;
input falling_edge;
input clk;
input load;
input din;
output reg [32:0]q;

always@(posedge clk)begin 
	if (reset) q=33'b0;
	else begin
		if (load) q={23'h7fffff,1'b0,8'hf4,1'b0};
		else begin
			if (falling_edge) q={din,q[32:1]};
			else q=q;
			end
	end
end
endmodule
