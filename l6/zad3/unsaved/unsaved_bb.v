
module unsaved (
	clk_clk,
	reset_reset_n,
	avalon_master_memory_0_conduit_end_id10xled,
	avalon_master_memory_0_conduit_end_id6xhexscreen,
	avalon_master_memory_0_conduit_end_id10xswitch,
	avalon_master_memory_0_conduit_end_id4xkey);	

	input		clk_clk;
	input		reset_reset_n;
	output	[9:0]	avalon_master_memory_0_conduit_end_id10xled;
	output	[41:0]	avalon_master_memory_0_conduit_end_id6xhexscreen;
	input	[9:0]	avalon_master_memory_0_conduit_end_id10xswitch;
	input	[3:0]	avalon_master_memory_0_conduit_end_id4xkey;
endmodule
