//`include "parameter_vga.v"

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:43:13 07/07/2017 
// Design Name: 
// Module Name:    ps2_dataprogramme 
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
module ps2_dataprogramme(data_ready,reset,
	x_increment,y_increment,
	left_button,right_button,
	sys_clk,
	ArrowPosX,ArrowPosY,
	cursor,
	GameArea,
	retract,retry,
	left,right);

input data_ready,sys_clk,reset;
input [8:0]x_increment,y_increment;
input left_button,right_button;

output     [9:0]ArrowPosX,ArrowPosY;
output reg [5:0]cursor;
output reg GameArea;
output reg retract,retry;
output reg left,right;
//initial position of Pos_x,Pos_y
	reg [9:0]ArrowPosX;
	reg [9:0]ArrowPosY;
//Boundary paramenter of game
/*parameter [9:0]X_boundary=10'd800;
	parameter [9:0]Y_boundary=10'd600;*/
//Boundary parameter of button retract and retry
/*parameter [9:0]X_retract_left=10'd100,X_retract_right=10'd150;
	parameter [9:0]Y_retract_up  =10'd200,Y_retract_down =10'd250;
	parameter [9:0]X_retry_left  =10'd200,X_retry_right  =10'd250;
	parameter [9:0]Y_retry_up    =10'd200,Y_retry_down  =10'd250;*/
//size of every block
//	parameter [6:0] x_size=X_boundary>>3;
//	parameter [6:0] y_size=Y_boundary>>3;
//tempdata

	reg [4:0] x_position;
	reg [4:0] y_position;
	reg [9:0] xincrement;
	reg [9:0] yincrement;

	 wire[10:0] sum_x;
	 wire[10:0] sum_y;
	 assign sum_x={1'b0, ArrowPosX}+{x_increment[8],x_increment[8],x_increment};
	 assign sum_y={1'b0, ArrowPosY}+{~y_increment[8],~y_increment[8],~y_increment}+1'b1;
    //	 
	 always @(posedge sys_clk)
	  if(reset) ArrowPosX<=384;
	    else if(data_ready)
		        begin
				  if(sum_x[10]==1'b1) ArrowPosX<=0;
				  else if(sum_x>783) ArrowPosX<=783;
						 else   ArrowPosX<=sum_x;
					end		
		 always @(posedge sys_clk)
	  if(reset) ArrowPosY<=284;
	    else if(data_ready)
		        begin
				  if(sum_y[10]==1'b1) ArrowPosY<=0;
				  else   if(sum_y>583) ArrowPosY<=583;
					   	 else   ArrowPosY<=sum_y;
					end		
	//reg left,right;
	always@(posedge sys_clk)begin
    if (reset ||left || right) begin
		 left<=0;
		 right<=0;	end
	 else if(data_ready)  begin 
				left<=left_button;
				right<=right_button;	end
	end	
			
always@(posedge sys_clk)begin
		/*xincrement={2'b0,x_increment[7:0]};
		yincrement={2'b0,y_increment[7:0]};
		//position 
		if (x_increment[8]) ArrowPosX=ArrowPosX-xincrement;
		else ArrowPosX=ArrowPosX+xincrement;
		if (y_increment[8]) ArrowPosY=ArrowPosY-yincrement;
		else ArrowPosY=ArrowPosY+yincrement;*/
	if (data_ready)begin
		//		left=left_button;
		//		right=right_button;
		if (ArrowPosX<`X_BOUNDARY_LEFT|| ArrowPosX>`X_BOUNDARY_RIGHT || ArrowPosY>`Y_BOUNDARY_DOWN || ArrowPosY<`Y_BOUNDARY_UP)begin 
			GameArea=0;
			cursor=6'b000000;
			//output retract & retry
			if (ArrowPosX>`_EN_RETRACT_LEFT && ArrowPosX<`_EN_RETRACT_RIGHT && ArrowPosY>`_EN_RETRACT_UP && ArrowPosY<`_EN_RETRACT_DOWN)
				retract=1;
			else if (ArrowPosX>`_EN_RETRY_LEFT && ArrowPosX<`_EN_RETRY_RIGHT && ArrowPosY>`_EN_RETRY_UP && ArrowPosY<`_EN_RETRY_DOWN)
				retry=1;
			else begin 
				retract=0;
				retry=0;
			end
		end
		else begin
			GameArea=1;
			//output cursor
			x_position=(ArrowPosX-`X_BOUNDARY_LEFT)>>5;
			y_position=(ArrowPosY-`Y_BOUNDARY_UP)>>5;
		  cursor=y_position*8+x_position;  
		end
	end	
	/*else begin
	     left=0;
	     right=0;
	  end*/
end
endmodule
