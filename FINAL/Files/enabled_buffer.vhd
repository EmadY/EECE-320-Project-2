
library ieee;
use ieee.std_logic_1164.all;

entity enabled_buffer is
 port (
	I: in std_logic_vector(7 downto 0);
	E: in std_logic;
	O : out std_logic_vector ( 7 downto 0)
);
 end entity;

 architecture enabled_buffer_arch of enabled_buffer is
   begin
	O (7) <= I(7) and E;
	O (6) <= I(6) and E;
	O (5) <= I(5) and E;
	O (4) <= I(4) and E;
	O (3) <= I(3) and E;
	O (2) <= I(2) and E;
	O (1) <= I(1) and E;
	O (0) <= I(0) and E;

end enabled_buffer_arch;

	
	