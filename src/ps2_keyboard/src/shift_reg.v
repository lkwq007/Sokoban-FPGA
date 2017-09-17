`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:37:23 07/13/2017 
// Design Name: 
// Module Name:    shift_reg 
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
module shift_reg(sys_clk,reset,din,shift_en,q);

	input sys_clk,reset;
	input din;
	input shift_en;
	
	output reg [10:0]q;

always@(posedge sys_clk)begin

	if (reset) q<=0;
	else if (shift_en)begin 
		q<={din,q[10:1]};
	end

end
endmodule
