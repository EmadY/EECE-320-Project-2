library IEEE;
use IEEE.std_logic_1164.all;
entity full_adder_tb is
end full_adder_tb;

architecture tb_architecture of full_adder_tb is
	component  full_adder port(
		X: 	in STD_LOGIC;
		Y: 	in STD_LOGIC;
		CIN: 	in STD_LOGIC;
		S: 	out STD_LOGIC;
		COUT: 	out STD_LOGIC ) ;
	end component;
	signal X:	STD_LOGIC := '0';
	signal Y: 	STD_LOGIC := '0';
	signal CIN:	STD_LOGIC := '0';
	signal S:	STD_LOGIC;
	signal COUT:	STD_LOGIC;
  begin
	UUT: full_adder
		port map (
			X => X,
			Y => Y,
			CIN => CIN,
			S => S,
			COUT => COUT);
	CIN 	<= NOT CIN 	after 10 ns;
	Y	<= NOT Y 	after 20 ns;
	X 	<= NOT X	after 40 ns;
end tb_architecture;