	component lab3_sys is
		port (
			clk_clk       : in  std_logic                    := 'X'; -- clk
			reset_reset_n : in  std_logic                    := 'X'; -- reset_n
			seg0_export   : out std_logic_vector(3 downto 0);        -- export
			seg1_export   : out std_logic_vector(3 downto 0);        -- export
			seg2_export   : out std_logic_vector(3 downto 0)         -- export
		);
	end component lab3_sys;

	u0 : component lab3_sys
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --   clk.clk
			reset_reset_n => CONNECTED_TO_reset_reset_n, -- reset.reset_n
			seg0_export   => CONNECTED_TO_seg0_export,   --  seg0.export
			seg1_export   => CONNECTED_TO_seg1_export,   --  seg1.export
			seg2_export   => CONNECTED_TO_seg2_export    --  seg2.export
		);

