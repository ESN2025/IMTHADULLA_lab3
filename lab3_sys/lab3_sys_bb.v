
module lab3_sys (
	clk_clk,
	reset_reset_n,
	seg0_export,
	seg1_export,
	seg2_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[3:0]	seg0_export;
	output	[3:0]	seg1_export;
	output	[3:0]	seg2_export;
endmodule
