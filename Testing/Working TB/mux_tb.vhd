LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY tb_multiplexer_vhd IS
END tb_multiplexer_vhd;

ARCHITECTURE behavior OF tb_multiplexer_vhd IS

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT multiplexer
PORT(
x:IN std_logic_vector(7 downto 0);
sel:IN std_logic_vector(2 downto 0);
y:OUT std_logic
);
END COMPONENT;

--Inputs
SIGNAL x : std_logic_vector(7 downto 0) := (others=>'0');
SIGNAL sel : std_logic_vector(2 downto 0) := (others=>'0');

--Outputs
SIGNAL y : std_logic;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: multiplexer PORT MAP(x => x,
sel => sel,
y => y
);
x <= "01010101" after 10ns;
sel <= "001" after 10ns,"010" after 20ns,"011" after 30ns,"100" after 40ns,"101" after 50ns,"110" after 60ns, "111" after 70ns;

END;
