
library ieee;
use ieee.std_logic_1164.all;

entity and8bit is
 port (
	input: in std_logic_vector(7 downto 0);
	E: in std_logic;
	output : out std_logic_vector ( 7 downto 0)


);
 end entity;

 architecture and8bit of and8bit is
   begin
	output (7) <= input(7) and E;
	output (6) <= input(6) and E;
	output (5) <= input(5) and E;
	output (4) <= input(4) and E;
	output (3) <= input(3) and E;
	output (2) <= input(2) and E;
	output (1) <= input(1) and E;
	output (0) <= input(0) and E;

end and8bit;

	
	