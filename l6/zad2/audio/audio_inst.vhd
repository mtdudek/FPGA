	component audio is
		port (
			audio_ADCDAT  : in    std_logic := 'X'; -- ADCDAT
			audio_ADCLRCK : in    std_logic := 'X'; -- ADCLRCK
			audio_BCLK    : in    std_logic := 'X'; -- BCLK
			audio_DACDAT  : out   std_logic;        -- DACDAT
			audio_DACLRCK : in    std_logic := 'X'; -- DACLRCK
			audio_clk_clk : out   std_logic;        -- clk
			av_i2c_SDAT   : inout std_logic := 'X'; -- SDAT
			av_i2c_SCLK   : out   std_logic;        -- SCLK
			clk_clk       : in    std_logic := 'X'; -- clk
			reset_reset_n : in    std_logic := 'X'  -- reset_n
		);
	end component audio;

	u0 : component audio
		port map (
			audio_ADCDAT  => CONNECTED_TO_audio_ADCDAT,  --     audio.ADCDAT
			audio_ADCLRCK => CONNECTED_TO_audio_ADCLRCK, --          .ADCLRCK
			audio_BCLK    => CONNECTED_TO_audio_BCLK,    --          .BCLK
			audio_DACDAT  => CONNECTED_TO_audio_DACDAT,  --          .DACDAT
			audio_DACLRCK => CONNECTED_TO_audio_DACLRCK, --          .DACLRCK
			audio_clk_clk => CONNECTED_TO_audio_clk_clk, -- audio_clk.clk
			av_i2c_SDAT   => CONNECTED_TO_av_i2c_SDAT,   --    av_i2c.SDAT
			av_i2c_SCLK   => CONNECTED_TO_av_i2c_SCLK,   --          .SCLK
			clk_clk       => CONNECTED_TO_clk_clk,       --       clk.clk
			reset_reset_n => CONNECTED_TO_reset_reset_n  --     reset.reset_n
		);

