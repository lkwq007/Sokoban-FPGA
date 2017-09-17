`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:22:12 07/05/2017 
// Design Name: 
// Module Name:    ps2_mouse_gate 
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
module ps2_mouse_gate(in,ps2_clk_hiz,out_clk);

input in;
input ps2_clk_hiz;
inout  out_clk;
assign out_clk = ps2_clk_hiz ? 1'bz : in;
endmodule
