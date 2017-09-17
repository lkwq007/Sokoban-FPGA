`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:21:54 07/11/2017 
// Design Name: 
// Module Name:    layer_top 
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
`include "parameter_vga.v"
module layer_top(ArrowPosX,ArrowPosY,x_pos,y_pos,RqFlag3,Red3,Blue3,Green3);
//	output 
	output RqFlag3;
	reg RqFlag3;
	output [7:0]Red3,Blue3,Green3;
// input
	input [9:0]ArrowPosX,ArrowPosY;
	input [9:0]x_pos,y_pos;

	reg [7:0] Red3;
   reg [7:0] Blue3;
   reg [7:0] Green3;
//	 显示鼠标	

	/* wire[11:0] sum_x;
	 wire[10:0] sum_y;
	 assign sum_x={2'b00,ArrowPosX}+{x_increment[8],x_increment[8],x_increment[8],x_increment};
	 assign sum_y={1'b0, ArrowPosY}+{~y_increment[8],~y_increment[8],~y_increment}+1'b1;
    //	 
	 always @(posedge clk)
	  if(reset) ArrowPosX<=384;
	    else if(data_ready)
		        begin
				  if(sum_x[11:10]==2'b11) ArrowPosX<=0;
				  else if(sum_x>783) ArrowPosX<=783;
						 else   ArrowPosX<=sum_x;
					end			
   //		
   always @(posedge clk)
	  if(reset) ArrowPosY<=284;
	    else if(data_ready)
		        begin
				  if(sum_y[10]==1'b1) ArrowPosY<=0;
				  else   if(sum_y>583) ArrowPosY<=583;
					   	 else   ArrowPosY<=sum_y;
					end	
	*/
   wire[4:0] addr;
	wire[7:0] dout;
	wire[9:0] x1,y1;
   assign 	x1=x_pos- ArrowPosX	;			
	assign 	y1=y_pos- ArrowPosY ;
   assign   addr={y1[3:0],x1[3]};
   //	
	arrow_rom  arrow_rom(.addr(addr), .dout(dout));
	reg arrow_pixel;
	always @(*)
	  case(x1[2:0])
	   0:arrow_pixel=dout[7];
	   1:arrow_pixel=dout[6];
	   2:arrow_pixel=dout[5];
	   3:arrow_pixel=dout[4];	
	   4:arrow_pixel=dout[3];
	   5:arrow_pixel=dout[2];
	   6:arrow_pixel=dout[1];
	   default:arrow_pixel=dout[0];	
	 endcase
		
		wire 	temp;
	   assign   temp=(x_pos>=ArrowPosX) && (x_pos<(ArrowPosX+16))
	               && (y_pos>=ArrowPosY) && (y_pos<(ArrowPosY+16)) ;
		wire  en_level, en_retry, en_retract,en_next,en_step,en_message;
		assign en_level= (x_pos>=`_EN_LEVEL_LEFT)&&(x_pos<=`_EN_LEVEL_RIGHT)&&(y_pos>=`_EN_LEVEL_UP)&&(y_pos<=`_EN_LEVEL_DOWN);			
		assign en_retry= (x_pos>=`_EN_RETRY_LEFT)&&(x_pos<=`_EN_RETRY_RIGHT)&&(y_pos>=`_EN_RETRY_UP)&&(y_pos<=`_EN_RETRY_DOWN);
		assign en_retract=(x_pos>=`_EN_RETRACT_LEFT)&&(x_pos<=`_EN_RETRACT_RIGHT)&&(y_pos>=`_EN_RETRACT_UP)&&(y_pos<=`_EN_RETRACT_DOWN);
		assign en_next=(x_pos>=`_EN_NEXT_LEFT)&&(x_pos<=`_EN_NEXT_RIGHT)&&(y_pos>=`_EN_NEXT_UP)&&(y_pos<=`_EN_NEXT_DOWN);
		assign en_step=(x_pos>=`_EN_STEP_LEFT)&&(x_pos<=`_EN_STEP_RIGHT)&&(y_pos>=`_EN_STEP_UP)&&(y_pos<=`_EN_STEP_DOWN);
		assign en_message=(x_pos>=`_EN_MESSAGE_LEFT)&&(x_pos<=`_EN_MESSAGE_RIGHT)&&(y_pos>=`_EN_MESSAGE_UP)&&(y_pos<=`_EN_MESSAGE_DOWN);
		wire EN;
		assign EN = en_retry|en_retract|en_level|en_next|en_step|en_message;			
		//合成
		always @(*)
		   if (temp &&(~arrow_pixel))
			 begin 
				if (EN) begin
				  Red3=8'd0;
				  Blue3=8'd0;
				  Green3=8'd0;
				  RqFlag3=1;
				end
				else begin
				  Red3={8{~arrow_pixel}};
				  Blue3={8{~arrow_pixel}};
				  Green3={8{~arrow_pixel}};
				  RqFlag3=1;
				end 
			end
			else 
			  begin 
				  Red3=8'd0;
				  Blue3=8'd0;
				  Green3=8'd0;
				  RqFlag3=0;
				end 
		
endmodule
