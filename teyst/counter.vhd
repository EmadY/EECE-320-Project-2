library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_unsigned.all;

entity counter is
    port (clk,ce,rst: in STD_LOGIC; TC: out STD_LOGIC);
end counter;
architecture count of counter is 
signal C: std_logic_vector(3 downto 0):="0000";

begin
  process(CLK,CE,C)
    begin
     if (CLK'event AND CLK = '1')  then
       if (RST='1')  then
       TC <='0';
       C<=(others=>'0');
       end if;
       if (CE = '1') then
         C <= C + 1;
       end if;
     end if;
   if (C = 8)then
     TC<='1' ;
     C <= "0000" after 20 ns;
   else TC<='0';
   end if;

 end process;
 end count;
   
