module ms_controller_tb();
	reg[63:0] mine=0;
	reg gen_done,clk,reset,retry,left,right,game_area,mid;
	reg[5:0] cursor;
	wire[63:0] check,open,doubt,flag;
	wire[63:0] is_zero;
	wire[5:0] error;
	wire[3:0] state;
	wire gen_reset,win,lose;
	wire[255:0] count_mine,count_flag;
	wire[63:0] quick,open_quick;
	wire clr,start,stop;
	ms_controller uut(/*autoport*/
//output
flag,
			doubt,
			open,
			gen_reset,
			win,
			lose,
			start,
			stop,
			clr,
			state,
//input
			gen_done,
			clk,
			reset,
			retry,
			left,
			right,
			game_area,
			mid,
			cursor,
			mine,
			check,
			quick,
			open_quick);
	ms_round counter_mine(.mine(mine),.count_flat(count_mine),.is_zero(is_zero));
	ms_round counter_flag(.mine(flag),.count_flat(count_flag),.is_zero());
	ms_round_check checker(.check(check),.is_zero(is_zero),.open(open));
	ms_round_quick quick_update(.quick(quick),.open_quick(open_quick),.open(open),.cursor(cursor),.count_flag(count_flag),.count_mine(count_mine));
	reg[2:0] count[63:0];
	integer i;
	always @(count_flag) begin
		for(i=0;i<64;i=i+1) begin
			count[i]={count_flag[i],count_flag[i+64],count_flag[i+128]};
		end
	end
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
		mid=0;
		reset=1;
		game_area=1;
		gen_done=0;
		retry=0;
		left=0;
		right=0;
		cursor=6'o77;
		mine=0;
		@(posedge clk);
		@(posedge clk);
		reset=0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		mine=64'b10001001;
		@(posedge clk);
		gen_done=1;
		@(posedge clk);
		@(posedge clk);
		right=1;
		@(posedge clk);
		@(posedge clk);
		left=1;
		@(posedge clk);
		@(posedge clk);
		left=0;
		@(posedge clk);
		@(posedge clk);
		left=1;
		@(posedge clk);
		@(posedge clk);
		left=0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		right=0;
		@(posedge clk);
		cursor=6'o22;
		left=1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		cursor=6'o77;
		left=0;
		right=1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		left=1;
		right=0;
		@(posedge clk);
		left=0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		left=1;
		@(posedge clk);
		repeat(20) begin
			@(posedge clk);
		end
		cursor=7;
		repeat(20) begin
			@(posedge clk);
		end
		reset=1;
		$stop;
		@(posedge clk);
		reset=0;
		mine=64'b10111111;
		cursor=6'o06;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		left=0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		right=1;
		cursor=6'o07;
		@(posedge clk);
		@(posedge clk);
		cursor=6'o05;
		@(posedge clk);
		@(posedge clk);
		right=0;
		mid=1;
		cursor=6'o06;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		reset=1;
		mid=0;
		$stop;
		@(posedge clk);
		reset=0;
		left=1;
		mine=64'b10111111;
		cursor=6'o06;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		left=0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		right=1;
		cursor=6'o17;
		@(posedge clk);
		@(posedge clk);
		cursor=6'o15;
		@(posedge clk);
		@(posedge clk);
		right=0;
		mid=1;
		cursor=6'o06;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		$stop;
	end
endmodule