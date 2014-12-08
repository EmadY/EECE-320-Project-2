library IEEE;
use IEEE.std_logic_1164.all;


entity register_tb is
end entity;

architecture register_tb_arch of register_tb is
        component sregister is
  port( CLK,input,shift,reset: in std_logic; output : out std_logic; pout : out std_logic_vector(7 downto 0));
end component;
	
	signal pout_tb: STD_LOGIC_vector (7 downto 0);
	signal CLK_tb : std_logic := '1';
	signal output_tb:std_logic;

	
        begin
            T: sregister port map(clk_tb,'1','1','0',output_tb,pout_tb);
			CLK_tb <= NOT CLK_tb after 10 ns;
		
				
end register_tb_arch;
