`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:13:49 07/05/2017 
// Design Name: 
// Module Name:    ps2_mouse_watchdog 
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
module ps2_mouse_watchdog(reset,clk,falling_edge,timer_150us_done,timer_400us_done);

input clk,reset;
input falling_edge;
output timer_150us_done,timer_400us_done;
reg [15:0]q=0;
wire timer_150us_done,timer_400us_done;
//reg [15:0]temp=0;
//reg [15:0]falling;

//assign timer_150us_done=(q==7500);
assign timer_150us_done=(q==7500);
assign timer_400us_done=(q==60000);
always@(posedge clk) 
if (reset || falling_edge) q=0;
else q=q+1;

/*
begin


   assign falling={15'b0,falling_edge};
	if (reset) q=0;
	else if (q==16'd7500) begin 
		timer_150us_done=1;
		q=q+1;
		end
	else begin
		q=q+1;
		timer_150us_done=0;
		if (q<16'd20000)begin
			temp=temp+falling;
			end
		else q=16'b0;
	if (q==16'd20000 && temp==16'd0) timer_400us_done=1;
	else timer_400us_done=0;
		end
end
*/
endmodule
