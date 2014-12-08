library IEEE;
use IEEE.std_logic_1164.all;


entity cbTB is
end entity;

architecture cbTBARCH of cbTB is
component clock_builder is
        port(
		CLK_i: IN STD_LOGIC;
		CLK_M: OUT STD_LOGIC; -- the clock for the iterations
		CLK_A: OUT STD_LOGIC; -- the clock for the adder
		CLK_R1: OUT STD_LOGIC; -- the clock for the register of the left part of the product
		CLK_R2: OUT STD_LOGIC
        );
end component;
	signal iCLK: STD_LOGIC := '1';
	signal mCLK: STD_LOGIC;
	signal aCLK: STD_LOGIC;	
	signal r1CLK: STD_LOGIC;
	signal r2CLK: STD_LOGIC;
        begin
            T: clock_builder port map(iCLK, mCLK, aCLK, r1CLK, r2CLK);
			iCLK <= NOT iCLK after 10 ns;
end cbTBARCH; 