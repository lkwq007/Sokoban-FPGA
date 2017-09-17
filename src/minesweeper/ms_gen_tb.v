//==================================================================================================
//  Filename      : ms_gen_tb.v
//  Created On    : 2017-07-13 23:08:07
//  Last Modified : 2017-07-13 23:37:48
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmail.com or i@llonely.com
//
//  Description   : 
//
//
//==================================================================================================
module ms_gen_tb();
	reg clk=0,reset=0;
	reg[5:0] rand=0;
	wire[63:0] mine;
	wire gen_done;
	ms_gen gen(.mine(mine),.gen_done(gen_done),.clk(clk),.reset(reset),.rand(rand));
	initial begin
		#10
		clk=0;
		rand=$urandom%64;
		forever begin
			#200
			clk=~clk;
		end
	end
	initial begin
		#10
		reset=1;
		@(posedge clk);
		@(posedge clk);
		reset=0;
		repeat(100) begin
			@(posedge clk);
			rand=$urandom%64;
		end
		$stop;
	end
endmodule