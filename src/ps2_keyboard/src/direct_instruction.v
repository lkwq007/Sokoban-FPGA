`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
// Create Date:    10:28:53 07/14/2017 
// Module Name:    direct_instruction 

//////////////////////////////////////////////////////////////////////////////////

module direct_instruction(clk,reset,released,ascii,data_ready,read,a_left,m_switch,w_up,s_down,d_right,enter_next,esc_retry,backspace_retract);
    input clk;
    input reset;
    input released;
    input [7:0] ascii;
    input data_ready;
    output read;
    output a_left;
    output w_up;
    output s_down;
    output d_right;
    output m_switch;
	 output enter_next;
	 output esc_retry;
	 output backspace_retract;
	 // Parameters
		parameter a_CODE=8'h61;
		parameter w_CODE=8'h77;
		parameter s_CODE=8'h73;
		parameter d_CODE=8'h64;
		parameter A_CODE=8'h41;
		parameter W_CODE=8'h57;
		parameter S_CODE=8'h53;
		parameter D_CODE=8'h44;
		parameter ENTER_CODE=8'h0d;
		parameter BACKSPACE_CODE=8'h08;
		parameter ESC_CODE=8'h1b;
		parameter m_CODE=8'd109;
		parameter M_CODE=8'd77;
   // Internal signal declarations
	reg[7:0] q;
	//输出一个时钟周期的a_on,w_on,s_on,d_on信号
	reg  a_on,w_on,s_on,d_on,m_on;
	reg esc_on, backspace_on, enter_on;
	//wire read;
	reg key_on;
	always @(posedge clk)
	  begin
		 a_on=0;
		 w_on=0;
		 s_on=0;
		 d_on=0;
		 m_on=0;
		 enter_on=0;
		 esc_on=0;
		 backspace_on=0;
		 key_on=0;
		 if(data_ready)
   		begin
		    if((~ascii[7]) && (~released))
	      	begin
				 a_on= (ascii==a_CODE)||(ascii==A_CODE);
				 w_on  = (ascii==w_CODE)||(ascii==W_CODE);
				 s_on  = (ascii==s_CODE)||(ascii==S_CODE);
				 d_on  = (ascii==d_CODE)||(ascii==D_CODE);
				 m_on  = (ascii==m_CODE)||(ascii==M_CODE);
				 enter_on =(ascii==ENTER_CODE);
				 esc_on =(ascii==ESC_CODE);
				 backspace_on =(ascii==BACKSPACE_CODE);
				 key_on=1;
			  end
			 end  
		end	  
	//		  
	assign {d_right,s_down,w_up,a_left,esc_retry,backspace_retract,enter_next,m_switch}=q;
	assign read=1'b1;
   // 点亮相关的指示灯
	always @(posedge clk)
		if (reset)    q <= 0;
		else if(key_on)   q<= {d_on,s_on,w_on,a_on,esc_on,backspace_on,enter_on,m_on};
		else begin
			q<=0;
		end
endmodule
