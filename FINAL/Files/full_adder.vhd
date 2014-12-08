Library IEEE;
use ieee.std_logic_1164.all;

entity full_adder is
  port (
	X: in STD_LOGIC;
	Y: in STD_LOGIC;
	CIN: in STD_LOGIC;
	S: out STD_LOGIC;
	COUT: out STD_LOGIC
);
end full_adder;

architecture full_adder of full_adder is
begin
	S <= (X XOR Y) XOR CIN;
	COUT <= (X AND Y) OR (X AND CIN) OR (Y AND CIN);
end full_adder;

