module switch(/*autoport*/
//output
			switch_reset,
			switch_sel,
			win,
			lose,
//input
			key_switch,
			clk,
			reset,
			win_s,
			win_m,
			lose_s,
			lose_m); 
	input key_switch,clk,reset,win_s,win_m,lose_s,lose_m;
	output switch_reset,switch_sel,win,lose;
	reg[1:0] state;
	assign switch_sel=(state==2);
	assign switch_reset=(state==1||state==3);
/* // can not work
   wire win,lose;
	assign win=switch_sel?win_m:win_s;
	assign lose=switch_sel?lose_m:lose_s;*/
	reg win=0,lose=0;
	always @(*) begin
		if(switch_sel) begin
			win<=win_m;
			lose<=lose_m;
		end
		else begin
			win<=win_s;
			lose<=lose_s;
		end
	end
	always @(posedge clk) begin
		if (reset) begin
			state=0;
		end
		else begin
			case(state)
				0: begin
					if(key_switch) begin
						state=1;
					end
					else begin
						state=0;
					end
				end
				1: begin
					state=2;
				end
				2: begin
					if(key_switch) begin
						state=3;
					end
					else begin
						state=2;
					end
				end
				3: begin
					state=0;
				end
			endcase
		end
	end
endmodule