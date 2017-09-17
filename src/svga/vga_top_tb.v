`timescale 1ns/100ps

module svga_top_tb;

	reg			   clk	;
	reg			   reset_n	;
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
	   reset_n = 1;
	   repeat (3) @(posedge pixel_clk);
	   reset_n = 0;
     end

	svga_top svga_top (
		.clk	(clk			),
		.reset_n		(reset_n			),
		.sys_clk	(pixel_clk		),
		.hsync		(hsync			),
		.vsync		(vsync			),
		.vga_comp_synch	(vga_comp_synch	),
		.vga_blank_z(vga_blank_z),
		.red		(red			),
		.blue		(blue			),
		.green	(green			)	);
	integer frame_num;
	integer file_rgb;
	initial begin
	frame_num = 0;
		file_rgb  = $fopen("rgb.rgb24","wb");
		while (1) 
		  begin
		   @(posedge pixel_clk);
			if (vga_blank_z==1)
			  begin
				WRITE_BYTE(blue,file_rgb);
			   WRITE_BYTE(green,file_rgb);
			   WRITE_BYTE(red,file_rgb);
			   end
			if (svga_top_tb.svga_top.vga_ctrl.EndLine==1) 
   			  begin
				///if (svga_tb.svga_top_inst.svga_ctrl_inst.nblank==1)
				$display("Line %d",svga_top_tb.svga_top.vga_ctrl.y_pos);
			   if (svga_top_tb.svga_top.vga_ctrl.EndFrame==1)
					begin frame_num = frame_num + 1;end
			  end
				
			if ((frame_num == 2) && (svga_top_tb.svga_top.vga_ctrl.EndFrame==1)) 
						
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
