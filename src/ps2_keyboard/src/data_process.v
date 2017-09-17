`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
// Create Date:    10:28:00 07/14/2017 
// Module Name:    data_progress 

//////////////////////////////////////////////////////////////////////////////////
module data_process(
  sys_clk,
  reset,
  scan_code,
  scan_code_ready,
  read,             // rx_read_ack_i
  extended,
  released,
  shift_key_on,
  scan_code_out,
  ascii_out,
  data_ready );
// Parameters
	parameter shift_key_clr = 0;
	parameter sign_clr = 1;
	parameter wait_data = 2;
	parameter extend_code_set = 3;
	parameter released_code_set = 4;
	parameter shift_key_set = 5;
	parameter data_output = 6;
	parameter EXTEND_CODE=8'hE0;
	parameter RELEASE_CODE=8'hF0;
	parameter LEFT_SHIFT=8'h12;
	parameter RIGHT_SHIFT=8'h59;
// I/O declarations
	input sys_clk;
	input reset;
	input [7:0] scan_code;
	input  scan_code_ready;
	input  read;             // rx_read_ack_i
	output extended;
	output released;
	output shift_key_on;
	output [7:0] scan_code_out;
	output [7:0] ascii_out;
	output data_ready;
	reg extended;
	reg released;
	reg [7:0] scan_code_out;
	reg [7:0] ascii_out;
	reg  data_ready;
	reg shift_key_on;
// Internal signal declarationsreg;
	reg[7:0]  ascii ;
	wire[11:0] shift_key_plus_code;
	reg [2:0] state;

// State register
	always @(posedge sys_clk)
	 begin 
	 if (reset)
	    begin state <= shift_key_clr; shift_key_on<=0; end
	 else 
	  case (state)
		shift_key_clr:
			begin
				extended<=0;
				released<=0;
				data_ready<=0;
				state <= sign_clr;
			end
		sign_clr :state <= wait_data; 
		wait_data :
		 if(scan_code_ready==1 ) 
			if (scan_code==EXTEND_CODE) 
				 begin state <= extend_code_set;extended<=1; end
			else if (scan_code==RELEASE_CODE)
						begin state <= released_code_set;released<=1 ;end
					else if (scan_code==RIGHT_SHIFT  || scan_code==LEFT_SHIFT)
							 begin 
								if (released)
								  begin state <= shift_key_clr; shift_key_on<=0; end
								else
								  begin state <= shift_key_set; shift_key_on<=1;  end  
							 end  
						  else 
								begin
									 state <= data_output ;
									 data_ready<=1;
									 scan_code_out<=scan_code;
									 ascii_out<=ascii; 
								end
	   extend_code_set, released_code_set,shift_key_set:   state <= wait_data; 
	   data_output:
		  if (read) 
			 begin 
			  extended<=0;
			  released<=0;
			  data_ready<=0;
			  state <= sign_clr;
			 end
	   default :
		   begin 
			 shift_key_on<=0;
			  state <= shift_key_clr;
			end
	  endcase
	end

//
	assign shift_key_plus_code = {3'b0,shift_key_on,scan_code};
	always @(shift_key_plus_code)
	begin
	  casez (shift_key_plus_code)
		 12'h?66 : ascii <= 8'h08;  // Backspace ("backspace" key)
		 12'h?0d : ascii <= 8'h09;  // Horizontal Tab
		 12'h?5a : ascii <= 8'h0d;  // Carriage return ("enter" key)
		 12'h?76 : ascii <= 8'h1b;  // Escape ("esc" key)
		 12'h?29 : ascii <= 8'h20;  // Space
		 12'h116 : ascii <= 8'h21;  // !
		 12'h152 : ascii <= 8'h22;  // "
		 12'h126 : ascii <= 8'h23;  // #
		 12'h125 : ascii <= 8'h24;  // $
		 12'h12e : ascii <= 8'h25;  // %
		 12'h13d : ascii <= 8'h26;  // &
		 12'h052 : ascii <= 8'h27;  // '
		 12'h146 : ascii <= 8'h28;  // (
		 12'h145 : ascii <= 8'h29;  // )
		 12'h13e : ascii <= 8'h2a;  // *
		 12'h155 : ascii <= 8'h2b;  // +
		 12'h041 : ascii <= 8'h2c;  // ,
		 12'h04e : ascii <= 8'h2d;  // -
		 12'h049 : ascii <= 8'h2e;  // .
		 12'h04a : ascii <= 8'h2f;  // /
		 12'h045 : ascii <= 8'h30;  // 0
		 12'h016 : ascii <= 8'h31;  // 1
		 12'h01e : ascii <= 8'h32;  // 2
		 12'h026 : ascii <= 8'h33;  // 3
		 12'h025 : ascii <= 8'h34;  // 4
		 12'h02e : ascii <= 8'h35;  // 5
		 12'h036 : ascii <= 8'h36;  // 6
		 12'h03d : ascii <= 8'h37;  // 7
		 12'h03e : ascii <= 8'h38;  // 8
		 12'h046 : ascii <= 8'h39;  // 9
		 12'h14c : ascii <= 8'h3a;  // :
		 12'h04c : ascii <= 8'h3b;  // ;
		 12'h141 : ascii <= 8'h3c;  // <
		 12'h055 : ascii <= 8'h3d;  // =
		 12'h149 : ascii <= 8'h3e;  // >
		 12'h14a : ascii <= 8'h3f;  // ?
		 12'h11e : ascii <= 8'h40;  // @
		 12'h11c : ascii <= 8'h41;  // A
		 12'h132 : ascii <= 8'h42;  // B
		 12'h121 : ascii <= 8'h43;  // C
		 12'h123 : ascii <= 8'h44;  // D
		 12'h124 : ascii <= 8'h45;  // E
		 12'h12b : ascii <= 8'h46;  // F
		 12'h134 : ascii <= 8'h47;  // G
		 12'h133 : ascii <= 8'h48;  // H
		 12'h143 : ascii <= 8'h49;  // I
		 12'h13b : ascii <= 8'h4a;  // J
		 12'h142 : ascii <= 8'h4b;  // K
		 12'h14b : ascii <= 8'h4c;  // L
		 12'h13a : ascii <= 8'h4d;  // M
		 12'h131 : ascii <= 8'h4e;  // N
		 12'h144 : ascii <= 8'h4f;  // O
		 12'h14d : ascii <= 8'h50;  // P
		 12'h115 : ascii <= 8'h51;  // Q
		 12'h12d : ascii <= 8'h52;  // R
		 12'h11b : ascii <= 8'h53;  // S
		 12'h12c : ascii <= 8'h54;  // T
		 12'h13c : ascii <= 8'h55;  // U
		 12'h12a : ascii <= 8'h56;  // V
		 12'h11d : ascii <= 8'h57;  // W
		 12'h122 : ascii <= 8'h58;  // X
		 12'h135 : ascii <= 8'h59;  // Y
		 12'h11a : ascii <= 8'h5a;  // Z
		 12'h054 : ascii <= 8'h5b;  // [
		 12'h05d : ascii <= 8'h5c;  // \
		 12'h05b : ascii <= 8'h5d;  // ]
		 12'h136 : ascii <= 8'h5e;  // ^
		 12'h14e : ascii <= 8'h5f;  // _    
		 12'h00e : ascii <= 8'h60;  // `
		 12'h01c : ascii <= 8'h61;  // a
		 12'h032 : ascii <= 8'h62;  // b
		 12'h021 : ascii <= 8'h63;  // c
		 12'h023 : ascii <= 8'h64;  // d
		 12'h024 : ascii <= 8'h65;  // e
		 12'h02b : ascii <= 8'h66;  // f
		 12'h034 : ascii <= 8'h67;  // g
		 12'h033 : ascii <= 8'h68;  // h
		 12'h043 : ascii <= 8'h69;  // i
		 12'h03b : ascii <= 8'h6a;  // j
		 12'h042 : ascii <= 8'h6b;  // k
		 12'h04b : ascii <= 8'h6c;  // l
		 12'h03a : ascii <= 8'h6d;  // m
		 12'h031 : ascii <= 8'h6e;  // n
		 12'h044 : ascii <= 8'h6f;  // o
		 12'h04d : ascii <= 8'h70;  // p
		 12'h015 : ascii <= 8'h71;  // q
		 12'h02d : ascii <= 8'h72;  // r
		 12'h01b : ascii <= 8'h73;  // s
		 12'h02c : ascii <= 8'h74;  // t
		 12'h03c : ascii <= 8'h75;  // u
		 12'h02a : ascii <= 8'h76;  // v
		 12'h01d : ascii <= 8'h77;  // w
		 12'h022 : ascii <= 8'h78;  // x
		 12'h035 : ascii <= 8'h79;  // y
		 12'h01a : ascii <= 8'h7a;  // z
		 12'h154 : ascii <= 8'h7b;  // {
		 12'h15d : ascii <= 8'h7c;  // |
		 12'h15b : ascii <= 8'h7d;  // }
		 12'h10e : ascii <= 8'h7e;  // ~
		 12'h?71 : ascii <= 8'h7f;  // (Delete OR DEL on numeric keypad)
		 default : ascii <= 8'hff;  // no ascii value for unlisted characters.
	  endcase
	end
endmodule


