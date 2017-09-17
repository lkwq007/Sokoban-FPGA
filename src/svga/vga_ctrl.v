module vga_ctrl(sys_clk,reset,x_pos,y_pos,
nblank,EndFrame,vsync,hsync,vga_blank_z,vga_comp_synch);

	input sys_clk,reset;
	output [9:0] x_pos,y_pos;
	output nblank,EndFrame,hsync,vsync,vga_blank_z,vga_comp_synch;
	
	wire co1,co2;
	wire h_nblank,v_nblank,EndLine;
		
	x_pos x_pos_counter(
	.sys_clk(sys_clk),
	.reset(reset),
	.x_pos(x_pos),
	.co1(co1));
	
	y_pos y_pos_counter(
	.sys_clk(sys_clk),
	.reset(reset),
	.EndLine(EndLine),
	.y_pos(y_pos),
	.co2(co2));
	
	h_control h_control(
	.sys_clk(sys_clk),
	.reset(reset),
	.co1(co1),
	.h_nblank(h_nblank),
	.EndLine(EndLine),
	.hsync(hsync));
	
	v_control v_control(
	.sys_clk(sys_clk),
	.reset(reset),
	.co2(co2),
	.EndLine(EndLine),
	.v_nblank(v_nblank),
	.vsync(vsync),
	.EndFrame(EndFrame));
	
	assign nblank = h_nblank&&v_nblank;
	assign vga_blank_z=h_nblank&&v_nblank;
	assign vga_comp_synch=1;
	
endmodule 