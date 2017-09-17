module ms_top(/*autoport*/
//output
			flag,
			doubt,
			open,
			mine,
			win,
			lose,
			count_mine,
//input
			clk,
			left,
			right,
			game_area,
			retry,
			reset,
			cursor);
	output[63:0] flag,doubt,open,mine;
	output win,lose;
	output[255:0] count_mine;
	wire[63:0] quick,open_quick;
	wire[255:0] count_flag;
	input clk,left,right,game_area,retry,reset;
	input[5:0] cursor;
	wire[5:0] rand;
	wire[63:0] check,is_zero,open;
	wire[9:0] time_use;
	wire clr,start,stop,gen_done,gen_reset;
	wire clk_1s;

	ms_controller ms_game(
		.flag(flag),
		.doubt(doubt),
		.open(open),
		.gen_reset(gen_reset),
		.win(win),
		.lose(lose),
		.start(start),
		.stop(stop),
		.clr(clr),
		.gen_done(gen_done),
		.clk(clk),
		.reset(reset),
		.retry(retry),
		.left(left),
		.right(right),
		.mid(left&right),
		.game_area(game_area),
		.cursor(cursor),
		.mine(mine),
		.check(check),
		.quick(quick),
		.open_quick(open_quick));
	ms_timer timer(
		.q(time_use),
		.clk(clk),
		.clr(clr),
		.stop(stop),
		.start(start));
	ms_round counter_mine(
		.mine(mine),
		.count_flat(count_mine),
		.is_zero(is_zero));
	ms_round counter_flag(
		.mine(flag),
		.count_flat(count_flag),
		.is_zero());
	ms_round_quick quick_update(
		.quick(quick),
		.open_quick(open_quick),
		.open(open),
		.cursor(cursor),
		.count_flag(count_flag),
		.count_mine(count_mine));
	ms_round_check checker(
		.check(check),
		.is_zero(is_zero),
		.open(open));
	ms_gen gen(
		.mine(mine),
		.gen_done(gen_done),
		.reset(gen_reset),
		.clk(clk),
		.rand(rand)
		);
/*	fibonacci_lfsr #(.N(6),.BITS(6)) lfsr(
		.clk(clk),
		.rst(reset),
		.random(rand));*/
	/*wire[15:0] rand_out;
	ring_counter random(.clk(clk),.rst(reset),.out(rand_out));
	assign rand=rand_out[5:0]+rand_out[11:6]+{rand_out[3],rand_out[9],rand_out[15:12]};*/
	LFSR_Plus random(.clk(clk),.n_reset(~reset),.enable(1'b1),.u_noise_out(rand),.g_noise_out());

endmodule