library IEEE;
use IEEE.std_logic_1164.all;

entity seq_mult_TB is
end seq_mult_TB;

architecture seq_mult_TB_arch of seq_mult_TB is
component seq_mult
 port (
	I1 : in std_logic_vector(7 downto 0); --multiplicand, the one shifter
	I2 : in STD_LOGIC_VECTOR(7 downto 0); --multiplier. Remains constant throughout
	CLK : in std_logic;
	O: out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

SIGNAL CLK_i : STD_LOGIC := '1';
SIGNAL OUTPUT : STD_LOGIC_VECTOR(15 downto 0);
begin
	CLK_i <= NOT CLK_i after 10 ns;
	I1: seq_mult port map("01001000","00100011",CLK_i, OUTPUT); 

end seq_mult_TB_arch;