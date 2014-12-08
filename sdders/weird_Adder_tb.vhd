library IEEE;
use IEEE.std_logic_1164.all;


entity weird_adder_tb is
end entity;

architecture weird_adder_tb_arch of weird_adder_tb is
        component weird_adder is
  port(clk: in std_logic;
	 mi : in std_logic_vector (7 downto 0);
	si : in std_logic_vector (7 downto 0);
	o : out std_logic_vector (7 downto 0);
	co: out std_logic
	
	
);
end component;


 
	
	signal mi_tb : std_logic_vector (7 downto 0) := "00000000";
	signal si_tb : std_logic_vector (7 downto 0):= "00000010";
	signal o_tb : std_logic_vector (7 downto 0);
	
	signal co_tb : std_logic;
	signal clk_tb : std_logic :='1';
	
        begin
            T: weird_adder port map(clk_tb,mi_tb,si_tb,o_tb,co_tb);
	

			CLK_tb <= NOT CLK_tb after 10 ns;

		
				
end weird_adder_tb_arch;
