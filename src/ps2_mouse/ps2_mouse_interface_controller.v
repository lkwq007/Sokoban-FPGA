`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:13 07/04/2017 
// Design Name: 
// Module Name:    ps2_mouse_interface_controller 
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
module ps2_mouse_interface_controller(reset,clk,
	timer_150us_done,timer_400us_done,
	bit_reset,bit_counter,
	ps2_clk_hiz,ps2_data_hiz,
	load,q,
	data_ready,error_no_ack,
	ps2_data);
	
	input reset,clk;
	input timer_150us_done,timer_400us_done;
	input [6:0]bit_counter;
	input [32:0]q;
	input ps2_data;
	output reg bit_reset;
	output reg ps2_clk_hiz,ps2_data_hiz;
	output reg load;
	output reg data_ready,error_no_ack;
	
	reg [3:0]state,next_state;
	parameter [3:0] start=4'b0000,
				hold_clk_l=4'b0001,
				transmit=4'b0010,
				error_ack=4'b0011,
				wait_response=4'b0100,
				receive_start=4'b0101,
				gather=4'b0110,
				verify=4'b0111,
				data_output=4'b1000;
	reg packet_good;
	
	always@(posedge clk )begin
		if (reset) begin 
			state<=start;
			end 
		else state<=next_state;
	end
	
	always@(*)
	begin
	case (state) 
		start : begin 
					ps2_clk_hiz<=1;	ps2_data_hiz<=1;	load<=0;		data_ready<=0;
					bit_reset<=0;	error_no_ack<=0;
					next_state<=hold_clk_l;
					//state<=next_state;
				end
		hold_clk_l: begin 
					ps2_clk_hiz<=0;	ps2_data_hiz<=1; 	load<=1;		data_ready<=0;
					bit_reset<=0;		error_no_ack<=0;
					if (timer_150us_done)
							next_state<=transmit;
					else 
							next_state<=hold_clk_l;
					//state<=next_state;
					end
		transmit :begin 
					ps2_clk_hiz<=1;	load<=0;		data_ready<=0;
					bit_reset<=0;		error_no_ack<=0;
					if (q[0]) ps2_data_hiz<=1;
					else ps2_data_hiz<=0;
					if (bit_counter==6'd11)begin
						if (ps2_data)
							next_state<=error_ack;
						else 
							next_state<=wait_response;
						end
					else 
							next_state<=transmit;
					//state<=next_state;
					end
		error_ack: begin 
					ps2_clk_hiz<=1;	ps2_data_hiz<=1; 	load<=0;		data_ready<=0;
					bit_reset<=0;		error_no_ack<=1;
					next_state<=error_ack;
					//state<=next_state;
					end			
		wait_response: begin 
					ps2_clk_hiz<=1;	ps2_data_hiz<=1; 	load<=0;		data_ready<=0;
					bit_reset<=0;		error_no_ack<=0;
					if (bit_counter==6'd23)begin
						if (q[30:23]==8'hfa)
							next_state<=receive_start;
						else 
							next_state<=error_ack;
						end
					else 
							next_state<=wait_response;
					//state<=next_state;
					end
		receive_start:begin 
					ps2_clk_hiz<=1;	ps2_data_hiz<=1; 	load<=0;		data_ready<=0;
					bit_reset<=1;		error_no_ack<=0;
					next_state<=gather;
					//state<=next_state;
					end
		gather:begin 
					ps2_clk_hiz<=1;	ps2_data_hiz<=1; 	load<=0;		data_ready<=0;
					bit_reset<=0;		error_no_ack<=0;
					if (timer_400us_done)
							next_state<=receive_start;
					else begin
						if (bit_counter==6'd33)
							next_state<=verify;
						else 
							next_state<=gather;
							end
					//state<=next_state;
					end
		verify: begin 
					ps2_clk_hiz<=1;	ps2_data_hiz<=1; 	load<=0;		data_ready<=0;
					bit_reset<=0;		error_no_ack<=0;
					packet_good<=((q[9]==~^q[8:1])&&(q[20]==~^q[19:12])&&(q[31]==~^q[30:23]));
					if (packet_good)
							next_state<=data_output;
					else 
							next_state<=receive_start;
					//state<=next_state;
					end
//		data_output:
		default:begin 
					ps2_clk_hiz<=1;	ps2_data_hiz<=1; 	load<=0;		data_ready<=1;
					bit_reset<=0;		error_no_ack<=0;
					next_state<=receive_start;
					//state<=next_state;
					end
	//	default:;
	endcase
	end
	endmodule
	