library IEEE;
use IEEE.std_logic_1164.all;


entity testertb is
end entity;

architecture testertbtb of testertb is
        component tester is
        port(
		CLK_i: IN STD_LOGIC;
		CLK_o: OUT STD_LOGIC
        );
end component;
	signal iCLK: STD_LOGIC := '0';
	signal oCLK: STD_LOGIC := '1';
        begin
            T: tester port map(iCLK, oCLK);
			iCLK <= NOT iCLK after 10 ns;
end testertbtb; 