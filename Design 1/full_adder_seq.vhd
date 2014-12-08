library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder_seq is
port(
en: in std_logic;
X: in STD_LOGIC;
Y: in STD_LOGIC;
CIN: in STD_LOGIC;
S: out STD_LOGIC;
COUT: out STD_LOGIC
);
end full_adder_seq;

architecture full_adder_seq of full_adder_seq is
begin
S <=(X XOR Y) XOR CIN when en='1' else Y;
COUT <= (X AND Y) OR (X AND CIN) OR (Y AND CIN) when en='1' else '0';
end full_adder_seq;