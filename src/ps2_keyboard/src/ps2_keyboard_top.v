`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Create Date:    10:02:07 07/14/2017 
// Module Name:    ps2_keyboard_top 

//////////////////////////////////////////////////////////////////////////////////
module ps2_keyboard_top(clk, reset_n, ps2_clk, ps2_data, 
	a_left, w_up, s_down, d_right ,esc_retry, enter_next, backspace_retract,m_switch);
    input clk;
    input reset_n;
    input ps2_clk;
    input ps2_data;
    output a_left;
    output w_up;
    output s_down;
    output d_right;
    output m_switch;
	 output esc_retry;
	 output enter_next;
	 output backspace_retract;
  
// =======================================================================
// INTERNAL SIGNALS DECLEARATION
// =======================================================================
	 wire       sys_clk;
	 wire       read;
	 wire       scan_code_ready;
	 wire       data_ready;
	 wire[7:0]  scan_code;
	 wire[7:0]  ascii;
	 wire       a_left,w_up,s_down,d_right,esc_retry,backspace_retract,enter_next,m_switch;
	 wire reset;
	 assign reset=~reset_n;
// ========================= dcm module =================================
	ps2_dcm ps2_dcm_inst (
		 .CLKIN_IN			(clk  		),
		 .CLKDV_OUT			(sys_clk		),
		 .CLKIN_IBUFG_OUT	(				),
		 .CLK0_OUT			(				),
		 .LOCKED_OUT		(				));
// ========================= ps2 interface =================================

	interface  ps2_interface_inst(
	  .sys_clk(sys_clk),//50mhz
	  .reset(reset),
	  .ps2_clk(ps2_clk),
	  .ps2_data(ps2_data),
	  .scan_code_ready(scan_code_ready),       // rx_read_o
	  .scan_code(scan_code),
	  .parity_error() );

// ========================= keyboard data process interface =================================
	data_process    data_process_inst (
		.sys_clk(sys_clk),
		.reset(reset),
		.scan_code(scan_code),
		.scan_code_ready(scan_code_ready),
		.read(read),             // rx_read_ack_i
		.extended(),
		.released(released),
		.shift_key_on(),
		.scan_code_out(),
		.ascii_out(ascii),
		.data_ready(data_ready) );
// ========================= led_instruction interface =================================
	direct_instruction   direct_inst(
		 .clk(sys_clk),
		 .reset(reset),
		 .released(released),
		 .ascii(ascii),
		 .data_ready(data_ready),
		 .read(read),
		 .a_left(a_left),
		 .w_up(w_up),
		 .s_down(s_down),
		 .d_right(d_right),
		 .esc_retry(esc_retry),
		 .backspace_retract(backspace_retract),
		 .enter_next(enter_next),
		 .m_switch(m_switch))	 ;
endmodule
