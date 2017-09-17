module fibonacci_lfsr_tb();
	reg clk=0;
	reg rst=0;
	initial begin
		#10;
		clk = 0;
		forever begin
			#400;
			clk = ~clk;
		end
	end
	
	initial begin
		$dumpfile("dump.vcd"); $dumpvars;
		#10;
		rst = 1'b1;
		@(posedge clk);
		@(posedge clk);
		rst = 1'b0;
		repeat(32)
			 @(posedge clk);
		
		$stop;
	end
	wire[3:0] rand1,rand2;
	fibonacci_lfsr #(.N(10),.BITS(4))u_fibonacci_lfsr1(.clk(clk),.rst(rst),.random(rand1));
	fibonacci_lfsr #(.N(16),.BITS(4))u_fibonacci_lfsr2(.clk(clk),.rst(rst),.random(rand2));
endmodule