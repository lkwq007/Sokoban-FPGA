 module vga_top(
	clk,reset_n,display_mode,
	sys_clk,hsync,vsync,vga_comp_synch,vga_blank_z,
	red,green,blue
);

	input clk,reset_n,display_mode;
	output hsync,vsync,vga_comp_synch,vga_blank_z;
	output [7:0] red,green,blue;
	
	output wire sys_clk;
	wire [9:0] x_pos,y_pos;
	
	VgaDCM VgaDCM(
	.CLKIN_IN(clk),
	.CLKDV_OUT(sys_clk),
	.CLKIN_IBUFG_OUT(),
	.CLK0_OUT(),
	.LOCKED_OUT());
	
	vga_ctrl vga_ctrl(
	.sys_clk(sys_clk),
	.reset(~reset_n),
	.hsync(hsync),
	.vsync(vsync),
	.vga_blank_z(vga_blank_z),
	.EndFrame(EndFrame),
	.x_pos(x_pos),
	.y_pos(y_pos));
	
	vga_data vga_data(
	.display_mode(display_mode),
	.x_pos(x_pos),
	.y_pos(y_pos),
	.red(red),
	.green(green),
	.blue(blue));
endmodule