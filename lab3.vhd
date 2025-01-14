library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity lab3 is
    port (
        clk      : in  std_logic := '0';    -- Horloge
        reset_n  : in  std_logic := '0';    -- initialisation
        pio_0 : out std_logic_vector(6 downto 0);  -- Afficheur 7 segments
		  pio_1 : out std_logic_vector(6 downto 0);  -- Afficheur 7 segments
		  pio_2 : out std_logic_vector(6 downto 0)  -- Afficheur 7 segments
    );
end entity lab3;   

architecture rtl of lab3 is

    component lab3_sys is
        port (
            clk_clk       : in  std_logic                    := 'X'; -- clk
            seg1_export   : out std_logic_vector(3 downto 0);        -- export
            reset_reset_n : in  std_logic                    := 'X'; -- reset_n
            seg0_export   : out std_logic_vector(3 downto 0);        -- export
            seg2_export   : out std_logic_vector(3 downto 0)         -- export
        );
    end component lab3_sys;
	 
	 
	 
	 component bcd_2_seg is
        port (
            input  : in  std_logic_vector(3 downto 0) := (others => 'X');  
            output : out std_logic_vector(6 downto 0)                      -- Sortie 7 segments
        );
    end component bcd_2_seg;
	 
	signal connection0 : std_logic_vector(3 downto 0);
	signal connection1 : std_logic_vector(3 downto 0);
	signal connection2 : std_logic_vector(3 downto 0);
	 
	 
	 
begin

    u0 : component lab3_sys
        port map (
            clk_clk       => clk,       --   clk.clk
            seg1_export   => connection0,   --  seg1.export
            reset_reset_n => reset_n, -- reset.reset_n
            seg0_export   => connection1,   --  seg0.export
            seg2_export   => connection2    --  seg2.export
        );

		  
	u1 : component bcd_2_seg
        port map (
            input  => connection0,     
            output => pio_0  -- Sortie vers l'afficheur 7 segments
        );
		  
	u2 : component bcd_2_seg
        port map (
            input  => connection1,     
            output => pio_1  -- Sortie vers l'afficheur 7 segments
        );
		  
	u3 : component bcd_2_seg
        port map (
            input  => connection2,     
            output => pio_2  -- Sortie vers l'afficheur 7 segments
        );

end architecture;

