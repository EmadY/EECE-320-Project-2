
Library IEEE;
use ieee.std_logic_1164.all;

entity adder8bit is
port (
a: in STD_LOGIC_VECTOR (7 downto 0);
b:	in STD_LOGIC_VECTOR (7 downto 0);
carryin: in STD_LOGIC;
sum:	out STD_LOGIC_VECTOR (7 downto 0);
carryout: out STD_LOGIC
);
end adder8bit;

architecture adder8bit of adder8bit is
component full_adder port (
X: in STD_LOGIC;
Y:	in STD_LOGIC;
CIN:	in STD_LOGIC;
S:	out STD_LOGIC;
COUT:	out STD_LOGIC );
end component;
signal C: STD_LOGIC_VECTOR (1 to 7);
begin
U1: full_adder port map ( X=>a(0), Y=>b(0), CIN=> carryin, S=>sum(0), Cout=>C(1));
U2: full_adder port map ( X=>a(1), Y=>b(1), CIN=> C(1), S=>sum(1), Cout=>C(2));
U3: full_adder port map ( X=>a(2), Y=>b(2), CIN=> C(2), S=>sum(2), Cout=>C(3));
U4: full_adder port map ( X=>a(3), Y=>b(3), CIN=> C(3), S=>sum(3), Cout=>C(4));
U5: full_adder port map ( X=>a(4), Y=>b(4), CIN=> C(4), S=>sum(4), Cout=>C(5));
U6: full_adder port map ( X=>a(5), Y=>b(5), CIN=> C(5), S=>sum(5), Cout=>C(6));
U7: full_adder port map ( X=>a(6), Y=>b(6), CIN=> C(6), S=>sum(6), Cout=>C(7));
U8: full_adder port map ( X=>a(7), Y=>b(7), CIN=> C(7), S=>sum(7), Cout=>carryout);
end adder8bit;
