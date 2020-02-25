
module Memory_test (
	clk_clk,
	reset_reset_n,
	world_hex_screen,
	world_ledr,
	world_key_input,
	world_switches);	

	input		clk_clk;
	input		reset_reset_n;
	output	[41:0]	world_hex_screen;
	output	[9:0]	world_ledr;
	input	[3:0]	world_key_input;
	input	[9:0]	world_switches;
endmodule
