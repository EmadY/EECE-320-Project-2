library IEEE;
use IEEE.std_logic_1164.all;

entity weird_adder is port(
		CLK: IN STD_LOGIC;
		MI: IN STD_LOGIC_VECTOR(7 downto 0);
		SI: IN STD_LOGIC_VECTOR(7 downto 0);
		O: OUT STD_LOGIC_VECTOR(7 downto 0);
		CO: OUT STD_LOGIC
	);
end weird_adder;

architecture weird_adder_arch of weird_adder is
component adder8bit is
	port (
		a: in STD_LOGIC_VECTOR (7 downto 0);
		b:	in STD_LOGIC_VECTOR (7 downto 0);
		carryin: in STD_LOGIC;
		sum:	out STD_LOGIC_VECTOR (7 downto 0);
		carryout: out STD_LOGIC
	); 
end component;
 component enabled_buffer is --enable buffer
	port(I: IN STD_LOGIC_VECTOR(7 downto 0);
		 E: IN STD_LOGIC;
		 O: OUT STD_LOGIC_VECTOR(7 downto 0)
		 );
 end component;

signal Enabled_SI: STD_LOGIC_VECTOR(7 downto 0);
signal Enable: STD_LOGIC := '0';
begin

process(CLK) begin
if(CLK'event AND CLK = '1') then
	Enable <= '1';
end if;
end process;

p1: enabled_buffer port map(SI, Enable, Enabled_SI);
p2: adder8bit port map(MI, Enabled_SI, '0', O, CO);

end weird_adder_arch;