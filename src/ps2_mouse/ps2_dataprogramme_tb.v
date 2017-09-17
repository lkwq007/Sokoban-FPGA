`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:07:45 07/08/2017 
// Design Name: 
// Module Name:    ps2_dataprogramme_tb 
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
module ps2_dataprogramme_tb;

//module mouse_interterface_tb_v;

	// Inputs
		//reg clk;
		//reg reset;
	reg data_ready,sys_clk;
	reg [8:0]x_increment,y_increment;
	reg left_button,right_button;
	// Outputs
		//wire left_button;
		//wire right_button;
	wire     [7:0]ArrowPosX,ArrowPosY;
	wire	   [5:0]cursor;
	wire  GameArea;
	wire  retract,retry;
	wire  left,right;
	// Bidirs
		//wire ps2_clk;
		//wire ps2_data;

	// Instantiate the Unit Under Test (UUT)
 ps2_dataprogramme uut(
	.data_ready(data_ready),
	.x_increment(x_increment),.y_increment(y_increment),
	.left_button(left_button),.right_button(right_button),
	.sys_clk(sys_clk),
	.ArrowPosX(ArrowPosX),.ArrowPosY(ArrowPosY),
	.cursor(cursor),
	.GameArea(GameArea),
	.retract(retract),.retry(retry),
	.left(left),.right(right)
	);
	
   //reg link_clk,link_data;
	//reg ps2_clk_reg,ps2_data_reg;
	
	 //assign  response={1'b1,1'b0,8'b1111_1010,1'b0};
	reg [8:0]byte_1={1'b1,1'b0,8'b0001_1001,1'b0};
	reg [8:0]x_increment_1={1'b0,8'b0011_1000};
	reg [8:0]y_increment_1={1'b0,8'b0011_0000};
	reg [8:0]x_increment_2={1'b1,8'b0011_0000};
	reg [8:0]y_increment_2={1'b1,8'b0011_1000};
	
	
	initial begin	sys_clk = 0; forever #5 sys_clk=~sys_clk; end
	initial begin  
		begin left_button = 0; right_button = 0;end
		forever begin #(105)left_button = 1; #(5)left_button = 0;
						  #(150)right_button = 1; #(5)right_button = 0;
					end
		end
				  
	
	reg temp[10:1];
	  integer i=0; 
	initial begin
	data_ready = 0;//link_clk=1;link_data=1;ps2_clk_reg=1;ps2_data_reg=1;
	#(20)	data_ready =1;//link_clk=0;
	//#(10*7510) link_clk=1;link_data=0;
	//repeat (10) begin
	//  #(50)    ps2_clk_reg=0;
	//  	#(50)	   ps2_clk_reg=1;end
		//ack
	//	link_data=1;ps2_data_reg=0;
	//	#(50)    ps2_clk_reg=0;
	//	#(50)	   ps2_clk_reg=1;ps2_data_reg=1;
	//	#(200)
 //   temp=response;
		    
		 assign x_increment=x_increment_1;
		 assign y_increment=y_increment_1;
		 #(100)
		 
		 assign x_increment=x_increment_1;
		 assign y_increment=y_increment_1;
		 #(100)
		 
		 assign x_increment=x_increment_1;
		 assign y_increment=y_increment_1;
		 #(100)
		 
		 assign x_increment=x_increment_2;
		 assign y_increment=y_increment_1;
		 #(100)
		 
		 assign x_increment=x_increment_1;
		 assign y_increment=y_increment_2;
		 #(100)
		 
		 assign x_increment=x_increment_1;
		 assign y_increment=y_increment_1;
		 #(100)
		 
		 assign x_increment=x_increment_1;
		 assign y_increment=y_increment_1;
		 #(100)
		 
		 assign x_increment=x_increment_1;
		 assign y_increment=y_increment_1;
		 #(100)
		 
		 assign x_increment=x_increment_1;
		 assign y_increment=y_increment_1;
		 #(100)
		 
		 assign x_increment=x_increment_1;
		 assign y_increment=y_increment_2;
		 #(100)
		 
		#(200)$stop; 
	
         end 
	  


endmodule
