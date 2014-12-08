library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity SA_VHDL is
   Port ( I : in std_logic_vector(15 downto 0);
          O : out std_logic_vector(7 downto 0);
          c_i, a_i, b_i, c_o, s_o : out std_logic;
          CLK : in std_logic;
          Load : in std_logic);
end SA_VHDL;
 
architecture Behavioral of SA_VHDL is
   signal ina, inb, oreg : std_logic_vector(7 downto 0);
   signal so, ci, co: std_logic;
begin
 
--rec ina
process (CLK)
	begin
	   if CLK'event and CLK='1' then
      if (Load='1') then
         ina <= I(15 downto 8);
      else
         ina <= '0' & ina(7 downto 1);
      end if;
   end if;
end process;
 
--reg inb
process (CLK)
begin
   if CLK'event and CLK='1' then
      if (Load='1') then
         inb <= I(7 downto 0);
      else
         inb <= '0' & inb(7 downto 1);
      end if;
   end if;
end process;
 
--oreg 
process (CLK)
begin
   if CLK'event and CLK='1' then
      if (Load='1') then
         oreg <= "00000000";
         ci <= '0';
      else
         ci <= co;
         oreg <= so & oreg(7 downto 1);
      end if;
   end if;
end process;
-- FA
so <=  inb(0) xor ina(0) xor ci;
co <= (inb(0) and ina(0)) or  
      (inb(0) and ci) or 
      (ci and ina(0));
 
O <= oreg;
 
-- for  test
c_i <= ci;  
a_i <= ina(0);
b_i <= inb(0);
 
c_o <= co;  
s_o <= so; 
 
end Behavioral;