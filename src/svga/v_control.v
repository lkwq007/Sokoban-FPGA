module v_control(sys_clk,reset,co2,EndLine,v_nblank,vsync,EndFrame );

	input sys_clk,reset,co2,EndLine;
	output reg v_nblank,EndFrame,vsync;
	
	reg[1:0] state,next_state;
	
	parameter Vsynch = 2'b00;
	parameter Vbp    = 2'b01;
	parameter Vactice= 2'b10;
	parameter Vfp    = 2'b11;
	
	always @(posedge sys_clk)
	begin 
		if(reset) state <= Vsynch;
		else state <= next_state;
	end
	
	always @(*)
	begin
		case(state)
		Vsynch:
			begin
				vsync<=0;v_nblank<=0;EndFrame<=0;
				if(co2&&EndLine) next_state <= Vbp;
				else next_state <= Vsynch;
			end
		Vbp:
			begin
				vsync<=1;v_nblank<=0;EndFrame<=0;
				if(co2&&EndLine) next_state <= Vactice;
				else next_state <= Vbp;
			end
		Vactice:
			begin
				vsync<=1;v_nblank<=1;EndFrame<=0;
				if(co2&&EndLine) next_state <= Vfp;
				else next_state <= Vactice;
			end
		Vfp:
			begin
				vsync<=1;v_nblank<=0;
				if(EndLine) begin EndFrame<=1;next_state<=Vsynch; end
				else begin EndFrame<=0;next_state<=Vfp; end
			end
		endcase
	end
endmodule 