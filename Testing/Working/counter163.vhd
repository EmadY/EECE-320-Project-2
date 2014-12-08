library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_unsigned.all;

entity counter163 is
    port (
        CLK: in STD_LOGIC;
        CLR_L: in STD_LOGIC;
        LD_L: in STD_LOGIC;
        ENP: in STD_LOGIC;
        ENT: in STD_LOGIC;
        D: in STD_LOGIC_VECTOR (3 downto 0);
        Q: out STD_LOGIC_VECTOR (3 downto 0);
        RCO: out STD_LOGIC
    );
end counter163;
architecture counter163 of counter163 is
signal IQ: std_logic_vector(3 downto 0):= (others => '0');
begin
   process (CLK, ENT, IQ)
   begin
       if (CLK'event and CLK = '1') then
          if CLR_L = '0' then IQ <= (others => '0');
          elsif LD_L = '0' then IQ <= D;
          elsif (ENT and ENP) = '1' then IQ <= IQ + 1;
          end if;
       end if;
       if (IQ = 15) and (ENT = '1') then RCO <= '1';
       else RCO <= '0';
       end if;
       Q <= IQ;
    end process;
end counter163;

