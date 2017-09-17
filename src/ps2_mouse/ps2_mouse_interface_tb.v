`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:12:35 06/27/2012
// Design Name:   ps2_mouse_interface
// Module Name:   C:/lab14/ps2_mouse/src/mouse_interterface_tb.v
// Project Name:  ps2_mouse
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ps2_mouse_interface
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mouse_interterface_tb_v;

	// Inputs
	reg sys_clk;
	reg reset;

	// Outputs
	wire left_button;
	wire right_button;
	wire [8:0] x_increment;
	wire [8:0] y_increment;
	wire data_ready;
	wire error_no_ack;

	// Bidirs
	wire ps2_clk;
	wire ps2_data;

	// Instantiate the Unit Under Test (UUT)
	ps2_mouse_interface uut (
		.sys_clk(sys_clk), 
		.reset(reset), 
		.ps2_clk(ps2_clk), 
		.ps2_data(ps2_data), 
		.left_button(left_button), 
		.right_button(right_button), 
		.x_increment(x_increment), 
		.y_increment(y_increment), 
		.data_ready(data_ready), 
		.error_no_ack(error_no_ack)
	);
   reg link_clk,link_data;
	reg ps2_clk_reg,ps2_data_reg;
	
	reg [10:0]response={1'b1,1'b0,8'b1111_1010,1'b0};
	 //assign  response={1'b1,1'b0,8'b1111_1010,1'b0};
	reg [10:0]byte_1={1'b1,1'b0,8'b0001_1001,1'b0};
	reg [10:0]byte_2={1'b1,1'b1,8'b1011_1000,1'b0};
	reg [10:0]byte_3={1'b1,1'b0,8'b0001_1001,1'b0};
	initial begin	sys_clk = 0; forever #5 sys_clk=~sys_clk; end
	//
	reg temp[10:1];
	  integer i=0; 
	initial begin
	reset = 1;link_clk=1;link_data=1;ps2_clk_reg=1;ps2_data_reg=1;
	#(20)	reset = 0;link_clk=0;
	#(10*7510) link_clk=1;link_data=0;
	repeat (10) begin
	   #(50)    ps2_clk_reg=0;
	  	#(50)	   ps2_clk_reg=1;end
		//ack
		link_data=1;ps2_data_reg=0;
		#(50)    ps2_clk_reg=0;
		#(50)	   ps2_clk_reg=1;ps2_data_reg=1;
		#(200)
 //   temp=response;
    
		for (i=0;i<11;i=i+1)
		    
		  begin 
		   ps2_data_reg= response[i]; 
		   #(50)    ps2_clk_reg=0;
		   #(50)   ps2_clk_reg=1;
		 end	
	 		
		
		#(200)
	  for (i=0;i<11;i=i+1)
		  begin 
		   ps2_data_reg= byte_1[i];
		   #(50)    ps2_clk_reg=0;
		   #(50)    ps2_clk_reg=1;
		 end	
	
	   #(200) 
	  for (i=0;i<11;i=i+1)
		  begin 
		         ps2_data_reg= byte_2[i]; 
		   #(50)    ps2_clk_reg=0;
		   #(50)    ps2_clk_reg=1;
		 end	
		 
		#(200)  
	  for (i=0;i<11;i=i+1)
		  begin 
		   ps2_data_reg= byte_3[i]; 
		   #(50)    ps2_clk_reg=0;
		   #(50)    ps2_clk_reg=1;
		 end	 
		#(200)$stop; 
	
         end 
      
		  assign ps2_clk= link_clk? ps2_clk_reg:1'bZ;
      assign ps2_data=link_data? ps2_data_reg:1'bZ;
	  
        
endmodule


