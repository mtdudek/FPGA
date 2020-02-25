
module audio (
	audio_ADCDAT,
	audio_ADCLRCK,
	audio_BCLK,
	audio_DACDAT,
	audio_DACLRCK,
	audio_clk_clk,
	av_i2c_SDAT,
	av_i2c_SCLK,
	clk_clk,
	reset_reset_n);	

	input		audio_ADCDAT;
	input		audio_ADCLRCK;
	input		audio_BCLK;
	output		audio_DACDAT;
	input		audio_DACLRCK;
	output		audio_clk_clk;
	inout		av_i2c_SDAT;
	output		av_i2c_SCLK;
	input		clk_clk;
	input		reset_reset_n;
endmodule
