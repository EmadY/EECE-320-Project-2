

Library IEEE;
use ieee.std_logic_1164.all;

entity adder8bit_tb is
end adder8bit_tb;

architecture adder8bit_tb_arch of adder8bit_tb is
component adder8bit port (

a: in STD_LOGIC_VECTOR (7 downto 0);
b:	in STD_LOGIC_VECTOR (7 downto 0);
carryin: in STD_LOGIC;
sum:	out STD_LOGIC_VECTOR (7 downto 0);
carryout: out STD_LOGIC
);

end component;
signal a:	STD_LOGIC_VECTOR (7 downto 0):= "00000000";
signal b: STD_LOGIC_VECTOR (7 downto 0):= "00000000";
signal carryin:	STD_LOGIC := '0';
signal sum:	STD_LOGIC_VECTOR(7 downto 0);
signal carryout:	STD_LOGIC;
begin
UUT: adder8bit port map (a => a, b => b, carryin=> carryin, sum => sum, carryout => carryout);
process
begin


a <= "00000010"; wait for 10 ns;	b<= "00000000"; wait for 10 ns;
a <= "00000001"; wait for 10 ns;	b<= "01000000"; wait for 10 ns;
a <= "00000000"; wait for 10 ns;	b<= "01100000"; wait for 10 ns;
a <= "10000000"; wait for 10 ns;	b<= "01110000"; wait for 10 ns;
wait;
end process;
end adder8bit_tb_arch;







