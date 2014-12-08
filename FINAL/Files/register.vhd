library ieee;
use ieee.std_logic_1164.all;
entity sregister is
  port( CLK,input,shift,reset: in std_logic; output : out std_logic; pout : out std_logic_vector(7 downto 0));
  end entity;
  architecture sregister of sregister is
  signal IQ: std_logic_vector (7 downto 0) := "00000000";
  begin
  process(CLK,IQ)
  begin
    
  if (CLK'event and CLK='1') then
  if (reset='0' and shift='1' ) then
  IQ <= input & IQ(7 downto 1);
elsif (reset='1') then
IQ<=(others=>'0');
elsif (shift<='0') then 
IQ<=IQ;
end if;

end if;
output <=IQ(0);
pout <= IQ;
end process;
end architecture;

