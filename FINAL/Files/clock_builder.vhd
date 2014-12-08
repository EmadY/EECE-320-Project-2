library IEEE;
use IEEE.std_logic_1164.all;

entity clock_builder is
	port(
		CLK_i: IN STD_LOGIC;
		CLK_M: OUT STD_LOGIC; -- the clock for the iterations
		CLK_A: OUT STD_LOGIC; -- the clock for the adder
		CLK_R1: OUT STD_LOGIC; -- the clock for the register of the left part of the product
		CLK_R2: OUT STD_LOGIC
	);
end entity;

architecture clock_builder_ARCH of clock_builder is
        component counter163 is
        port(
                CLK, CLR_L, LD_L, ENP, ENT: IN STD_LOGIC;
                D: IN STD_LOGIC_Vector(3 downto 0);
                Q: OUT STD_LOGIC_Vector(3 downto 0);
                RCO: OUT STD_LOGIC
        );
end component;
        signal Count: STD_LOGIC_VECTOR(3 downto 0) := "1111"; -- Counter. Required. start from -1
		signal new_Count: STD_LOGIC_VECTOR(3 downto 0) := "1111";
        
        signal Is_Four: STD_LOGIC := '0';
        signal NIF : STD_LOGIC := '1'; -- NOT Is_Four
        
	signal Dummy: STD_LOGIC; --to hold uselss signals

        begin

			P2: counter163 port map(CLK=>CLK_i, CLR_L=>NIF, LD_L=>'1', ENP=>'1',ENT=>'1', D=>Count, Q=>new_Count, RCO=>Dummy);
			Count <= new_Count;
				process(new_Count)
					begin
						CLK_M <=  (NOT new_Count(0) AND NOT new_Count(1) AND NOT new_Count(2) AND NOT new_Count(3)) AND CLK_i;
						CLK_R1 <= CLK_i AND (NOT new_Count(3) AND NOT new_Count(0) AND new_Count(1) AND NOT new_Count(2));
						CLK_R2 <= CLK_i AND (NOT new_Count(3) AND new_Count(1) AND new_Count(0) AND NOT new_Count(2));
						CLK_A <= CLK_i AND (new_Count(0) AND NOT new_Count(1) AND NOT new_Count(2) AND NOT new_Count(3));
                        Is_Four <= NOT new_Count(3) AND new_Count(1) AND new_Count(0) AND NOT new_Count(2);
																	--since this number is 0 indexed, the integral value of 11
																	--corresponds to an index of 3, 0011 in binary.
                        NIF <= NOT (NOT new_Count(3) AND new_Count(1) AND new_Count(0) AND NOT new_Count(2));
				end process; 	
					
end clock_builder_ARCH; 