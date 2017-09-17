`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:41:14 07/13/2017 
// Design Name: 
// Module Name:    ps2_dcm 
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
module ps2_dcm (
		 CLKIN_IN	,
		 CLKDV_OUT	,
		 CLKIN_IBUFG_OUT	,
		 CLK0_OUT	,
		 LOCKED_OUT);
input CLKIN_IN;
output reg  CLKDV_OUT=0,CLKIN_IBUFG_OUT=0,CLK0_OUT=0,LOCKED_OUT=0;

always@(posedge CLKIN_IN)begin
	CLKDV_OUT=~CLKDV_OUT;
end
endmodule
