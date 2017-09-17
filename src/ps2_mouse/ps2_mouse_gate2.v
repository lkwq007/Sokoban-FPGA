`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:53:36 07/05/2017 
// Design Name: 
// Module Name:    ps2_mouse_gate2 
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
module ps2_mouse_gate2(in,ps2_data_hiz,out_data);
input in;
input ps2_data_hiz;
inout  out_data;
assign out_data = ps2_data_hiz? 1'bz :  in;

endmodule
