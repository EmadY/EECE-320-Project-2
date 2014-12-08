library IEEE;
use IEEE.std_logic_1164.all;

entity weird_adder is port(
  CLK: IN STD_LOGIC;
  MI: IN STD_LOGIC_VECTOR(7 downto 0);
  SI: IN STD_LOGIC_VECTOR(7 downto 0);
  O: OUT STD_LOGIC_VECTOR(7 downto 0);
  CO: OUT STD_LOGIC
 );
end weird_adder;

architecture weird_adder_arch of weird_adder is
component adder8bit is
 port (
  a: in STD_LOGIC_VECTOR (7 downto 0);
  b: in STD_LOGIC_VECTOR (7 downto 0);
  carryin: in STD_LOGIC;
  sum: out STD_LOGIC_VECTOR (7 downto 0);
  carryout: out STD_LOGIC
 ); 
end component;

signal OUTPUT: STD_LOGIC_VECTOR(7 downto 0) := MI;
signal sum: STD_LOGIC_VECTOR(7 downto 0);
begin


p1: adder8bit port map(MI, SI, '0', sum, CO);
O <= OUTPUT;
process(CLK,SI,MI) begin
if(CLK'event AND CLK = '1') then
 OUTPUT <= sum;
else
 OUTPUT <= OUTPUT;
end if;
end process;

end weird_adder_arch;