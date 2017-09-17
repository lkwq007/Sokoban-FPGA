////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: J.36
//  \   \         Application: netgen
//  /   /         Filename: ps2_mouse_interface_synthesis.v
// /___/   /\     Timestamp: Wed Jul 05 14:26:38 2017
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim ps2_mouse_interface.ngc ps2_mouse_interface_synthesis.v 
// Device	: xc2vp30-7-ff896
// Input file	: ps2_mouse_interface.ngc
// Output file	: F:\PS2_mouse\netgen\synthesis\ps2_mouse_interface_synthesis.v
// # of Modules	: 1
// Design Name	: ps2_mouse_interface
// Xilinx        : C:\Xilinx92i
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Development System Reference Guide, Chapter 23
//     Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module ps2_mouse_interface (
  clk, ps2_clk, ps2_data, reset, data_ready, right_button, left_button, error_no_ack, x_increment, y_increment
);
  input clk;
  input ps2_clk;
  input ps2_data;
  input reset;
  output data_ready;
  output right_button;
  output left_button;
  output error_no_ack;
  output [8 : 0] x_increment;
  output [8 : 0] y_increment;
  wire clk_BUFGP_0;
  wire ps2_clk_IBUF_1;
  wire ps2_data_IBUF_2;
  wire reset_IBUF_3;
  wire \controller/data_ready_4 ;
  wire \controller/error_no_ack_5 ;
  wire din;
  wire \controller/bit_reset_6 ;
  wire \controller/load_7 ;
  wire \controller/ps2_clk_hiz_8 ;
  wire \fallingtest/falling_edge_9 ;
  wire \watchdog/timer_150us_done_10 ;
  wire \controller/ps2_data_hiz_11 ;
  wire N2;
  wire \fallingtest/next_state_2__and0001 ;
  wire \fallingtest/next_state_2__and0000 ;
  wire \fallingtest/next_state_1__and0001 ;
  wire \fallingtest/next_state_1__and0000 ;
  wire \fallingtest/next_state_0__and0001 ;
  wire \fallingtest/next_state_0__and0000 ;
  wire \fallingtest/state_2__and0001 ;
  wire \fallingtest/state_2__and0000 ;
  wire \fallingtest/state_1__and0001 ;
  wire \fallingtest/state_1__and0000 ;
  wire \fallingtest/state_0__and0001 ;
  wire \fallingtest/state_0__and0000 ;
  wire \fallingtest/falling_edge_cmp_eq0002 ;
  wire \fallingtest/falling_edge_cmp_eq0001 ;
  wire \fallingtest/falling_edge_cmp_eq0000 ;
  wire \fallingtest/next_state_0__and0000_bdd3 ;
  wire N1;
  wire \watchdog/N111 ;
  wire \watchdog/N11 ;
  wire \watchdog/N51 ;
  wire \watchdog/N4 ;
  wire \watchdog/reset_inv ;
  wire \watchdog/q_cmp_eq0000 ;
  wire \watchdog/q_not0001 ;
  wire \shiftreg/reset1 ;
  wire \shiftreg/load1_12 ;
  wire \controller/N18 ;
  wire \controller/N17 ;
  wire \controller/N16 ;
  wire \controller/N14 ;
  wire \controller/N13 ;
  wire \controller/N12 ;
  wire \controller/N5 ;
  wire \controller/N4 ;
  wire \controller/next_state_8__and0001 ;
  wire \controller/next_state_8__and0000 ;
  wire \controller/next_state_7__and0001 ;
  wire \controller/next_state_7__and0000 ;
  wire \controller/next_state_6__and0001 ;
  wire \controller/next_state_6__and0000 ;
  wire \controller/next_state_5__and0001 ;
  wire \controller/next_state_5__and0000 ;
  wire \controller/next_state_4__and0001 ;
  wire \controller/next_state_4__and0000 ;
  wire \controller/next_state_3__and0001 ;
  wire \controller/next_state_3__and0000 ;
  wire \controller/next_state_2__and0001 ;
  wire \controller/next_state_2__and0000 ;
  wire \controller/next_state_1__and0001 ;
  wire \controller/next_state_1__and0000 ;
  wire \controller/ps2_data_hiz__and0000 ;
  wire \controller/ps2_data_hiz__or0000 ;
  wire \controller/load_cmp_eq0000 ;
  wire \controller/bit_reset_or0000_13 ;
  wire \controller/bit_reset_cmp_eq0000_14 ;
  wire \controller/next_state_cmp_eq0000 ;
  wire \controller/packet_good_and0000_15 ;
  wire \controller/error_no_ack_cmp_eq0000 ;
  wire \controller/load_or0000_16 ;
  wire \controller/mux0001_cmp_eq0009 ;
  wire \controller/mux0001_cmp_eq0007 ;
  wire \controller/mux0001_cmp_eq0006_17 ;
  wire \controller/mux0001_cmp_eq0005 ;
  wire \controller/mux0001_cmp_eq0010 ;
  wire \controller/mux0001_cmp_eq0003 ;
  wire \controller/ps2_data_hiz_or0000_18 ;
  wire \controller/mux0001_cmp_eq0002 ;
  wire \controller/mux0001_cmp_eq0000 ;
  wire \controller/packet_good_19 ;
  wire \controller/ps2_clk_hiz_cmp_eq0000_20 ;
  wire \controller/ps2_data_hiz_mux0000 ;
  wire \controller/data_ready_or0000 ;
  wire \controller/error_no_ack_or0000_21 ;
  wire N60;
  wire N62;
  wire N64;
  wire N66;
  wire N68;
  wire N70;
  wire N72;
  wire N74;
  wire \controller/mux0001_cmp_eq0007_map4 ;
  wire \controller/mux0001_cmp_eq0007_map7 ;
  wire \controller/data_ready_or0000_map2 ;
  wire \controller/data_ready_or0000_map5 ;
  wire \watchdog/q_cmp_eq0000_map4 ;
  wire \watchdog/q_cmp_eq0000_map9 ;
  wire \watchdog/q_cmp_eq0000_map15 ;
  wire \watchdog/q_cmp_eq0000_map21 ;
  wire N193;
  wire \controller/next_state_mux0000<5>_map0 ;
  wire \controller/next_state_mux0000<5>_map8 ;
  wire \controller/next_state_mux0000<5>_map10 ;
  wire N231;
  wire \bit_counter_p/_old_q_6<1>1_map1 ;
  wire \bit_counter_p/_old_q_6<1>1_map5 ;
  wire N259;
  wire N260;
  wire N271;
  wire N273;
  wire N275;
  wire \watchdog/Madd__old_q_3_cy<14>_rt_22 ;
  wire \watchdog/Madd__old_q_3_cy<13>_rt_23 ;
  wire \watchdog/Madd__old_q_3_cy<12>_rt_24 ;
  wire \watchdog/Madd__old_q_3_cy<11>_rt_25 ;
  wire \watchdog/Madd__old_q_3_cy<10>_rt_26 ;
  wire \watchdog/Madd__old_q_3_cy<9>_rt_27 ;
  wire \watchdog/Madd__old_q_3_cy<8>_rt_28 ;
  wire \watchdog/Madd__old_q_3_cy<7>_rt_29 ;
  wire \watchdog/Madd__old_q_3_cy<6>_rt_30 ;
  wire \watchdog/Madd__old_q_3_cy<5>_rt_31 ;
  wire \watchdog/Madd__old_q_3_cy<4>_rt_32 ;
  wire \watchdog/Madd__old_q_3_cy<3>_rt_33 ;
  wire \watchdog/Madd__old_q_3_cy<2>_rt_34 ;
  wire \watchdog/Madd__old_q_3_cy<1>_rt_35 ;
  wire \watchdog/Madd__old_q_3_xor<15>_rt_36 ;
  wire N284;
  wire N288;
  wire N302;
  wire N304;
  wire N312;
  wire N314;
  wire N315;
  wire reset_IBUF1;
  wire N316;
  wire N317;
  wire N319;
  wire N320;
  wire N321;
  wire N322;
  wire N323;
  wire N324;
  wire N325;
  wire [31 : 0] \shiftreg/q ;
  wire [6 : 0] bit_counter;
  wire [2 : 0] \fallingtest/state ;
  wire [0 : 0] \fallingtest/state_mux0000 ;
  wire [2 : 0] \fallingtest/next_state ;
  wire [0 : 0] \fallingtest/next_state_mux0000 ;
  wire [5 : 0] \bit_counter_p/q ;
  wire [3 : 3] \bit_counter_p/Madd_old_q_6_addsub0000_cy ;
  wire [14 : 0] \watchdog/Madd__old_q_3_cy ;
  wire [15 : 0] \watchdog/q ;
  wire [15 : 0] \watchdog/_old_q_4 ;
  wire [15 : 1] \watchdog/_old_q_3 ;
  wire [5 : 4] \controller/Mxor_packet_good_xor0004_xo ;
  wire [5 : 4] \controller/Mxor_packet_good_xor0000_xo ;
  wire [5 : 4] \controller/Mxor_packet_good_xor0002_xo ;
  wire [8 : 0] \controller/state ;
  wire [8 : 1] \controller/next_state ;
  wire [8 : 2] \controller/next_state_mux0000 ;
  GND XST_GND (
    .G(bit_counter[6])
  );
  VCC XST_VCC (
    .P(N2)
  );
  defparam \bit_counter_p/q_5 .INIT = 1'b0;
  FD \bit_counter_p/q_5  (
    .C(clk_BUFGP_0),
    .D(bit_counter[5]),
    .Q(\bit_counter_p/q [5])
  );
  defparam \bit_counter_p/q_4 .INIT = 1'b0;
  FD \bit_counter_p/q_4  (
    .C(clk_BUFGP_0),
    .D(bit_counter[4]),
    .Q(\bit_counter_p/q [4])
  );
  defparam \bit_counter_p/q_3 .INIT = 1'b0;
  FD \bit_counter_p/q_3  (
    .C(clk_BUFGP_0),
    .D(bit_counter[3]),
    .Q(\bit_counter_p/q [3])
  );
  defparam \bit_counter_p/q_2 .INIT = 1'b0;
  FD \bit_counter_p/q_2  (
    .C(clk_BUFGP_0),
    .D(bit_counter[2]),
    .Q(\bit_counter_p/q [2])
  );
  defparam \bit_counter_p/q_1 .INIT = 1'b0;
  FD \bit_counter_p/q_1  (
    .C(clk_BUFGP_0),
    .D(bit_counter[1]),
    .Q(\bit_counter_p/q [1])
  );
  defparam \bit_counter_p/q_0 .INIT = 1'b0;
  FD \bit_counter_p/q_0  (
    .C(clk_BUFGP_0),
    .D(bit_counter[0]),
    .Q(\bit_counter_p/q [0])
  );
  LDCP \fallingtest/next_state_2  (
    .CLR(\fallingtest/next_state_2__and0000 ),
    .D(\fallingtest/next_state_2__and0001 ),
    .G(reset_IBUF_3),
    .PRE(\fallingtest/next_state_2__and0001 ),
    .Q(\fallingtest/next_state [2])
  );
  LDCP \fallingtest/next_state_1  (
    .CLR(\fallingtest/next_state_1__and0000 ),
    .D(\fallingtest/next_state_1__and0001 ),
    .G(reset_IBUF_3),
    .PRE(\fallingtest/next_state_1__and0001 ),
    .Q(\fallingtest/next_state [1])
  );
  LDCP \fallingtest/next_state_0  (
    .CLR(\fallingtest/next_state_0__and0000 ),
    .D(\fallingtest/next_state_mux0000 [0]),
    .G(reset_IBUF_3),
    .PRE(\fallingtest/next_state_0__and0001 ),
    .Q(\fallingtest/next_state [0])
  );
  LDCP \fallingtest/state_2  (
    .CLR(\fallingtest/state_2__and0000 ),
    .D(\fallingtest/state_2__and0001 ),
    .G(reset_IBUF_3),
    .PRE(\fallingtest/state_2__and0001 ),
    .Q(\fallingtest/state [2])
  );
  LDCP \fallingtest/state_1  (
    .CLR(\fallingtest/state_1__and0000 ),
    .D(\fallingtest/state_1__and0001 ),
    .G(reset_IBUF_3),
    .PRE(\fallingtest/state_1__and0001 ),
    .Q(\fallingtest/state [1])
  );
  LDCP \fallingtest/state_0  (
    .CLR(\fallingtest/state_0__and0000 ),
    .D(\fallingtest/state_mux0000 [0]),
    .G(reset_IBUF_3),
    .PRE(\fallingtest/state_0__and0001 ),
    .Q(\fallingtest/state [0])
  );
  LDCP \fallingtest/falling_edge  (
    .CLR(\fallingtest/falling_edge_cmp_eq0001 ),
    .D(bit_counter[6]),
    .G(\fallingtest/falling_edge_cmp_eq0000 ),
    .PRE(\fallingtest/falling_edge_cmp_eq0002 ),
    .Q(\fallingtest/falling_edge_9 )
  );
  XORCY \watchdog/Madd__old_q_3_xor<15>  (
    .CI(\watchdog/Madd__old_q_3_cy [14]),
    .LI(\watchdog/Madd__old_q_3_xor<15>_rt_36 ),
    .O(\watchdog/_old_q_3 [15])
  );
  XORCY \watchdog/Madd__old_q_3_xor<14>  (
    .CI(\watchdog/Madd__old_q_3_cy [13]),
    .LI(\watchdog/Madd__old_q_3_cy<14>_rt_22 ),
    .O(\watchdog/_old_q_3 [14])
  );
  MUXCY \watchdog/Madd__old_q_3_cy<14>  (
    .CI(\watchdog/Madd__old_q_3_cy [13]),
    .DI(bit_counter[6]),
    .S(\watchdog/Madd__old_q_3_cy<14>_rt_22 ),
    .O(\watchdog/Madd__old_q_3_cy [14])
  );
  XORCY \watchdog/Madd__old_q_3_xor<13>  (
    .CI(\watchdog/Madd__old_q_3_cy [12]),
    .LI(\watchdog/Madd__old_q_3_cy<13>_rt_23 ),
    .O(\watchdog/_old_q_3 [13])
  );
  MUXCY \watchdog/Madd__old_q_3_cy<13>  (
    .CI(\watchdog/Madd__old_q_3_cy [12]),
    .DI(bit_counter[6]),
    .S(\watchdog/Madd__old_q_3_cy<13>_rt_23 ),
    .O(\watchdog/Madd__old_q_3_cy [13])
  );
  XORCY \watchdog/Madd__old_q_3_xor<12>  (
    .CI(\watchdog/Madd__old_q_3_cy [11]),
    .LI(\watchdog/Madd__old_q_3_cy<12>_rt_24 ),
    .O(\watchdog/_old_q_3 [12])
  );
  MUXCY \watchdog/Madd__old_q_3_cy<12>  (
    .CI(\watchdog/Madd__old_q_3_cy [11]),
    .DI(bit_counter[6]),
    .S(\watchdog/Madd__old_q_3_cy<12>_rt_24 ),
    .O(\watchdog/Madd__old_q_3_cy [12])
  );
  XORCY \watchdog/Madd__old_q_3_xor<11>  (
    .CI(\watchdog/Madd__old_q_3_cy [10]),
    .LI(\watchdog/Madd__old_q_3_cy<11>_rt_25 ),
    .O(\watchdog/_old_q_3 [11])
  );
  MUXCY \watchdog/Madd__old_q_3_cy<11>  (
    .CI(\watchdog/Madd__old_q_3_cy [10]),
    .DI(bit_counter[6]),
    .S(\watchdog/Madd__old_q_3_cy<11>_rt_25 ),
    .O(\watchdog/Madd__old_q_3_cy [11])
  );
  XORCY \watchdog/Madd__old_q_3_xor<10>  (
    .CI(\watchdog/Madd__old_q_3_cy [9]),
    .LI(\watchdog/Madd__old_q_3_cy<10>_rt_26 ),
    .O(\watchdog/_old_q_3 [10])
  );
  MUXCY \watchdog/Madd__old_q_3_cy<10>  (
    .CI(\watchdog/Madd__old_q_3_cy [9]),
    .DI(bit_counter[6]),
    .S(\watchdog/Madd__old_q_3_cy<10>_rt_26 ),
    .O(\watchdog/Madd__old_q_3_cy [10])
  );
  XORCY \watchdog/Madd__old_q_3_xor<9>  (
    .CI(\watchdog/Madd__old_q_3_cy [8]),
    .LI(\watchdog/Madd__old_q_3_cy<9>_rt_27 ),
    .O(\watchdog/_old_q_3 [9])
  );
  MUXCY \watchdog/Madd__old_q_3_cy<9>  (
    .CI(\watchdog/Madd__old_q_3_cy [8]),
    .DI(bit_counter[6]),
    .S(\watchdog/Madd__old_q_3_cy<9>_rt_27 ),
    .O(\watchdog/Madd__old_q_3_cy [9])
  );
  XORCY \watchdog/Madd__old_q_3_xor<8>  (
    .CI(\watchdog/Madd__old_q_3_cy [7]),
    .LI(\watchdog/Madd__old_q_3_cy<8>_rt_28 ),
    .O(\watchdog/_old_q_3 [8])
  );
  MUXCY \watchdog/Madd__old_q_3_cy<8>  (
    .CI(\watchdog/Madd__old_q_3_cy [7]),
    .DI(bit_counter[6]),
    .S(\watchdog/Madd__old_q_3_cy<8>_rt_28 ),
    .O(\watchdog/Madd__old_q_3_cy [8])
  );
  XORCY \watchdog/Madd__old_q_3_xor<7>  (
    .CI(\watchdog/Madd__old_q_3_cy [6]),
    .LI(\watchdog/Madd__old_q_3_cy<7>_rt_29 ),
    .O(\watchdog/_old_q_3 [7])
  );
  MUXCY \watchdog/Madd__old_q_3_cy<7>  (
    .CI(\watchdog/Madd__old_q_3_cy [6]),
    .DI(bit_counter[6]),
    .S(\watchdog/Madd__old_q_3_cy<7>_rt_29 ),
    .O(\watchdog/Madd__old_q_3_cy [7])
  );
  XORCY \watchdog/Madd__old_q_3_xor<6>  (
    .CI(\watchdog/Madd__old_q_3_cy [5]),
    .LI(\watchdog/Madd__old_q_3_cy<6>_rt_30 ),
    .O(\watchdog/_old_q_3 [6])
  );
  MUXCY \watchdog/Madd__old_q_3_cy<6>  (
    .CI(\watchdog/Madd__old_q_3_cy [5]),
    .DI(bit_counter[6]),
    .S(\watchdog/Madd__old_q_3_cy<6>_rt_30 ),
    .O(\watchdog/Madd__old_q_3_cy [6])
  );
  XORCY \watchdog/Madd__old_q_3_xor<5>  (
    .CI(\watchdog/Madd__old_q_3_cy [4]),
    .LI(\watchdog/Madd__old_q_3_cy<5>_rt_31 ),
    .O(\watchdog/_old_q_3 [5])
  );
  MUXCY \watchdog/Madd__old_q_3_cy<5>  (
    .CI(\watchdog/Madd__old_q_3_cy [4]),
    .DI(bit_counter[6]),
    .S(\watchdog/Madd__old_q_3_cy<5>_rt_31 ),
    .O(\watchdog/Madd__old_q_3_cy [5])
  );
  XORCY \watchdog/Madd__old_q_3_xor<4>  (
    .CI(\watchdog/Madd__old_q_3_cy [3]),
    .LI(\watchdog/Madd__old_q_3_cy<4>_rt_32 ),
    .O(\watchdog/_old_q_3 [4])
  );
  MUXCY \watchdog/Madd__old_q_3_cy<4>  (
    .CI(\watchdog/Madd__old_q_3_cy [3]),
    .DI(bit_counter[6]),
    .S(\watchdog/Madd__old_q_3_cy<4>_rt_32 ),
    .O(\watchdog/Madd__old_q_3_cy [4])
  );
  XORCY \watchdog/Madd__old_q_3_xor<3>  (
    .CI(\watchdog/Madd__old_q_3_cy [2]),
    .LI(\watchdog/Madd__old_q_3_cy<3>_rt_33 ),
    .O(\watchdog/_old_q_3 [3])
  );
  MUXCY \watchdog/Madd__old_q_3_cy<3>  (
    .CI(\watchdog/Madd__old_q_3_cy [2]),
    .DI(bit_counter[6]),
    .S(\watchdog/Madd__old_q_3_cy<3>_rt_33 ),
    .O(\watchdog/Madd__old_q_3_cy [3])
  );
  XORCY \watchdog/Madd__old_q_3_xor<2>  (
    .CI(\watchdog/Madd__old_q_3_cy [1]),
    .LI(\watchdog/Madd__old_q_3_cy<2>_rt_34 ),
    .O(\watchdog/_old_q_3 [2])
  );
  MUXCY \watchdog/Madd__old_q_3_cy<2>  (
    .CI(\watchdog/Madd__old_q_3_cy [1]),
    .DI(bit_counter[6]),
    .S(\watchdog/Madd__old_q_3_cy<2>_rt_34 ),
    .O(\watchdog/Madd__old_q_3_cy [2])
  );
  XORCY \watchdog/Madd__old_q_3_xor<1>  (
    .CI(\watchdog/Madd__old_q_3_cy [0]),
    .LI(\watchdog/Madd__old_q_3_cy<1>_rt_35 ),
    .O(\watchdog/_old_q_3 [1])
  );
  MUXCY \watchdog/Madd__old_q_3_cy<1>  (
    .CI(\watchdog/Madd__old_q_3_cy [0]),
    .DI(bit_counter[6]),
    .S(\watchdog/Madd__old_q_3_cy<1>_rt_35 ),
    .O(\watchdog/Madd__old_q_3_cy [1])
  );
  MUXCY \watchdog/Madd__old_q_3_cy<0>  (
    .CI(bit_counter[6]),
    .DI(N2),
    .S(\watchdog/N4 ),
    .O(\watchdog/Madd__old_q_3_cy [0])
  );
  defparam \watchdog/timer_150us_done .INIT = 1'b0;
  FDE \watchdog/timer_150us_done  (
    .C(clk_BUFGP_0),
    .CE(\watchdog/reset_inv ),
    .D(\watchdog/q_cmp_eq0000 ),
    .Q(\watchdog/timer_150us_done_10 )
  );
  defparam \watchdog/q_15 .INIT = 1'b0;
  FDRE \watchdog/q_15  (
    .C(clk_BUFGP_0),
    .CE(\watchdog/q_not0001 ),
    .D(\watchdog/_old_q_4 [15]),
    .R(reset_IBUF1),
    .Q(\watchdog/q [15])
  );
  defparam \watchdog/q_14 .INIT = 1'b0;
  FDRE \watchdog/q_14  (
    .C(clk_BUFGP_0),
    .CE(\watchdog/q_not0001 ),
    .D(\watchdog/_old_q_4 [14]),
    .R(reset_IBUF1),
    .Q(\watchdog/q [14])
  );
  defparam \watchdog/q_13 .INIT = 1'b0;
  FDRE \watchdog/q_13  (
    .C(clk_BUFGP_0),
    .CE(\watchdog/q_not0001 ),
    .D(\watchdog/_old_q_4 [13]),
    .R(reset_IBUF1),
    .Q(\watchdog/q [13])
  );
  defparam \watchdog/q_12 .INIT = 1'b0;
  FDRE \watchdog/q_12  (
    .C(clk_BUFGP_0),
    .CE(\watchdog/q_not0001 ),
    .D(\watchdog/_old_q_4 [12]),
    .R(reset_IBUF1),
    .Q(\watchdog/q [12])
  );
  defparam \watchdog/q_11 .INIT = 1'b0;
  FDRE \watchdog/q_11  (
    .C(clk_BUFGP_0),
    .CE(\watchdog/q_not0001 ),
    .D(\watchdog/_old_q_4 [11]),
    .R(reset_IBUF1),
    .Q(\watchdog/q [11])
  );
  defparam \watchdog/q_10 .INIT = 1'b0;
  FDRE \watchdog/q_10  (
    .C(clk_BUFGP_0),
    .CE(\watchdog/q_not0001 ),
    .D(\watchdog/_old_q_4 [10]),
    .R(reset_IBUF1),
    .Q(\watchdog/q [10])
  );
  defparam \watchdog/q_9 .INIT = 1'b0;
  FDRE \watchdog/q_9  (
    .C(clk_BUFGP_0),
    .CE(\watchdog/q_not0001 ),
    .D(\watchdog/_old_q_4 [9]),
    .R(reset_IBUF1),
    .Q(\watchdog/q [9])
  );
  defparam \watchdog/q_8 .INIT = 1'b0;
  FDRE \watchdog/q_8  (
    .C(clk_BUFGP_0),
    .CE(\watchdog/q_not0001 ),
    .D(\watchdog/_old_q_4 [8]),
    .R(reset_IBUF1),
    .Q(\watchdog/q [8])
  );
  defparam \watchdog/q_7 .INIT = 1'b0;
  FDRE \watchdog/q_7  (
    .C(clk_BUFGP_0),
    .CE(\watchdog/q_not0001 ),
    .D(\watchdog/_old_q_4 [7]),
    .R(reset_IBUF1),
    .Q(\watchdog/q [7])
  );
  defparam \watchdog/q_6 .INIT = 1'b0;
  FDRE \watchdog/q_6  (
    .C(clk_BUFGP_0),
    .CE(\watchdog/q_not0001 ),
    .D(\watchdog/_old_q_4 [6]),
    .R(reset_IBUF1),
    .Q(\watchdog/q [6])
  );
  defparam \watchdog/q_5 .INIT = 1'b0;
  FDRE \watchdog/q_5  (
    .C(clk_BUFGP_0),
    .CE(\watchdog/q_not0001 ),
    .D(\watchdog/_old_q_4 [5]),
    .R(reset_IBUF1),
    .Q(\watchdog/q [5])
  );
  defparam \watchdog/q_4 .INIT = 1'b0;
  FDRE \watchdog/q_4  (
    .C(clk_BUFGP_0),
    .CE(\watchdog/q_not0001 ),
    .D(\watchdog/_old_q_4 [4]),
    .R(reset_IBUF1),
    .Q(\watchdog/q [4])
  );
  defparam \watchdog/q_3 .INIT = 1'b0;
  FDRE \watchdog/q_3  (
    .C(clk_BUFGP_0),
    .CE(\watchdog/q_not0001 ),
    .D(\watchdog/_old_q_4 [3]),
    .R(reset_IBUF1),
    .Q(\watchdog/q [3])
  );
  defparam \watchdog/q_2 .INIT = 1'b0;
  FDRE \watchdog/q_2  (
    .C(clk_BUFGP_0),
    .CE(\watchdog/q_not0001 ),
    .D(\watchdog/_old_q_4 [2]),
    .R(reset_IBUF1),
    .Q(\watchdog/q [2])
  );
  defparam \watchdog/q_1 .INIT = 1'b0;
  FDRE \watchdog/q_1  (
    .C(clk_BUFGP_0),
    .CE(\watchdog/q_not0001 ),
    .D(\watchdog/_old_q_4 [1]),
    .R(reset_IBUF1),
    .Q(\watchdog/q [1])
  );
  defparam \watchdog/q_0 .INIT = 1'b0;
  FDRE \watchdog/q_0  (
    .C(clk_BUFGP_0),
    .CE(\watchdog/q_not0001 ),
    .D(\watchdog/_old_q_4 [0]),
    .R(reset_IBUF1),
    .Q(\watchdog/q [0])
  );
  FDRSE \shiftreg/q_31  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(din),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [31])
  );
  FDRSE \shiftreg/q_30  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [31]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [30])
  );
  FDRSE \shiftreg/q_29  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [30]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [29])
  );
  FDRSE \shiftreg/q_28  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [29]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [28])
  );
  FDRSE \shiftreg/q_27  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [28]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [27])
  );
  FDRSE \shiftreg/q_26  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [27]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [26])
  );
  FDRSE \shiftreg/q_25  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [26]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [25])
  );
  FDRSE \shiftreg/q_24  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [25]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [24])
  );
  FDRSE \shiftreg/q_23  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [24]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [23])
  );
  FDRSE \shiftreg/q_22  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [23]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [22])
  );
  FDRSE \shiftreg/q_21  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [22]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [21])
  );
  FDRSE \shiftreg/q_20  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [21]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [20])
  );
  FDRSE \shiftreg/q_19  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [20]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [19])
  );
  FDRSE \shiftreg/q_18  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [19]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [18])
  );
  FDRSE \shiftreg/q_17  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [18]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [17])
  );
  FDRSE \shiftreg/q_16  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [17]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [16])
  );
  FDRSE \shiftreg/q_15  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [16]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [15])
  );
  FDRSE \shiftreg/q_14  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [15]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [14])
  );
  FDRSE \shiftreg/q_13  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [14]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [13])
  );
  FDRSE \shiftreg/q_12  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [13]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [12])
  );
  FDRSE \shiftreg/q_11  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [12]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [11])
  );
  FDRSE \shiftreg/q_10  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [11]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [10])
  );
  FDRE \shiftreg/q_9  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [10]),
    .R(\shiftreg/reset1 ),
    .Q(\shiftreg/q [9])
  );
  FDRSE \shiftreg/q_8  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [9]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [8])
  );
  FDRSE \shiftreg/q_7  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [8]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [7])
  );
  FDRSE \shiftreg/q_6  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [7]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [6])
  );
  FDRSE \shiftreg/q_5  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [6]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [5])
  );
  FDRE \shiftreg/q_4  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [5]),
    .R(\shiftreg/reset1 ),
    .Q(\shiftreg/q [4])
  );
  FDRSE \shiftreg/q_3  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [4]),
    .R(reset_IBUF1),
    .S(\shiftreg/load1_12 ),
    .Q(\shiftreg/q [3])
  );
  FDRE \shiftreg/q_2  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [3]),
    .R(\shiftreg/reset1 ),
    .Q(\shiftreg/q [2])
  );
  FDRE \shiftreg/q_1  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [2]),
    .R(\shiftreg/reset1 ),
    .Q(\shiftreg/q [1])
  );
  FDRE \shiftreg/q_0  (
    .C(clk_BUFGP_0),
    .CE(\fallingtest/falling_edge_9 ),
    .D(\shiftreg/q [1]),
    .R(\shiftreg/reset1 ),
    .Q(\shiftreg/q [0])
  );
  LDCP \controller/next_state_8  (
    .CLR(\controller/next_state_8__and0000 ),
    .D(\controller/next_state_mux0000 [8]),
    .G(\controller/ps2_clk_hiz_cmp_eq0000_20 ),
    .PRE(\controller/next_state_8__and0001 ),
    .Q(\controller/next_state [8])
  );
  LDCP \controller/next_state_7  (
    .CLR(\controller/next_state_7__and0000 ),
    .D(\controller/next_state_mux0000 [7]),
    .G(\controller/ps2_clk_hiz_cmp_eq0000_20 ),
    .PRE(\controller/next_state_7__and0001 ),
    .Q(\controller/next_state [7])
  );
  LDCP \controller/next_state_6  (
    .CLR(\controller/next_state_6__and0000 ),
    .D(\controller/next_state_mux0000 [6]),
    .G(\controller/ps2_clk_hiz_cmp_eq0000_20 ),
    .PRE(\controller/next_state_6__and0001 ),
    .Q(\controller/next_state [6])
  );
  LDCP \controller/next_state_5  (
    .CLR(\controller/next_state_5__and0000 ),
    .D(\controller/next_state_mux0000 [5]),
    .G(\controller/ps2_clk_hiz_cmp_eq0000_20 ),
    .PRE(\controller/next_state_5__and0001 ),
    .Q(\controller/next_state [5])
  );
  LDCP \controller/next_state_4  (
    .CLR(\controller/next_state_4__and0000 ),
    .D(\controller/next_state_mux0000 [4]),
    .G(\controller/ps2_clk_hiz_cmp_eq0000_20 ),
    .PRE(\controller/next_state_4__and0001 ),
    .Q(\controller/next_state [4])
  );
  LDCP \controller/next_state_3  (
    .CLR(\controller/next_state_3__and0000 ),
    .D(\controller/next_state_mux0000 [3]),
    .G(\controller/ps2_clk_hiz_cmp_eq0000_20 ),
    .PRE(\controller/next_state_3__and0001 ),
    .Q(\controller/next_state [3])
  );
  LDCP \controller/next_state_2  (
    .CLR(\controller/next_state_2__and0000 ),
    .D(\controller/next_state_mux0000 [2]),
    .G(\controller/ps2_clk_hiz_cmp_eq0000_20 ),
    .PRE(\controller/next_state_2__and0001 ),
    .Q(\controller/next_state [2])
  );
  LDCP \controller/next_state_1  (
    .CLR(\controller/next_state_1__and0000 ),
    .D(\controller/next_state_1__and0001 ),
    .G(\controller/ps2_clk_hiz_cmp_eq0000_20 ),
    .PRE(\controller/next_state_1__and0001 ),
    .Q(\controller/next_state [1])
  );
  LDCP \controller/ps2_clk_hiz  (
    .CLR(\controller/load_cmp_eq0000 ),
    .D(N2),
    .G(\controller/ps2_clk_hiz_cmp_eq0000_20 ),
    .PRE(\controller/load_or0000_16 ),
    .Q(\controller/ps2_clk_hiz_8 )
  );
  LDCP \controller/load  (
    .CLR(\controller/load_or0000_16 ),
    .D(N2),
    .G(\controller/ps2_clk_hiz_cmp_eq0000_20 ),
    .PRE(\controller/load_cmp_eq0000 ),
    .Q(\controller/load_7 )
  );
  LDCP \controller/bit_reset  (
    .CLR(\controller/bit_reset_or0000_13 ),
    .D(bit_counter[6]),
    .G(\controller/ps2_clk_hiz_cmp_eq0000_20 ),
    .PRE(\controller/bit_reset_cmp_eq0000_14 ),
    .Q(\controller/bit_reset_6 )
  );
  LDCP \controller/error_no_ack  (
    .CLR(\controller/error_no_ack_or0000_21 ),
    .D(bit_counter[6]),
    .G(\controller/ps2_clk_hiz_cmp_eq0000_20 ),
    .PRE(\controller/error_no_ack_cmp_eq0000 ),
    .Q(\controller/error_no_ack_5 )
  );
  LDCP \controller/ps2_data_hiz  (
    .CLR(\controller/ps2_data_hiz__and0000 ),
    .D(\controller/ps2_data_hiz_mux0000 ),
    .G(\controller/ps2_clk_hiz_cmp_eq0000_20 ),
    .PRE(\controller/ps2_data_hiz__or0000 ),
    .Q(\controller/ps2_data_hiz_11 )
  );
  LDC \controller/data_ready  (
    .CLR(\controller/data_ready_or0000 ),
    .D(N2),
    .G(\controller/ps2_clk_hiz_cmp_eq0000_20 ),
    .Q(\controller/data_ready_4 )
  );
  LD \controller/packet_good  (
    .D(\controller/packet_good_and0000_15 ),
    .G(\controller/next_state_cmp_eq0000 ),
    .Q(\controller/packet_good_19 )
  );
  FDCP \controller/state_0  (
    .C(clk_BUFGP_0),
    .CLR(bit_counter[6]),
    .D(bit_counter[6]),
    .PRE(reset_IBUF1),
    .Q(\controller/state [0])
  );
  FDCP \controller/state_1  (
    .C(clk_BUFGP_0),
    .CLR(reset_IBUF1),
    .D(\controller/next_state [1]),
    .PRE(bit_counter[6]),
    .Q(\controller/state [1])
  );
  FDCP \controller/state_3  (
    .C(clk_BUFGP_0),
    .CLR(reset_IBUF1),
    .D(\controller/next_state [3]),
    .PRE(bit_counter[6]),
    .Q(\controller/state [3])
  );
  FDCP \controller/state_4  (
    .C(clk_BUFGP_0),
    .CLR(reset_IBUF1),
    .D(\controller/next_state [4]),
    .PRE(bit_counter[6]),
    .Q(\controller/state [4])
  );
  FDCP \controller/state_2  (
    .C(clk_BUFGP_0),
    .CLR(reset_IBUF1),
    .D(\controller/next_state [2]),
    .PRE(bit_counter[6]),
    .Q(\controller/state [2])
  );
  FDCP \controller/state_6  (
    .C(clk_BUFGP_0),
    .CLR(reset_IBUF1),
    .D(\controller/next_state [6]),
    .PRE(bit_counter[6]),
    .Q(\controller/state [6])
  );
  FDCP \controller/state_7  (
    .C(clk_BUFGP_0),
    .CLR(reset_IBUF1),
    .D(\controller/next_state [7]),
    .PRE(bit_counter[6]),
    .Q(\controller/state [7])
  );
  FDCP \controller/state_5  (
    .C(clk_BUFGP_0),
    .CLR(reset_IBUF1),
    .D(\controller/next_state [5]),
    .PRE(bit_counter[6]),
    .Q(\controller/state [5])
  );
  FDCP \controller/state_8  (
    .C(clk_BUFGP_0),
    .CLR(reset_IBUF1),
    .D(\controller/next_state [8]),
    .PRE(bit_counter[6]),
    .Q(\controller/state [8])
  );
  defparam \shiftreg/reset11 .INIT = 4'hE;
  LUT2 \shiftreg/reset11  (
    .I0(reset_IBUF1),
    .I1(\controller/load_7 ),
    .O(\shiftreg/reset1 )
  );
  defparam \shiftreg/load1 .INIT = 4'h4;
  LUT2 \shiftreg/load1  (
    .I0(reset_IBUF1),
    .I1(\controller/load_7 ),
    .O(\shiftreg/load1_12 )
  );
  defparam \fallingtest/next_state_0__and000041 .INIT = 4'h8;
  LUT2 \fallingtest/next_state_0__and000041  (
    .I0(ps2_clk_IBUF_1),
    .I1(\controller/ps2_clk_hiz_8 ),
    .O(\fallingtest/next_state_0__and0000_bdd3 )
  );
  defparam din1.INIT = 4'h8;
  LUT2 din1 (
    .I0(ps2_data_IBUF_2),
    .I1(\controller/ps2_data_hiz_11 ),
    .O(din)
  );
  defparam \controller/ps2_data_hiz_mux00001 .INIT = 4'hD;
  LUT2 \controller/ps2_data_hiz_mux00001  (
    .I0(\controller/mux0001_cmp_eq0002 ),
    .I1(\shiftreg/q [0]),
    .O(\controller/ps2_data_hiz_mux0000 )
  );
  defparam \fallingtest/falling_edge_cmp_eq00021 .INIT = 8'h04;
  LUT3 \fallingtest/falling_edge_cmp_eq00021  (
    .I0(\fallingtest/state [2]),
    .I1(\fallingtest/state [1]),
    .I2(\fallingtest/state [0]),
    .O(\fallingtest/falling_edge_cmp_eq0002 )
  );
  defparam \fallingtest/falling_edge_cmp_eq000111 .INIT = 8'h04;
  LUT3 \fallingtest/falling_edge_cmp_eq000111  (
    .I0(\fallingtest/state [2]),
    .I1(\fallingtest/state [0]),
    .I2(\fallingtest/state [1]),
    .O(\fallingtest/falling_edge_cmp_eq0001 )
  );
  defparam \fallingtest/falling_edge_cmp_eq00001 .INIT = 8'h04;
  LUT3 \fallingtest/falling_edge_cmp_eq00001  (
    .I0(\fallingtest/state [1]),
    .I1(\fallingtest/state [2]),
    .I2(\fallingtest/state [0]),
    .O(\fallingtest/falling_edge_cmp_eq0000 )
  );
  defparam \controller/ps2_data_hiz__or00001 .INIT = 8'hEA;
  LUT3 \controller/ps2_data_hiz__or00001  (
    .I0(\controller/ps2_data_hiz_or0000_18 ),
    .I1(\controller/mux0001_cmp_eq0002 ),
    .I2(\shiftreg/q [0]),
    .O(\controller/ps2_data_hiz__or0000 )
  );
  defparam \controller/ps2_data_hiz__and00001 .INIT = 8'h04;
  LUT3 \controller/ps2_data_hiz__and00001  (
    .I0(\shiftreg/q [0]),
    .I1(\controller/mux0001_cmp_eq0002 ),
    .I2(\controller/ps2_data_hiz_or0000_18 ),
    .O(\controller/ps2_data_hiz__and0000 )
  );
  defparam \controller/next_state_mux0000<7>11 .INIT = 8'h04;
  LUT3 \controller/next_state_mux0000<7>11  (
    .I0(\controller/bit_reset_cmp_eq0000_14 ),
    .I1(\controller/N4 ),
    .I2(\controller/mux0001_cmp_eq0005 ),
    .O(\controller/N14 )
  );
  defparam \controller/next_state_mux0000<4>11 .INIT = 8'h04;
  LUT3 \controller/next_state_mux0000<4>11  (
    .I0(\controller/mux0001_cmp_eq0002 ),
    .I1(\controller/N18 ),
    .I2(\controller/error_no_ack_cmp_eq0000 ),
    .O(\controller/N4 )
  );
  defparam \controller/next_state_mux0000<1>1 .INIT = 8'hAE;
  LUT3 \controller/next_state_mux0000<1>1  (
    .I0(\controller/mux0001_cmp_eq0000 ),
    .I1(\controller/load_cmp_eq0000 ),
    .I2(\watchdog/timer_150us_done_10 ),
    .O(\controller/next_state_1__and0001 )
  );
  defparam \controller/next_state_cmp_eq00001 .INIT = 8'h20;
  LUT3 \controller/next_state_cmp_eq00001  (
    .I0(\controller/state [7]),
    .I1(\controller/state [6]),
    .I2(\controller/N16 ),
    .O(\controller/next_state_cmp_eq0000 )
  );
  defparam \controller/mux0001_cmp_eq00092 .INIT = 8'h20;
  LUT3 \controller/mux0001_cmp_eq00092  (
    .I0(\controller/N16 ),
    .I1(\controller/state [7]),
    .I2(\controller/state [6]),
    .O(\controller/mux0001_cmp_eq0009 )
  );
  defparam \controller/load_cmp_eq000011 .INIT = 8'h01;
  LUT3 \controller/load_cmp_eq000011  (
    .I0(\controller/state [3]),
    .I1(\controller/state [2]),
    .I2(\controller/state [4]),
    .O(\controller/N12 )
  );
  defparam \controller/error_no_ack_cmp_eq000021 .INIT = 8'h04;
  LUT3 \controller/error_no_ack_cmp_eq000021  (
    .I0(\controller/state [0]),
    .I1(\controller/N5 ),
    .I2(\controller/state [1]),
    .O(\controller/N13 )
  );
  defparam \fallingtest/next_state_1__and000111 .INIT = 16'h0004;
  LUT4 \fallingtest/next_state_1__and000111  (
    .I0(\fallingtest/state [1]),
    .I1(\fallingtest/state [0]),
    .I2(\fallingtest/next_state_0__and0000_bdd3 ),
    .I3(\fallingtest/state [2]),
    .O(\fallingtest/next_state_1__and0001 )
  );
  defparam \controller/next_state_mux0000<8>1 .INIT = 16'h2000;
  LUT4 \controller/next_state_mux0000<8>1  (
    .I0(\controller/next_state_cmp_eq0000 ),
    .I1(\controller/mux0001_cmp_eq0009 ),
    .I2(\controller/N14 ),
    .I3(\controller/packet_good_19 ),
    .O(\controller/next_state_mux0000 [8])
  );
  defparam \controller/mux0001_cmp_eq00051 .INIT = 16'h0008;
  LUT4 \controller/mux0001_cmp_eq00051  (
    .I0(\controller/N13 ),
    .I1(\controller/state [4]),
    .I2(\controller/state [3]),
    .I3(\controller/state [2]),
    .O(\controller/mux0001_cmp_eq0005 )
  );
  defparam \controller/mux0001_cmp_eq00021 .INIT = 16'h0008;
  LUT4 \controller/mux0001_cmp_eq00021  (
    .I0(\controller/N13 ),
    .I1(\controller/state [2]),
    .I2(\controller/state [3]),
    .I3(\controller/state [4]),
    .O(\controller/mux0001_cmp_eq0002 )
  );
  defparam \controller/mux0001_cmp_eq00001 .INIT = 16'h2000;
  LUT4 \controller/mux0001_cmp_eq00001  (
    .I0(\controller/N5 ),
    .I1(\controller/state [1]),
    .I2(\controller/N12 ),
    .I3(\controller/state [0]),
    .O(\controller/mux0001_cmp_eq0000 )
  );
  defparam \controller/load_cmp_eq00001 .INIT = 16'h2000;
  LUT4 \controller/load_cmp_eq00001  (
    .I0(\controller/N5 ),
    .I1(\controller/state [0]),
    .I2(\controller/N12 ),
    .I3(\controller/state [1]),
    .O(\controller/load_cmp_eq0000 )
  );
  defparam \controller/error_no_ack_cmp_eq000011 .INIT = 16'h0001;
  LUT4 \controller/error_no_ack_cmp_eq000011  (
    .I0(\controller/state [8]),
    .I1(\controller/state [5]),
    .I2(\controller/state [6]),
    .I3(\controller/state [7]),
    .O(\controller/N5 )
  );
  defparam \controller/error_no_ack_cmp_eq00001 .INIT = 16'h0008;
  LUT4 \controller/error_no_ack_cmp_eq00001  (
    .I0(\controller/N13 ),
    .I1(\controller/state [3]),
    .I2(\controller/state [2]),
    .I3(\controller/state [4]),
    .O(\controller/error_no_ack_cmp_eq0000 )
  );
  defparam \fallingtest/next_state_2__and000111 .INIT = 16'h0414;
  LUT4 \fallingtest/next_state_2__and000111  (
    .I0(\fallingtest/state [0]),
    .I1(\fallingtest/state [1]),
    .I2(\fallingtest/state [2]),
    .I3(\fallingtest/next_state_0__and0000_bdd3 ),
    .O(\fallingtest/next_state_2__and0001 )
  );
  defparam \controller/next_state_mux0000<4>21 .INIT = 16'hD7FF;
  LUT4 \controller/next_state_mux0000<4>21  (
    .I0(\controller/N12 ),
    .I1(\controller/state [0]),
    .I2(\controller/state [1]),
    .I3(\controller/N5 ),
    .O(\controller/N18 )
  );
  defparam \fallingtest/next_state_2__and000011 .INIT = 16'h1202;
  LUT4 \fallingtest/next_state_2__and000011  (
    .I0(\fallingtest/state [0]),
    .I1(\fallingtest/state [1]),
    .I2(\fallingtest/state [2]),
    .I3(\fallingtest/next_state_0__and0000_bdd3 ),
    .O(\fallingtest/next_state_2__and0000 )
  );
  defparam \fallingtest/next_state_1__and000011 .INIT = 16'h1614;
  LUT4 \fallingtest/next_state_1__and000011  (
    .I0(\fallingtest/state [0]),
    .I1(\fallingtest/state [2]),
    .I2(\fallingtest/state [1]),
    .I3(\fallingtest/next_state_0__and0000_bdd3 ),
    .O(\fallingtest/next_state_1__and0000 )
  );
  defparam \fallingtest/next_state_0__and000111 .INIT = 16'h0048;
  LUT4 \fallingtest/next_state_0__and000111  (
    .I0(\fallingtest/state [0]),
    .I1(\fallingtest/next_state_0__and0000_bdd3 ),
    .I2(\fallingtest/state [2]),
    .I3(\fallingtest/state [1]),
    .O(\fallingtest/next_state_0__and0001 )
  );
  defparam \fallingtest/next_state_0__and000021 .INIT = 16'h1016;
  LUT4 \fallingtest/next_state_0__and000021  (
    .I0(\fallingtest/state [0]),
    .I1(\fallingtest/state [2]),
    .I2(\fallingtest/state [1]),
    .I3(\fallingtest/next_state_0__and0000_bdd3 ),
    .O(\fallingtest/next_state_0__and0000 )
  );
  defparam \fallingtest/state_2__and000011 .INIT = 16'h0112;
  LUT4 \fallingtest/state_2__and000011  (
    .I0(\fallingtest/state [0]),
    .I1(\fallingtest/next_state [2]),
    .I2(\fallingtest/state [2]),
    .I3(\fallingtest/state [1]),
    .O(\fallingtest/state_2__and0000 )
  );
  defparam \fallingtest/state_1__and000011 .INIT = 16'h0112;
  LUT4 \fallingtest/state_1__and000011  (
    .I0(\fallingtest/state [0]),
    .I1(\fallingtest/next_state [1]),
    .I2(\fallingtest/state [2]),
    .I3(\fallingtest/state [1]),
    .O(\fallingtest/state_1__and0000 )
  );
  defparam \fallingtest/state_0__and000111 .INIT = 16'h0448;
  LUT4 \fallingtest/state_0__and000111  (
    .I0(\fallingtest/state [0]),
    .I1(\fallingtest/next_state [0]),
    .I2(\fallingtest/state [2]),
    .I3(\fallingtest/state [1]),
    .O(\fallingtest/state_0__and0001 )
  );
  defparam \fallingtest/state_0__and000011 .INIT = 16'h0112;
  LUT4 \fallingtest/state_0__and000011  (
    .I0(\fallingtest/state [0]),
    .I1(\fallingtest/next_state [0]),
    .I2(\fallingtest/state [2]),
    .I3(\fallingtest/state [1]),
    .O(\fallingtest/state_0__and0000 )
  );
  defparam \controller/Mxor_packet_good_xor0004_xo<5>1 .INIT = 16'h6996;
  LUT4 \controller/Mxor_packet_good_xor0004_xo<5>1  (
    .I0(\shiftreg/q [29]),
    .I1(\shiftreg/q [30]),
    .I2(\shiftreg/q [27]),
    .I3(\shiftreg/q [28]),
    .O(\controller/Mxor_packet_good_xor0004_xo [5])
  );
  defparam \controller/Mxor_packet_good_xor0004_xo<4>1 .INIT = 16'h6996;
  LUT4 \controller/Mxor_packet_good_xor0004_xo<4>1  (
    .I0(\shiftreg/q [25]),
    .I1(\shiftreg/q [26]),
    .I2(\shiftreg/q [23]),
    .I3(\shiftreg/q [24]),
    .O(\controller/Mxor_packet_good_xor0004_xo [4])
  );
  defparam \controller/Mxor_packet_good_xor0002_xo<5>1 .INIT = 16'h6996;
  LUT4 \controller/Mxor_packet_good_xor0002_xo<5>1  (
    .I0(\shiftreg/q [18]),
    .I1(\shiftreg/q [19]),
    .I2(\shiftreg/q [16]),
    .I3(\shiftreg/q [17]),
    .O(\controller/Mxor_packet_good_xor0002_xo [5])
  );
  defparam \controller/Mxor_packet_good_xor0002_xo<4>1 .INIT = 16'h6996;
  LUT4 \controller/Mxor_packet_good_xor0002_xo<4>1  (
    .I0(\shiftreg/q [14]),
    .I1(\shiftreg/q [15]),
    .I2(\shiftreg/q [12]),
    .I3(\shiftreg/q [13]),
    .O(\controller/Mxor_packet_good_xor0002_xo [4])
  );
  defparam \controller/Mxor_packet_good_xor0000_xo<5>1 .INIT = 16'h6996;
  LUT4 \controller/Mxor_packet_good_xor0000_xo<5>1  (
    .I0(\shiftreg/q [7]),
    .I1(\shiftreg/q [8]),
    .I2(\shiftreg/q [5]),
    .I3(\shiftreg/q [6]),
    .O(\controller/Mxor_packet_good_xor0000_xo [5])
  );
  defparam \controller/Mxor_packet_good_xor0000_xo<4>1 .INIT = 16'h6996;
  LUT4 \controller/Mxor_packet_good_xor0000_xo<4>1  (
    .I0(\shiftreg/q [3]),
    .I1(\shiftreg/q [4]),
    .I2(\shiftreg/q [1]),
    .I3(\shiftreg/q [2]),
    .O(\controller/Mxor_packet_good_xor0000_xo [4])
  );
  defparam \controller/mux0001_cmp_eq00091 .INIT = 16'h0001;
  LUT4 \controller/mux0001_cmp_eq00091  (
    .I0(\controller/state [8]),
    .I1(\controller/state [5]),
    .I2(\controller/state [1]),
    .I3(N60),
    .O(\controller/N16 )
  );
  defparam \controller/ps2_data_hiz_or0000_SW0 .INIT = 16'hFFFE;
  LUT4 \controller/ps2_data_hiz_or0000_SW0  (
    .I0(\controller/mux0001_cmp_eq0000 ),
    .I1(\controller/load_cmp_eq0000 ),
    .I2(\controller/error_no_ack_cmp_eq0000 ),
    .I3(\controller/bit_reset_cmp_eq0000_14 ),
    .O(N62)
  );
  defparam \controller/ps2_data_hiz_or0000 .INIT = 16'hFFFE;
  LUT4 \controller/ps2_data_hiz_or0000  (
    .I0(\controller/next_state_cmp_eq0000 ),
    .I1(\controller/mux0001_cmp_eq0009 ),
    .I2(\controller/mux0001_cmp_eq0005 ),
    .I3(N62),
    .O(\controller/ps2_data_hiz_or0000_18 )
  );
  defparam \controller/ps2_clk_hiz_cmp_eq0000_SW0 .INIT = 16'hFFEF;
  LUT4 \controller/ps2_clk_hiz_cmp_eq0000_SW0  (
    .I0(\controller/state [0]),
    .I1(\controller/state [1]),
    .I2(\controller/N12 ),
    .I3(\controller/state [5]),
    .O(N64)
  );
  defparam \controller/ps2_clk_hiz_cmp_eq0000 .INIT = 16'h0004;
  LUT4 \controller/ps2_clk_hiz_cmp_eq0000  (
    .I0(\controller/state [7]),
    .I1(\controller/state [8]),
    .I2(\controller/state [6]),
    .I3(N64),
    .O(\controller/ps2_clk_hiz_cmp_eq0000_20 )
  );
  defparam \controller/load_or0000_SW0 .INIT = 16'hFFFE;
  LUT4 \controller/load_or0000_SW0  (
    .I0(\controller/mux0001_cmp_eq0002 ),
    .I1(\controller/mux0001_cmp_eq0000 ),
    .I2(\controller/error_no_ack_cmp_eq0000 ),
    .I3(\controller/bit_reset_cmp_eq0000_14 ),
    .O(N66)
  );
  defparam \controller/load_or0000 .INIT = 16'hFFFE;
  LUT4 \controller/load_or0000  (
    .I0(\controller/next_state_cmp_eq0000 ),
    .I1(\controller/mux0001_cmp_eq0009 ),
    .I2(\controller/mux0001_cmp_eq0005 ),
    .I3(N66),
    .O(\controller/load_or0000_16 )
  );
  defparam \controller/error_no_ack_or0000_SW0 .INIT = 16'hFFFE;
  LUT4 \controller/error_no_ack_or0000_SW0  (
    .I0(\controller/mux0001_cmp_eq0002 ),
    .I1(\controller/mux0001_cmp_eq0000 ),
    .I2(\controller/load_cmp_eq0000 ),
    .I3(\controller/bit_reset_cmp_eq0000_14 ),
    .O(N68)
  );
  defparam \controller/error_no_ack_or0000 .INIT = 16'hFFFE;
  LUT4 \controller/error_no_ack_or0000  (
    .I0(\controller/next_state_cmp_eq0000 ),
    .I1(\controller/mux0001_cmp_eq0009 ),
    .I2(\controller/mux0001_cmp_eq0005 ),
    .I3(N68),
    .O(\controller/error_no_ack_or0000_21 )
  );
  defparam \controller/bit_reset_or0000_SW0 .INIT = 16'hFFFE;
  LUT4 \controller/bit_reset_or0000_SW0  (
    .I0(\controller/mux0001_cmp_eq0002 ),
    .I1(\controller/mux0001_cmp_eq0000 ),
    .I2(\controller/load_cmp_eq0000 ),
    .I3(\controller/error_no_ack_cmp_eq0000 ),
    .O(N70)
  );
  defparam \controller/bit_reset_or0000 .INIT = 16'hFFFE;
  LUT4 \controller/bit_reset_or0000  (
    .I0(\controller/next_state_cmp_eq0000 ),
    .I1(\controller/mux0001_cmp_eq0009 ),
    .I2(\controller/mux0001_cmp_eq0005 ),
    .I3(N70),
    .O(\controller/bit_reset_or0000_13 )
  );
  defparam \controller/bit_reset_cmp_eq0000_SW0 .INIT = 16'hFFBF;
  LUT4 \controller/bit_reset_cmp_eq0000_SW0  (
    .I0(\controller/state [0]),
    .I1(\controller/state [5]),
    .I2(\controller/N12 ),
    .I3(\controller/state [1]),
    .O(N72)
  );
  defparam \controller/bit_reset_cmp_eq0000 .INIT = 16'h0001;
  LUT4 \controller/bit_reset_cmp_eq0000  (
    .I0(\controller/state [8]),
    .I1(\controller/state [7]),
    .I2(\controller/state [6]),
    .I3(N72),
    .O(\controller/bit_reset_cmp_eq0000_14 )
  );
  defparam \controller/packet_good_and0000 .INIT = 16'h0096;
  LUT4 \controller/packet_good_and0000  (
    .I0(\shiftreg/q [9]),
    .I1(\controller/Mxor_packet_good_xor0000_xo [5]),
    .I2(\controller/Mxor_packet_good_xor0000_xo [4]),
    .I3(N74),
    .O(\controller/packet_good_and0000_15 )
  );
  defparam \controller/mux0001_cmp_eq000710 .INIT = 16'h0008;
  LUT4 \controller/mux0001_cmp_eq000710  (
    .I0(\shiftreg/q [24]),
    .I1(\shiftreg/q [26]),
    .I2(\shiftreg/q [23]),
    .I3(\shiftreg/q [25]),
    .O(\controller/mux0001_cmp_eq0007_map4 )
  );
  defparam \controller/mux0001_cmp_eq000715 .INIT = 16'h8000;
  LUT4 \controller/mux0001_cmp_eq000715  (
    .I0(\shiftreg/q [27]),
    .I1(\shiftreg/q [28]),
    .I2(\shiftreg/q [29]),
    .I3(\shiftreg/q [30]),
    .O(\controller/mux0001_cmp_eq0007_map7 )
  );
  defparam \controller/mux0001_cmp_eq000716 .INIT = 4'h8;
  LUT2 \controller/mux0001_cmp_eq000716  (
    .I0(\controller/mux0001_cmp_eq0007_map4 ),
    .I1(\controller/mux0001_cmp_eq0007_map7 ),
    .O(\controller/mux0001_cmp_eq0007 )
  );
  defparam \controller/data_ready_or00004 .INIT = 16'hFFFE;
  LUT4 \controller/data_ready_or00004  (
    .I0(\controller/mux0001_cmp_eq0002 ),
    .I1(\controller/error_no_ack_cmp_eq0000 ),
    .I2(\controller/mux0001_cmp_eq0005 ),
    .I3(\controller/bit_reset_cmp_eq0000_14 ),
    .O(\controller/data_ready_or0000_map2 )
  );
  defparam \controller/data_ready_or00009 .INIT = 16'hFFFE;
  LUT4 \controller/data_ready_or00009  (
    .I0(\controller/mux0001_cmp_eq0009 ),
    .I1(\controller/next_state_cmp_eq0000 ),
    .I2(\controller/mux0001_cmp_eq0000 ),
    .I3(\controller/load_cmp_eq0000 ),
    .O(\controller/data_ready_or0000_map5 )
  );
  defparam \controller/data_ready_or000010 .INIT = 4'hE;
  LUT2 \controller/data_ready_or000010  (
    .I0(\controller/data_ready_or0000_map2 ),
    .I1(\controller/data_ready_or0000_map5 ),
    .O(\controller/data_ready_or0000 )
  );
  defparam \fallingtest/state_mux0000<0>1 .INIT = 16'hFFE9;
  LUT4 \fallingtest/state_mux0000<0>1  (
    .I0(\fallingtest/state [1]),
    .I1(\fallingtest/state [2]),
    .I2(\fallingtest/state [0]),
    .I3(\fallingtest/next_state [0]),
    .O(\fallingtest/state_mux0000 [0])
  );
  defparam \fallingtest/next_state_mux0000<0>11 .INIT = 16'hEFE9;
  LUT4 \fallingtest/next_state_mux0000<0>11  (
    .I0(\fallingtest/state [2]),
    .I1(\fallingtest/state [0]),
    .I2(\fallingtest/state [1]),
    .I3(\fallingtest/next_state_0__and0000_bdd3 ),
    .O(\fallingtest/next_state_mux0000 [0])
  );
  defparam \fallingtest/state_2__and000111 .INIT = 16'h0448;
  LUT4 \fallingtest/state_2__and000111  (
    .I0(\fallingtest/state [0]),
    .I1(\fallingtest/next_state [2]),
    .I2(\fallingtest/state [1]),
    .I3(\fallingtest/state [2]),
    .O(\fallingtest/state_2__and0001 )
  );
  defparam \fallingtest/state_1__and000111 .INIT = 16'h0448;
  LUT4 \fallingtest/state_1__and000111  (
    .I0(\fallingtest/state [0]),
    .I1(\fallingtest/next_state [1]),
    .I2(\fallingtest/state [1]),
    .I3(\fallingtest/state [2]),
    .O(\fallingtest/state_1__and0001 )
  );
  defparam \bit_counter_p/Madd_old_q_6_addsub0000_cy<3>11 .INIT = 16'h8000;
  LUT4 \bit_counter_p/Madd_old_q_6_addsub0000_cy<3>11  (
    .I0(\bit_counter_p/q [3]),
    .I1(\bit_counter_p/q [2]),
    .I2(\bit_counter_p/q [1]),
    .I3(\bit_counter_p/q [0]),
    .O(\bit_counter_p/Madd_old_q_6_addsub0000_cy [3])
  );
  defparam \watchdog/q_cmp_eq00008 .INIT = 16'h0008;
  LUT4 \watchdog/q_cmp_eq00008  (
    .I0(\watchdog/q [12]),
    .I1(\watchdog/q [13]),
    .I2(\watchdog/q [14]),
    .I3(\watchdog/q [15]),
    .O(\watchdog/q_cmp_eq0000_map4 )
  );
  defparam \watchdog/q_cmp_eq000019 .INIT = 16'h0008;
  LUT4 \watchdog/q_cmp_eq000019  (
    .I0(\watchdog/q [11]),
    .I1(\watchdog/q [9]),
    .I2(\watchdog/q [8]),
    .I3(\watchdog/q [10]),
    .O(\watchdog/q_cmp_eq0000_map9 )
  );
  defparam \watchdog/q_cmp_eq000040 .INIT = 16'h0008;
  LUT4 \watchdog/q_cmp_eq000040  (
    .I0(\watchdog/q [7]),
    .I1(\watchdog/q [4]),
    .I2(\watchdog/q [5]),
    .I3(\watchdog/q [6]),
    .O(\watchdog/q_cmp_eq0000_map15 )
  );
  defparam \watchdog/q_cmp_eq000052 .INIT = 16'h0004;
  LUT4 \watchdog/q_cmp_eq000052  (
    .I0(\watchdog/q [2]),
    .I1(\watchdog/q [3]),
    .I2(\watchdog/q [0]),
    .I3(\watchdog/q [1]),
    .O(\watchdog/q_cmp_eq0000_map21 )
  );
  defparam \watchdog/q_cmp_eq000066 .INIT = 16'h8000;
  LUT4 \watchdog/q_cmp_eq000066  (
    .I0(\watchdog/q_cmp_eq0000_map4 ),
    .I1(\watchdog/q_cmp_eq0000_map9 ),
    .I2(\watchdog/q_cmp_eq0000_map15 ),
    .I3(\watchdog/q_cmp_eq0000_map21 ),
    .O(\watchdog/q_cmp_eq0000 )
  );
  defparam \controller/next_state_mux0000<7>1 .INIT = 8'h80;
  LUT3 \controller/next_state_mux0000<7>1  (
    .I0(\controller/N14 ),
    .I1(\controller/mux0001_cmp_eq0009 ),
    .I2(N320),
    .O(\controller/next_state_mux0000 [7])
  );
  defparam \bit_counter_p/_old_q_6<0>1 .INIT = 8'h01;
  LUT3 \bit_counter_p/_old_q_6<0>1  (
    .I0(reset_IBUF1),
    .I1(\bit_counter_p/q [0]),
    .I2(\controller/bit_reset_6 ),
    .O(bit_counter[0])
  );
  defparam \watchdog/_old_q_4<14>1 .INIT = 4'h4;
  LUT2 \watchdog/_old_q_4<14>1  (
    .I0(\watchdog/_old_q_3 [15]),
    .I1(\watchdog/_old_q_3 [14]),
    .O(\watchdog/_old_q_4 [14])
  );
  defparam \watchdog/_old_q_4<13>1 .INIT = 4'h4;
  LUT2 \watchdog/_old_q_4<13>1  (
    .I0(\watchdog/_old_q_3 [15]),
    .I1(\watchdog/_old_q_3 [13]),
    .O(\watchdog/_old_q_4 [13])
  );
  defparam \bit_counter_p/_old_q_6<1>2 .INIT = 8'h60;
  LUT3 \bit_counter_p/_old_q_6<1>2  (
    .I0(\bit_counter_p/q [1]),
    .I1(\bit_counter_p/q [0]),
    .I2(N1),
    .O(bit_counter[1])
  );
  defparam \bit_counter_p/_old_q_6<2>1 .INIT = 16'h60A0;
  LUT4 \bit_counter_p/_old_q_6<2>1  (
    .I0(\bit_counter_p/q [2]),
    .I1(\bit_counter_p/q [1]),
    .I2(N1),
    .I3(\bit_counter_p/q [0]),
    .O(bit_counter[2])
  );
  defparam \bit_counter_p/_old_q_6<3>_SW0 .INIT = 4'h8;
  LUT2 \bit_counter_p/_old_q_6<3>_SW0  (
    .I0(\bit_counter_p/q [0]),
    .I1(\bit_counter_p/q [1]),
    .O(N193)
  );
  defparam \bit_counter_p/_old_q_6<3> .INIT = 16'h60A0;
  LUT4 \bit_counter_p/_old_q_6<3>  (
    .I0(\bit_counter_p/q [3]),
    .I1(\bit_counter_p/q [2]),
    .I2(N1),
    .I3(N193),
    .O(bit_counter[3])
  );
  defparam \controller/mux0001_cmp_eq00031 .INIT = 16'h2000;
  LUT4 \controller/mux0001_cmp_eq00031  (
    .I0(bit_counter[3]),
    .I1(bit_counter[5]),
    .I2(bit_counter[1]),
    .I3(N319),
    .O(\controller/mux0001_cmp_eq0003 )
  );
  defparam \controller/next_state_mux0000<5>15 .INIT = 16'h0001;
  LUT4 \controller/next_state_mux0000<5>15  (
    .I0(\controller/bit_reset_cmp_eq0000_14 ),
    .I1(\controller/mux0001_cmp_eq0005 ),
    .I2(\controller/mux0001_cmp_eq0009 ),
    .I3(\controller/packet_good_19 ),
    .O(\controller/next_state_mux0000<5>_map8 )
  );
  defparam \bit_counter_p/_old_q_6<4>1 .INIT = 8'h60;
  LUT3 \bit_counter_p/_old_q_6<4>1  (
    .I0(\bit_counter_p/q [4]),
    .I1(\bit_counter_p/Madd_old_q_6_addsub0000_cy [3]),
    .I2(N322),
    .O(bit_counter[4])
  );
  defparam \bit_counter_p/_old_q_6<5>1 .INIT = 16'h60A0;
  LUT4 \bit_counter_p/_old_q_6<5>1  (
    .I0(\bit_counter_p/q [5]),
    .I1(\bit_counter_p/q [4]),
    .I2(N1),
    .I3(\bit_counter_p/Madd_old_q_6_addsub0000_cy [3]),
    .O(bit_counter[5])
  );
  defparam \controller/mux0001_cmp_eq0006 .INIT = 16'h0004;
  LUT4 \controller/mux0001_cmp_eq0006  (
    .I0(bit_counter[5]),
    .I1(bit_counter[4]),
    .I2(bit_counter[3]),
    .I3(N231),
    .O(\controller/mux0001_cmp_eq0006_17 )
  );
  defparam \bit_counter_p/_old_q_6<1>12 .INIT = 4'hD;
  LUT2 \bit_counter_p/_old_q_6<1>12  (
    .I0(\bit_counter_p/q [0]),
    .I1(\bit_counter_p/q [1]),
    .O(\bit_counter_p/_old_q_6<1>1_map1 )
  );
  defparam \bit_counter_p/_old_q_6<1>110 .INIT = 16'hFFEF;
  LUT4 \bit_counter_p/_old_q_6<1>110  (
    .I0(\bit_counter_p/q [4]),
    .I1(\bit_counter_p/q [3]),
    .I2(\bit_counter_p/q [5]),
    .I3(\bit_counter_p/q [2]),
    .O(\bit_counter_p/_old_q_6<1>1_map5 )
  );
  defparam \controller/next_state_mux0000<3>_SW0 .INIT = 16'hBAAA;
  LUT4 \controller/next_state_mux0000<3>_SW0  (
    .I0(\controller/error_no_ack_cmp_eq0000 ),
    .I1(\controller/mux0001_cmp_eq0007 ),
    .I2(\controller/mux0001_cmp_eq0006_17 ),
    .I3(\controller/mux0001_cmp_eq0005 ),
    .O(N259)
  );
  defparam \controller/next_state_mux0000<3> .INIT = 16'hA820;
  LUT4 \controller/next_state_mux0000<3>  (
    .I0(\controller/N18 ),
    .I1(\controller/mux0001_cmp_eq0002 ),
    .I2(N259),
    .I3(N260),
    .O(\controller/next_state_mux0000 [3])
  );
  defparam \watchdog/_old_q_4<5>1 .INIT = 16'h80AA;
  LUT4 \watchdog/_old_q_4<5>1  (
    .I0(\watchdog/_old_q_3 [5]),
    .I1(N324),
    .I2(\watchdog/N11 ),
    .I3(\watchdog/_old_q_3 [15]),
    .O(\watchdog/_old_q_4 [5])
  );
  defparam \watchdog/_old_q_4<4>1 .INIT = 16'h80AA;
  LUT4 \watchdog/_old_q_4<4>1  (
    .I0(\watchdog/_old_q_3 [4]),
    .I1(\watchdog/N111 ),
    .I2(\watchdog/N11 ),
    .I3(\watchdog/_old_q_3 [15]),
    .O(\watchdog/_old_q_4 [4])
  );
  defparam \watchdog/_old_q_4<3>1 .INIT = 16'h80AA;
  LUT4 \watchdog/_old_q_4<3>1  (
    .I0(\watchdog/_old_q_3 [3]),
    .I1(\watchdog/N111 ),
    .I2(\watchdog/N11 ),
    .I3(\watchdog/_old_q_3 [15]),
    .O(\watchdog/_old_q_4 [3])
  );
  defparam \watchdog/_old_q_4<2>1 .INIT = 16'h80AA;
  LUT4 \watchdog/_old_q_4<2>1  (
    .I0(\watchdog/_old_q_3 [2]),
    .I1(\watchdog/N111 ),
    .I2(\watchdog/N11 ),
    .I3(\watchdog/_old_q_3 [15]),
    .O(\watchdog/_old_q_4 [2])
  );
  defparam \watchdog/_old_q_4<1>1 .INIT = 16'h80AA;
  LUT4 \watchdog/_old_q_4<1>1  (
    .I0(\watchdog/_old_q_3 [1]),
    .I1(\watchdog/N111 ),
    .I2(\watchdog/N11 ),
    .I3(\watchdog/_old_q_3 [15]),
    .O(\watchdog/_old_q_4 [1])
  );
  defparam \watchdog/_old_q_4<15>11 .INIT = 16'hF7FF;
  LUT4 \watchdog/_old_q_4<15>11  (
    .I0(\watchdog/_old_q_3 [10]),
    .I1(\watchdog/_old_q_3 [11]),
    .I2(N323),
    .I3(\watchdog/_old_q_3 [12]),
    .O(\watchdog/N11 )
  );
  defparam \watchdog/_old_q_4<12> .INIT = 16'hA222;
  LUT4 \watchdog/_old_q_4<12>  (
    .I0(\watchdog/_old_q_3 [12]),
    .I1(\watchdog/_old_q_3 [15]),
    .I2(N271),
    .I3(\watchdog/N111 ),
    .O(\watchdog/_old_q_4 [12])
  );
  defparam \watchdog/_old_q_4<11> .INIT = 16'hA222;
  LUT4 \watchdog/_old_q_4<11>  (
    .I0(\watchdog/_old_q_3 [11]),
    .I1(\watchdog/_old_q_3 [15]),
    .I2(N273),
    .I3(\watchdog/N111 ),
    .O(\watchdog/_old_q_4 [11])
  );
  defparam \watchdog/_old_q_4<10> .INIT = 16'hA222;
  LUT4 \watchdog/_old_q_4<10>  (
    .I0(\watchdog/_old_q_3 [10]),
    .I1(\watchdog/_old_q_3 [15]),
    .I2(N275),
    .I3(\watchdog/N111 ),
    .O(\watchdog/_old_q_4 [10])
  );
  IBUF reset_IBUF (
    .I(reset),
    .O(reset_IBUF1)
  );
  IBUF ps2_clk_IBUF (
    .I(ps2_clk),
    .O(ps2_clk_IBUF_1)
  );
  IBUF ps2_data_IBUF (
    .I(ps2_data),
    .O(ps2_data_IBUF_2)
  );
  OBUF data_ready_OBUF (
    .I(\controller/data_ready_4 ),
    .O(data_ready)
  );
  OBUF right_button_OBUF (
    .I(\shiftreg/q [2]),
    .O(right_button)
  );
  OBUF left_button_OBUF (
    .I(\shiftreg/q [1]),
    .O(left_button)
  );
  OBUF error_no_ack_OBUF (
    .I(\controller/error_no_ack_5 ),
    .O(error_no_ack)
  );
  OBUF x_increment_8_OBUF (
    .I(\shiftreg/q [5]),
    .O(x_increment[8])
  );
  OBUF x_increment_7_OBUF (
    .I(\shiftreg/q [19]),
    .O(x_increment[7])
  );
  OBUF x_increment_6_OBUF (
    .I(\shiftreg/q [18]),
    .O(x_increment[6])
  );
  OBUF x_increment_5_OBUF (
    .I(\shiftreg/q [17]),
    .O(x_increment[5])
  );
  OBUF x_increment_4_OBUF (
    .I(\shiftreg/q [16]),
    .O(x_increment[4])
  );
  OBUF x_increment_3_OBUF (
    .I(\shiftreg/q [15]),
    .O(x_increment[3])
  );
  OBUF x_increment_2_OBUF (
    .I(\shiftreg/q [14]),
    .O(x_increment[2])
  );
  OBUF x_increment_1_OBUF (
    .I(\shiftreg/q [13]),
    .O(x_increment[1])
  );
  OBUF x_increment_0_OBUF (
    .I(\shiftreg/q [12]),
    .O(x_increment[0])
  );
  OBUF y_increment_8_OBUF (
    .I(\shiftreg/q [6]),
    .O(y_increment[8])
  );
  OBUF y_increment_7_OBUF (
    .I(\shiftreg/q [30]),
    .O(y_increment[7])
  );
  OBUF y_increment_6_OBUF (
    .I(\shiftreg/q [29]),
    .O(y_increment[6])
  );
  OBUF y_increment_5_OBUF (
    .I(\shiftreg/q [28]),
    .O(y_increment[5])
  );
  OBUF y_increment_4_OBUF (
    .I(\shiftreg/q [27]),
    .O(y_increment[4])
  );
  OBUF y_increment_3_OBUF (
    .I(\shiftreg/q [26]),
    .O(y_increment[3])
  );
  OBUF y_increment_2_OBUF (
    .I(\shiftreg/q [25]),
    .O(y_increment[2])
  );
  OBUF y_increment_1_OBUF (
    .I(\shiftreg/q [24]),
    .O(y_increment[1])
  );
  OBUF y_increment_0_OBUF (
    .I(\shiftreg/q [23]),
    .O(y_increment[0])
  );
  defparam \watchdog/Madd__old_q_3_cy<14>_rt .INIT = 4'h2;
  LUT1 \watchdog/Madd__old_q_3_cy<14>_rt  (
    .I0(\watchdog/q [14]),
    .O(\watchdog/Madd__old_q_3_cy<14>_rt_22 )
  );
  defparam \watchdog/Madd__old_q_3_cy<13>_rt .INIT = 4'h2;
  LUT1 \watchdog/Madd__old_q_3_cy<13>_rt  (
    .I0(\watchdog/q [13]),
    .O(\watchdog/Madd__old_q_3_cy<13>_rt_23 )
  );
  defparam \watchdog/Madd__old_q_3_cy<12>_rt .INIT = 4'h2;
  LUT1 \watchdog/Madd__old_q_3_cy<12>_rt  (
    .I0(\watchdog/q [12]),
    .O(\watchdog/Madd__old_q_3_cy<12>_rt_24 )
  );
  defparam \watchdog/Madd__old_q_3_cy<11>_rt .INIT = 4'h2;
  LUT1 \watchdog/Madd__old_q_3_cy<11>_rt  (
    .I0(\watchdog/q [11]),
    .O(\watchdog/Madd__old_q_3_cy<11>_rt_25 )
  );
  defparam \watchdog/Madd__old_q_3_cy<10>_rt .INIT = 4'h2;
  LUT1 \watchdog/Madd__old_q_3_cy<10>_rt  (
    .I0(\watchdog/q [10]),
    .O(\watchdog/Madd__old_q_3_cy<10>_rt_26 )
  );
  defparam \watchdog/Madd__old_q_3_cy<9>_rt .INIT = 4'h2;
  LUT1 \watchdog/Madd__old_q_3_cy<9>_rt  (
    .I0(\watchdog/q [9]),
    .O(\watchdog/Madd__old_q_3_cy<9>_rt_27 )
  );
  defparam \watchdog/Madd__old_q_3_cy<8>_rt .INIT = 4'h2;
  LUT1 \watchdog/Madd__old_q_3_cy<8>_rt  (
    .I0(\watchdog/q [8]),
    .O(\watchdog/Madd__old_q_3_cy<8>_rt_28 )
  );
  defparam \watchdog/Madd__old_q_3_cy<7>_rt .INIT = 4'h2;
  LUT1 \watchdog/Madd__old_q_3_cy<7>_rt  (
    .I0(\watchdog/q [7]),
    .O(\watchdog/Madd__old_q_3_cy<7>_rt_29 )
  );
  defparam \watchdog/Madd__old_q_3_cy<6>_rt .INIT = 4'h2;
  LUT1 \watchdog/Madd__old_q_3_cy<6>_rt  (
    .I0(\watchdog/q [6]),
    .O(\watchdog/Madd__old_q_3_cy<6>_rt_30 )
  );
  defparam \watchdog/Madd__old_q_3_cy<5>_rt .INIT = 4'h2;
  LUT1 \watchdog/Madd__old_q_3_cy<5>_rt  (
    .I0(\watchdog/q [5]),
    .O(\watchdog/Madd__old_q_3_cy<5>_rt_31 )
  );
  defparam \watchdog/Madd__old_q_3_cy<4>_rt .INIT = 4'h2;
  LUT1 \watchdog/Madd__old_q_3_cy<4>_rt  (
    .I0(\watchdog/q [4]),
    .O(\watchdog/Madd__old_q_3_cy<4>_rt_32 )
  );
  defparam \watchdog/Madd__old_q_3_cy<3>_rt .INIT = 4'h2;
  LUT1 \watchdog/Madd__old_q_3_cy<3>_rt  (
    .I0(\watchdog/q [3]),
    .O(\watchdog/Madd__old_q_3_cy<3>_rt_33 )
  );
  defparam \watchdog/Madd__old_q_3_cy<2>_rt .INIT = 4'h2;
  LUT1 \watchdog/Madd__old_q_3_cy<2>_rt  (
    .I0(\watchdog/q [2]),
    .O(\watchdog/Madd__old_q_3_cy<2>_rt_34 )
  );
  defparam \watchdog/Madd__old_q_3_cy<1>_rt .INIT = 4'h2;
  LUT1 \watchdog/Madd__old_q_3_cy<1>_rt  (
    .I0(\watchdog/q [1]),
    .O(\watchdog/Madd__old_q_3_cy<1>_rt_35 )
  );
  defparam \watchdog/Madd__old_q_3_xor<15>_rt .INIT = 4'h2;
  LUT1 \watchdog/Madd__old_q_3_xor<15>_rt  (
    .I0(\watchdog/q [15]),
    .O(\watchdog/Madd__old_q_3_xor<15>_rt_36 )
  );
  defparam \watchdog/_old_q_4<15>2 .INIT = 16'h80A0;
  LUT4 \watchdog/_old_q_4<15>2  (
    .I0(\watchdog/_old_q_3 [15]),
    .I1(\watchdog/N51 ),
    .I2(\watchdog/N111 ),
    .I3(N284),
    .O(\watchdog/_old_q_4 [15])
  );
  defparam \watchdog/_old_q_4<0>1 .INIT = 16'h5111;
  LUT4 \watchdog/_old_q_4<0>1  (
    .I0(\watchdog/q [0]),
    .I1(\watchdog/_old_q_3 [15]),
    .I2(\watchdog/N11 ),
    .I3(\watchdog/N111 ),
    .O(\watchdog/_old_q_4 [0])
  );
  defparam \watchdog/_old_q_4<15>111_SW0 .INIT = 8'hFE;
  LUT3 \watchdog/_old_q_4<15>111_SW0  (
    .I0(\watchdog/_old_q_3 [6]),
    .I1(\watchdog/_old_q_3 [7]),
    .I2(\watchdog/_old_q_3 [8]),
    .O(N288)
  );
  defparam \controller/next_state_mux0000<6> .INIT = 16'h00AE;
  LUT4 \controller/next_state_mux0000<6>  (
    .I0(\controller/bit_reset_cmp_eq0000_14 ),
    .I1(\controller/mux0001_cmp_eq0009 ),
    .I2(\controller/mux0001_cmp_eq0010 ),
    .I3(N302),
    .O(\controller/next_state_mux0000 [6])
  );
  defparam \watchdog/_old_q_4<9>1 .INIT = 16'h222A;
  LUT4 \watchdog/_old_q_4<9>1  (
    .I0(\watchdog/_old_q_3 [9]),
    .I1(\watchdog/_old_q_3 [15]),
    .I2(\watchdog/_old_q_3 [14]),
    .I3(N304),
    .O(\watchdog/_old_q_4 [9])
  );
  defparam \watchdog/_old_q_4<8>1 .INIT = 16'h222A;
  LUT4 \watchdog/_old_q_4<8>1  (
    .I0(\watchdog/_old_q_3 [8]),
    .I1(\watchdog/_old_q_3 [15]),
    .I2(\watchdog/_old_q_3 [14]),
    .I3(N325),
    .O(\watchdog/_old_q_4 [8])
  );
  defparam \watchdog/_old_q_4<7>1 .INIT = 16'h222A;
  LUT4 \watchdog/_old_q_4<7>1  (
    .I0(\watchdog/_old_q_3 [7]),
    .I1(\watchdog/_old_q_3 [15]),
    .I2(\watchdog/_old_q_3 [14]),
    .I3(N304),
    .O(\watchdog/_old_q_4 [7])
  );
  defparam \watchdog/_old_q_4<6>2 .INIT = 16'h222A;
  LUT4 \watchdog/_old_q_4<6>2  (
    .I0(\watchdog/_old_q_3 [6]),
    .I1(\watchdog/_old_q_3 [15]),
    .I2(\watchdog/_old_q_3 [14]),
    .I3(N304),
    .O(\watchdog/_old_q_4 [6])
  );
  defparam \controller/next_state_mux0000<5>35 .INIT = 8'hF1;
  LUT3 \controller/next_state_mux0000<5>35  (
    .I0(\controller/data_ready_or0000_map5 ),
    .I1(\controller/data_ready_or0000_map2 ),
    .I2(N321),
    .O(\controller/next_state_mux0000 [5])
  );
  defparam \controller/packet_good_and0000_SW0_SW0 .INIT = 8'h96;
  LUT3 \controller/packet_good_and0000_SW0_SW0  (
    .I0(\shiftreg/q [20]),
    .I1(\controller/Mxor_packet_good_xor0002_xo [5]),
    .I2(\controller/Mxor_packet_good_xor0002_xo [4]),
    .O(N312)
  );
  defparam \controller/packet_good_and0000_SW0 .INIT = 16'h69FF;
  LUT4 \controller/packet_good_and0000_SW0  (
    .I0(\shiftreg/q [31]),
    .I1(\controller/Mxor_packet_good_xor0004_xo [5]),
    .I2(\controller/Mxor_packet_good_xor0004_xo [4]),
    .I3(N312),
    .O(N74)
  );
  defparam \watchdog/q_not00011 .INIT = 16'h7FFF;
  LUT4 \watchdog/q_not00011  (
    .I0(\watchdog/q_cmp_eq0000_map4 ),
    .I1(\watchdog/q_cmp_eq0000_map9 ),
    .I2(\watchdog/q_cmp_eq0000_map15 ),
    .I3(\watchdog/q_cmp_eq0000_map21 ),
    .O(\watchdog/q_not0001 )
  );
  defparam \controller/next_state_5__and00011 .INIT = 8'hC8;
  LUT3 \controller/next_state_5__and00011  (
    .I0(\controller/data_ready_or0000_map2 ),
    .I1(\controller/next_state_mux0000<5>_map10 ),
    .I2(\controller/data_ready_or0000_map5 ),
    .O(\controller/next_state_5__and0001 )
  );
  defparam \controller/next_state_5__and00001 .INIT = 8'h32;
  LUT3 \controller/next_state_5__and00001  (
    .I0(\controller/data_ready_or0000_map2 ),
    .I1(\controller/next_state_mux0000<5>_map10 ),
    .I2(\controller/data_ready_or0000_map5 ),
    .O(\controller/next_state_5__and0000 )
  );
  defparam \controller/next_state_8__and00011 .INIT = 8'hC8;
  LUT3 \controller/next_state_8__and00011  (
    .I0(\controller/data_ready_or0000_map2 ),
    .I1(\controller/next_state_mux0000 [8]),
    .I2(\controller/data_ready_or0000_map5 ),
    .O(\controller/next_state_8__and0001 )
  );
  defparam \controller/next_state_8__and00001 .INIT = 8'h32;
  LUT3 \controller/next_state_8__and00001  (
    .I0(\controller/data_ready_or0000_map2 ),
    .I1(\controller/next_state_mux0000 [8]),
    .I2(\controller/data_ready_or0000_map5 ),
    .O(\controller/next_state_8__and0000 )
  );
  defparam \controller/next_state_7__and00011 .INIT = 8'hC8;
  LUT3 \controller/next_state_7__and00011  (
    .I0(\controller/data_ready_or0000_map2 ),
    .I1(\controller/next_state_mux0000 [7]),
    .I2(\controller/data_ready_or0000_map5 ),
    .O(\controller/next_state_7__and0001 )
  );
  defparam \controller/next_state_7__and00001 .INIT = 16'h4CCC;
  LUT4 \controller/next_state_7__and00001  (
    .I0(\controller/mux0001_cmp_eq0009 ),
    .I1(\controller/data_ready_or0000 ),
    .I2(\controller/mux0001_cmp_eq0010 ),
    .I3(\controller/N14 ),
    .O(\controller/next_state_7__and0000 )
  );
  defparam \controller/next_state_6__and00011 .INIT = 8'hC8;
  LUT3 \controller/next_state_6__and00011  (
    .I0(\controller/data_ready_or0000_map2 ),
    .I1(\controller/next_state_mux0000 [6]),
    .I2(\controller/data_ready_or0000_map5 ),
    .O(\controller/next_state_6__and0001 )
  );
  defparam \controller/next_state_6__and00001 .INIT = 8'h32;
  LUT3 \controller/next_state_6__and00001  (
    .I0(\controller/data_ready_or0000_map2 ),
    .I1(\controller/next_state_mux0000 [6]),
    .I2(\controller/data_ready_or0000_map5 ),
    .O(\controller/next_state_6__and0000 )
  );
  defparam \controller/next_state_4__and00011 .INIT = 8'hC8;
  LUT3 \controller/next_state_4__and00011  (
    .I0(\controller/data_ready_or0000_map2 ),
    .I1(\controller/next_state_mux0000 [4]),
    .I2(\controller/data_ready_or0000_map5 ),
    .O(\controller/next_state_4__and0001 )
  );
  defparam \controller/next_state_4__and00001 .INIT = 8'h32;
  LUT3 \controller/next_state_4__and00001  (
    .I0(\controller/data_ready_or0000_map2 ),
    .I1(\controller/next_state_mux0000 [4]),
    .I2(\controller/data_ready_or0000_map5 ),
    .O(\controller/next_state_4__and0000 )
  );
  defparam \controller/next_state_3__and00011 .INIT = 8'hC8;
  LUT3 \controller/next_state_3__and00011  (
    .I0(\controller/data_ready_or0000_map2 ),
    .I1(\controller/next_state_mux0000 [3]),
    .I2(\controller/data_ready_or0000_map5 ),
    .O(\controller/next_state_3__and0001 )
  );
  defparam \controller/next_state_3__and00001 .INIT = 8'h32;
  LUT3 \controller/next_state_3__and00001  (
    .I0(\controller/data_ready_or0000_map2 ),
    .I1(\controller/next_state_mux0000 [3]),
    .I2(\controller/data_ready_or0000_map5 ),
    .O(\controller/next_state_3__and0000 )
  );
  defparam \controller/next_state_2__and00011 .INIT = 8'hC8;
  LUT3 \controller/next_state_2__and00011  (
    .I0(\controller/data_ready_or0000_map2 ),
    .I1(\controller/next_state_mux0000 [2]),
    .I2(\controller/data_ready_or0000_map5 ),
    .O(\controller/next_state_2__and0001 )
  );
  defparam \controller/next_state_2__and00001 .INIT = 8'h32;
  LUT3 \controller/next_state_2__and00001  (
    .I0(\controller/data_ready_or0000_map2 ),
    .I1(\controller/next_state_mux0000 [2]),
    .I2(\controller/data_ready_or0000_map5 ),
    .O(\controller/next_state_2__and0000 )
  );
  defparam \controller/next_state_1__and00001 .INIT = 16'h4050;
  LUT4 \controller/next_state_1__and00001  (
    .I0(\controller/mux0001_cmp_eq0000 ),
    .I1(\watchdog/timer_150us_done_10 ),
    .I2(\controller/data_ready_or0000 ),
    .I3(\controller/load_cmp_eq0000 ),
    .O(\controller/next_state_1__and0000 )
  );
  defparam \controller/mux0001_cmp_eq00091_SW0 .INIT = 16'hFFFE;
  LUT4 \controller/mux0001_cmp_eq00091_SW0  (
    .I0(\controller/state [3]),
    .I1(\controller/state [2]),
    .I2(\controller/state [4]),
    .I3(\controller/state [0]),
    .O(N60)
  );
  defparam \controller/next_state_mux0000<5>0 .INIT = 8'h80;
  LUT3 \controller/next_state_mux0000<5>0  (
    .I0(\controller/mux0001_cmp_eq0005 ),
    .I1(\controller/mux0001_cmp_eq0007_map4 ),
    .I2(\controller/mux0001_cmp_eq0007_map7 ),
    .O(\controller/next_state_mux0000<5>_map0 )
  );
  defparam \controller/next_state_mux0000<6>_SW0_SW0 .INIT = 16'hFFEF;
  LUT4 \controller/next_state_mux0000<6>_SW0_SW0  (
    .I0(\controller/error_no_ack_cmp_eq0000 ),
    .I1(\controller/mux0001_cmp_eq0002 ),
    .I2(\controller/N18 ),
    .I3(\controller/mux0001_cmp_eq0005 ),
    .O(N302)
  );
  MUXF5 \controller/next_state_mux0000<4>17  (
    .I0(N314),
    .I1(N315),
    .S(\controller/mux0001_cmp_eq0002 ),
    .O(\controller/next_state_mux0000 [4])
  );
  defparam \controller/next_state_mux0000<4>17_F .INIT = 16'h0008;
  LUT4 \controller/next_state_mux0000<4>17_F  (
    .I0(\controller/N18 ),
    .I1(\controller/mux0001_cmp_eq0005 ),
    .I2(\controller/error_no_ack_cmp_eq0000 ),
    .I3(\controller/mux0001_cmp_eq0006_17 ),
    .O(N314)
  );
  defparam \controller/next_state_mux0000<4>17_G .INIT = 8'h20;
  LUT3 \controller/next_state_mux0000<4>17_G  (
    .I0(\controller/N18 ),
    .I1(ps2_data_IBUF_2),
    .I2(\controller/mux0001_cmp_eq0003 ),
    .O(N315)
  );
  BUFGP clk_BUFGP (
    .I(clk),
    .O(clk_BUFGP_0)
  );
  BUFG reset_IBUF_BUFG (
    .I(reset_IBUF1),
    .O(reset_IBUF_3)
  );
  INV \watchdog/Madd__old_q_3_lut<0>_INV_0  (
    .I(\watchdog/q [0]),
    .O(\watchdog/N4 )
  );
  INV \watchdog/reset_inv1_INV_0  (
    .I(reset_IBUF1),
    .O(\watchdog/reset_inv )
  );
  defparam \controller/next_state_mux0000<2>1 .INIT = 16'h3310;
  LUT4 \controller/next_state_mux0000<2>1  (
    .I0(\controller/mux0001_cmp_eq0003 ),
    .I1(\controller/mux0001_cmp_eq0000 ),
    .I2(\controller/mux0001_cmp_eq0002 ),
    .I3(\controller/load_cmp_eq0000 ),
    .O(N316)
  );
  defparam \controller/next_state_mux0000<2>2 .INIT = 16'h0004;
  LUT4 \controller/next_state_mux0000<2>2  (
    .I0(\controller/mux0001_cmp_eq0000 ),
    .I1(\controller/mux0001_cmp_eq0002 ),
    .I2(\controller/load_cmp_eq0000 ),
    .I3(\controller/mux0001_cmp_eq0003 ),
    .O(N317)
  );
  MUXF5 \controller/next_state_mux0000<2>_f5  (
    .I0(N317),
    .I1(N316),
    .S(\watchdog/timer_150us_done_10 ),
    .O(\controller/next_state_mux0000 [2])
  );
  defparam \controller/mux0001_cmp_eq000311 .INIT = 8'h04;
  LUT3_D \controller/mux0001_cmp_eq000311  (
    .I0(bit_counter[4]),
    .I1(bit_counter[0]),
    .I2(bit_counter[2]),
    .LO(N319),
    .O(\controller/N17 )
  );
  defparam \controller/mux0001_cmp_eq00101 .INIT = 16'h1000;
  LUT4_D \controller/mux0001_cmp_eq00101  (
    .I0(bit_counter[1]),
    .I1(bit_counter[3]),
    .I2(\controller/N17 ),
    .I3(bit_counter[5]),
    .LO(N320),
    .O(\controller/mux0001_cmp_eq0010 )
  );
  defparam \controller/next_state_mux0000<5>26 .INIT = 16'hC888;
  LUT4_D \controller/next_state_mux0000<5>26  (
    .I0(\controller/next_state_mux0000<5>_map8 ),
    .I1(\controller/N4 ),
    .I2(\controller/mux0001_cmp_eq0006_17 ),
    .I3(\controller/next_state_mux0000<5>_map0 ),
    .LO(N321),
    .O(\controller/next_state_mux0000<5>_map10 )
  );
  defparam \controller/mux0001_cmp_eq0006_SW0 .INIT = 8'hBF;
  LUT3_L \controller/mux0001_cmp_eq0006_SW0  (
    .I0(bit_counter[0]),
    .I1(bit_counter[1]),
    .I2(bit_counter[2]),
    .LO(N231)
  );
  defparam \bit_counter_p/_old_q_6<1>133 .INIT = 16'h0302;
  LUT4_D \bit_counter_p/_old_q_6<1>133  (
    .I0(\bit_counter_p/_old_q_6<1>1_map1 ),
    .I1(reset_IBUF1),
    .I2(\controller/bit_reset_6 ),
    .I3(\bit_counter_p/_old_q_6<1>1_map5 ),
    .LO(N322),
    .O(N1)
  );
  defparam \controller/next_state_mux0000<3>_SW1 .INIT = 4'h8;
  LUT2_L \controller/next_state_mux0000<3>_SW1  (
    .I0(ps2_data_IBUF_2),
    .I1(\controller/mux0001_cmp_eq0003 ),
    .LO(N260)
  );
  defparam \watchdog/_old_q_4<15>111 .INIT = 16'h0001;
  LUT4_D \watchdog/_old_q_4<15>111  (
    .I0(\watchdog/_old_q_3 [6]),
    .I1(\watchdog/_old_q_3 [7]),
    .I2(\watchdog/_old_q_3 [9]),
    .I3(\watchdog/_old_q_3 [8]),
    .LO(N323),
    .O(\watchdog/N51 )
  );
  defparam \watchdog/_old_q_4<10>211 .INIT = 4'h1;
  LUT2_D \watchdog/_old_q_4<10>211  (
    .I0(\watchdog/_old_q_3 [14]),
    .I1(\watchdog/_old_q_3 [13]),
    .LO(N324),
    .O(\watchdog/N111 )
  );
  defparam \watchdog/_old_q_4<15>11_SW0 .INIT = 8'h80;
  LUT3_L \watchdog/_old_q_4<15>11_SW0  (
    .I0(\watchdog/_old_q_3 [10]),
    .I1(\watchdog/_old_q_3 [11]),
    .I2(\watchdog/_old_q_3 [12]),
    .LO(N284)
  );
  defparam \watchdog/_old_q_4<12>_SW0 .INIT = 16'h37FF;
  LUT4_L \watchdog/_old_q_4<12>_SW0  (
    .I0(\watchdog/_old_q_3 [9]),
    .I1(\watchdog/_old_q_3 [10]),
    .I2(N288),
    .I3(\watchdog/_old_q_3 [11]),
    .LO(N271)
  );
  defparam \watchdog/_old_q_4<11>_SW0 .INIT = 16'h37FF;
  LUT4_L \watchdog/_old_q_4<11>_SW0  (
    .I0(\watchdog/_old_q_3 [9]),
    .I1(\watchdog/_old_q_3 [10]),
    .I2(N288),
    .I3(\watchdog/_old_q_3 [12]),
    .LO(N273)
  );
  defparam \watchdog/_old_q_4<10>_SW0 .INIT = 16'h37FF;
  LUT4_L \watchdog/_old_q_4<10>_SW0  (
    .I0(\watchdog/_old_q_3 [9]),
    .I1(\watchdog/_old_q_3 [11]),
    .I2(N288),
    .I3(\watchdog/_old_q_3 [12]),
    .LO(N275)
  );
  defparam \watchdog/_old_q_4<9>1_SW0 .INIT = 16'hFF80;
  LUT4_D \watchdog/_old_q_4<9>1_SW0  (
    .I0(\watchdog/_old_q_3 [10]),
    .I1(\watchdog/_old_q_3 [11]),
    .I2(\watchdog/_old_q_3 [12]),
    .I3(\watchdog/_old_q_3 [13]),
    .LO(N325),
    .O(N304)
  );
endmodule


`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire PRLD;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

