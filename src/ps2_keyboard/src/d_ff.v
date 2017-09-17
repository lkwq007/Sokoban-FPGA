`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:10:52 07/13/2017 
// Design Name: 
// Module Name:    d_ff 
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
module d_ff(reset,sys_clk,ps2_clk,ps2_data,ps2_clk_s,ps2_data_s);

	input sys_clk,reset;
	input ps2_clk,ps2_data;
	
	output reg ps2_clk_s,ps2_data_s;
	
	always@(posedge sys_clk)begin
		if (reset)begin 
			ps2_clk_s<=0;
			ps2_data_s<=0;
		end
		else begin
			ps2_clk_s<=ps2_clk;
			ps2_data_s<=ps2_data;
		end
	end
endmodule
