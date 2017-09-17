`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:57:13 07/05/2017 
// Design Name: 
// Module Name:    ps2_mouse_bit_counter 
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
module ps2_mouse_bit_counter(clk,reset,bit_reset,bit_counter,falling_edge);

input clk;
input reset;
input falling_edge;
input bit_reset;
output [6:0]bit_counter;
reg [6:0]q=7'b0;
wire [6:0]bit_counter;
assign bit_counter=q;
always@(posedge clk)begin
	if (reset|| bit_reset) q=7'b0;
	else if (falling_edge)q=q+1;
end
/*
always@(posedge clk)begin
	if (reset) q=7'b0;
	else if (bit_reset) q=7'b1;
	else if (q==34) q=7'b1;
	else if (falling_edge)q=q+1;
	else q=q;
	assign bit_counter=q-1;
end
*/
endmodule
