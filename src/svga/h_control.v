
module h_control(sys_clk,reset,co1,h_nblank,EndLine,hsync);
	input sys_clk,reset,co1;
	reg[1:0] state,next_state;
	output reg h_nblank,EndLine,hsync;
	
	parameter Hsynch = 2'b00;
	parameter Hbp    = 2'b01;
	parameter Hactice= 2'b10;
	parameter Hfp    = 2'b11;
	

	always @(posedge sys_clk)
	begin
		if(reset) state <= Hsynch;
		else state <= next_state;
	end
	
	always @(*)
	begin 
		case(state)
		Hsynch:
			begin 
				hsync<=0;h_nblank<=0;EndLine<=0;
				if(co1) next_state <= Hbp;
				else next_state <= Hsynch;
			end
		Hbp:
			begin
				hsync<=1;h_nblank<=0;EndLine<=0;
				if(co1)	next_state <= Hactice;
				else next_state <= Hbp;
			end
		Hactice:
			begin
				hsync<=1;h_nblank<=1;EndLine<=0;
				if(co1) next_state <= Hfp;
				else next_state <= Hactice;
			end
		Hfp:
			begin
				hsync<=1;h_nblank<=0;
				if(co1) begin EndLine<=1;next_state<=Hsynch; end
				else begin EndLine<=0;next_state<=Hfp; end
			end
		endcase
	end
endmodule