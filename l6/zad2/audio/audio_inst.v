	audio u0 (
		.audio_ADCDAT  (<connected-to-audio_ADCDAT>),  //     audio.ADCDAT
		.audio_ADCLRCK (<connected-to-audio_ADCLRCK>), //          .ADCLRCK
		.audio_BCLK    (<connected-to-audio_BCLK>),    //          .BCLK
		.audio_DACDAT  (<connected-to-audio_DACDAT>),  //          .DACDAT
		.audio_DACLRCK (<connected-to-audio_DACLRCK>), //          .DACLRCK
		.audio_clk_clk (<connected-to-audio_clk_clk>), // audio_clk.clk
		.av_i2c_SDAT   (<connected-to-av_i2c_SDAT>),   //    av_i2c.SDAT
		.av_i2c_SCLK   (<connected-to-av_i2c_SCLK>),   //          .SCLK
		.clk_clk       (<connected-to-clk_clk>),       //       clk.clk
		.reset_reset_n (<connected-to-reset_reset_n>)  //     reset.reset_n
	);

