//==================================================================================================
//  Filename      : ms_gen_tb.v
//  Created On    : 2017-07-13 23:08:07
//  Last Modified : 2017-07-19 12:09:28
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : 
//
//
//==================================================================================================
module ms_gen_lfsr_tb();
	reg clk=0,reset=0,resetr=0;
	wire[5:0] rand;
	wire[63:0] mine;
	wire gen_done;
	ms_gen gen(.mine(mine),.gen_done(gen_done),.clk(clk),.reset(reset),.rand(rand));
	LFSR_Plus random(.clk(clk),.n_reset(~resetr),.enable(1'b1),.u_noise_out(rand),.g_noise_out());
	initial begin
		#10
		clk=0;
		forever begin
			#200
			clk=~clk;
		end
	end
	initial begin
		#10
		resetr=1;
		reset=1;
		@(posedge clk);
		@(posedge clk);
		resetr=0;
		repeat(50) begin
			@(posedge clk);
		end
		reset=0;
		repeat(100) begin
			@(posedge clk);
		end
		$stop;
	end
endmodule