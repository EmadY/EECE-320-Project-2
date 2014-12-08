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

process(CLK,Enable) begin
if(CLK'event AND CLK = '1') then
	Enable <= '1';
else Enable <= '0';
end if;
end process;

--p1: enabled_buffer port map(SI, Enable, Enabled_SI);
p2: adder8bit port map(MI, Enabled_SI, '0', O, CO);

Enabled_SI (7) <= SI(7) and Enable;
	Enabled_SI (6) <= SI(6) and Enable;
	Enabled_SI (5) <= SI(5) and Enable;
	Enabled_SI (4) <= SI(4) and Enable;
	Enabled_SI (3) <= SI(3) and Enable;
	Enabled_SI (2) <= SI(2) and Enable;
	Enabled_SI (1) <= SI(1) and Enable;
	Enabled_SI (0) <= SI(0) and Enable;




end weird_adder_arch;
