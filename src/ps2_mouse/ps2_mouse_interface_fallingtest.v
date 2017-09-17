`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:51:33 07/04/2017 
// Design Name: 
// Module Name:    ps2_mouse_interface_fallingtest 
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
module ps2_mouse_interface_fallingtest(reset,clk,ps2_clk,falling_edge);

input clk,reset;
input ps2_clk;
output reg falling_edge;

reg [1:0]state,next_state=2'b00;
parameter [1:0]ps2_clk_h=2'b00;
parameter	[1:0]ps2_clk_falling=2'b01;
parameter	[1:0]ps2_clk_l=2'b10;

always@(posedge clk)begin
  if (reset) state<=ps2_clk_h;
  else  state<=next_state;
end
always@(state or ps2_clk)begin
	case (state) 
		ps2_clk_h: begin
						falling_edge<=0;
						if (ps2_clk)
							next_state<=ps2_clk_h;
						else 
							next_state<=ps2_clk_falling;
						//state<=next_state;
						end
		ps2_clk_falling: begin
						falling_edge<=1; 
						next_state<=ps2_clk_l;
						//state<=next_state;
						end
	//	ps2_clk_l:
		default:begin
						falling_edge<=0;
						if (ps2_clk)
							next_state<=ps2_clk_h;
						else 
							next_state<=ps2_clk_l;
						//state<=next_state;
						end
	//	default:;
	endcase
end
endmodule
