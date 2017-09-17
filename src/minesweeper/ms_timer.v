module ms_timer(/*autoport*/
//output
			q,
//input
			clk,
			clr,
			start,
			stop);
	parameter N=600,BIT=10;
	input clk,clr,start,stop;
	output[BIT-1:0] q;
	reg[BIT-1:0] q=0;
	reg state=0;
	always @(posedge clk) begin
		if (clr) begin
			q=0;
			state=0;
		end
		else begin
			case(state)
				0: begin
					if(start) begin
						state=1;
						q=0;
					end
					else begin
						state=0;
						q=q;
					end
				end
				1: begin
					if(stop) begin
						state=0;
						q=q;
					end
					else begin
						state=1;
						if(q==N) begin
							q=0;
						end
						else begin
							q=q+1;
						end
					end
				end
			endcase
		end
	end
endmodule