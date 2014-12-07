library IEEE;
use IEEE.std_logic_1164.all;


entity clk_t_tb is
end entity;

architecture clk_t_tb_arch of clk_t_tb is
component  clock_test_element is
	port(
		CLK: IN STD_LOGIC;
		qout1 :  out STD_LOGIC_VECTOR (3 downto 0);
		qout2 :  out STD_LOGIC_VECTOR (3 downto 0);
		qout3 :  out STD_LOGIC_VECTOR (3 downto 0);
		qout4 :  out STD_LOGIC_VECTOR (3 downto 0)
		
	);
end component;
signal iCLK: STD_LOGIC := '1';
signal q1,q2,q3,q4 : std_logic_vector(3 downto 0);
begin

t: clock_test_element port map (iCLK,q1,q2,q3,q4);

iclk <= not iclk after 10 ns;

end clk_t_tb_arch;


