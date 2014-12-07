library ieee;
use ieee.std_logic_1164.all;

entity DFF is
  port (clk,D,resetD: in std_logic ; Q: out std_logic);
  end entity;
  
  architecture DFF of DFF is
    begin
      process (clk)
        begin
        if(clk'event and clk = '1') then
        if (resetD = '1') then Q <= '0';
        else Q <= D;
        end if;
      end if;
    end process;
  end architecture;