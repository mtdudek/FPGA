	component Memory_test is
		port (
			clk_clk          : in  std_logic                     := 'X';             -- clk
			reset_reset_n    : in  std_logic                     := 'X';             -- reset_n
			world_hex_screen : out std_logic_vector(41 downto 0);                    -- hex_screen
			world_ledr       : out std_logic_vector(9 downto 0);                     -- ledr
			world_key_input  : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- key_input
			world_switches   : in  std_logic_vector(9 downto 0)  := (others => 'X')  -- switches
		);
	end component Memory_test;

	u0 : component Memory_test
		port map (
			clk_clk          => CONNECTED_TO_clk_clk,          --   clk.clk
			reset_reset_n    => CONNECTED_TO_reset_reset_n,    -- reset.reset_n
			world_hex_screen => CONNECTED_TO_world_hex_screen, -- world.hex_screen
			world_ledr       => CONNECTED_TO_world_ledr,       --      .ledr
			world_key_input  => CONNECTED_TO_world_key_input,  --      .key_input
			world_switches   => CONNECTED_TO_world_switches    --      .switches
		);

