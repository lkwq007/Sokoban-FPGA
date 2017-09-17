// ref: https://stackoverflow.com/questions/28586384/lsfr-counter-for-random-number
module fibonacci_lfsr(/*autoport*/
//output
			random,
//input
			clk,
			rst);
	parameter POLYNOMIAL=4'h9,N=4,BITS=2;
	input clk,rst;
	output[BITS-1:0] random;
	(* OPTIMIZE="OFF" *)  
	reg[N-1:0] data;/* synthesis keep */
	(* OPTIMIZE="OFF" *)  
	reg[N-1:0] data_next;/* synthesis keep */
	reg feedback;
	integer i;
	assign random=data[N-1:N-BITS];
	always @(*) begin
		data_next=data;
		// Compiler unrolls the loop, calculating the transition matrix
		for(i=0;i<BITS;i=i+1) begin
		feedback=^(POLYNOMIAL&data_next);
		data_next={data_next[N-2:0],~feedback};
		end
	end

	always @(posedge clk) begin
		if(rst) begin
			data<='b0;
		end
		else begin
			data<=data_next;
		end
	end
endmodule