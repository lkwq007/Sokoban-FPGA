`timescale 1ns/100ps

module top_tb;

	reg			   clk	;
	reg			   reset_n	;
	wire ps2_data,ps2_clk;
	reg ps2_data_key,ps2_clk_key;
	wire		   pixel_clk;
	wire					hsync			;	  // horizontal sync signal
	wire					vsync			;	  // virtical sync signal
	wire					vga_comp_synch	;
	wire					vga_blank_z	;

	wire [7:0] 	red;
	wire [7:0] 	green;
	wire [7:0] 	blue;
	
	
	initial 
	  begin
		 clk = 0;
		 forever #5 clk = ~clk;
	 end

	initial 
     begin
	   reset_n = 0;
	   repeat (3) @(posedge pixel_clk);
	   reset_n = 1;
     end

top uut(/*autoport*/
			.ps2_data(ps2_data),
			.ps2_clk(ps2_clk),
			.ps2_data_key(ps2_data_key),
			.ps2_clk_key(ps2_clk_key),
			.red(red),
			.green(green),
			.blue(blue),
			.pixel_clk(pixel_clk),
			.vga_comp_synch(vga_comp_synch),
			.vga_blank_z(vga_blank_z),
			.hsync(hsync),
			.vsync(vsync),
			.clk(clk),
			.reset_n(reset_n));
	integer frame_num;
	integer file_rgb;
	initial begin
	frame_num = 0;
	ps2_clk_key=0;
	ps2_data_key=0;
	repeat (2) @(posedge pixel_clk);
		file_rgb  = $fopen("rgb.rgb24","wb");
		while (1) 
		  begin
		   @(posedge pixel_clk);
			if (vga_blank_z==1&&frame_num == 1)
			  begin
				WRITE_BYTE(blue,file_rgb);
			   WRITE_BYTE(green,file_rgb);
			   WRITE_BYTE(red,file_rgb);
			   end
			if (top_tb.uut.vga_ctrl.EndLine==1) 
   			  begin
				///if (svga_tb.svga_top_inst.svga_ctrl_inst.nblank==1)
				$display("Line %d",top_tb.uut.vga_ctrl.y_pos);
			   if (top_tb.uut.vga_ctrl.EndFrame==1)
					begin frame_num = frame_num + 1;end
			  end
				
			if ((frame_num == 2) && (top_tb.uut.vga_ctrl.EndFrame==1)) 
						
			 begin
				$fclose(file_rgb);
				$stop;
			 end
		end
	end
	
	task WRITE_BYTE;
	input [7:0] data;
	input integer file_ptr;
	
	//integer pos;
	begin
		$fwriteb(file_ptr,"%s",data);
	end
endtask

	endmodule
