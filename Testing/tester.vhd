library IEEE;
use IEEE.std_logic_1164.all;

entity tester is
	port(
		CLK_i: IN STD_LOGIC;
		CLK_o: OUT STD_LOGIC
	);
end entity;

architecture testertb of tester is
        component dff is
        port(
                CLK, D, resetD: IN STD_LOGIC;
                Q: OUT STD_LOGIC
        );
end component;
        component counter163 is
        port(
                CLK, CLR_L, LD_L, ENP, ENT: IN STD_LOGIC;
                D: IN STD_LOGIC_Vector(3 downto 0);
                Q: OUT STD_LOGIC_Vector(3 downto 0);
                RCO: OUT STD_LOGIC
        );
end component;
        signal Count: STD_LOGIC_VECTOR(3 downto 0) := "0000";
        signal DFF_i: STD_LOGIC := '1';
        
        signal Is_Three: STD_LOGIC := '0';
        signal Is_Five: STD_LOGIC := '0';
        signal NIF : STD_LOGIC := '1';
        signal Was_Three: STD_LOGIC := '0';
        
        signal Dummy: STD_LOGIC;
        begin
        --CLK <= NOT CLK after 5 ns;
        --process
                        Is_Three <= Count(0) AND Count(1);
                        Is_Five <= Count(0) AND Count(2);
                        Was_Three <= (Is_Three OR Was_Three) AND NOT Is_Five;
                        DFF_i <= Was_Three;
                        NIF <= NOT Is_Five;
						P1: dff port map(CLK=>CLK_i, D=>DFF_i, resetD=>'0', Q=>CLK_o);
						P2: counter163 port map(CLK=>CLK_i, CLR_L=>NIF, LD_L=>'1', ENP=>'1',ENT=>'1', D=>Count, Q=>Count, RCO=>Dummy);
						
--        end process;
end testertb; 