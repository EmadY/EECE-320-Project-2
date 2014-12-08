library IEEE;
use IEEE.std_logic_1164.all;

entity clock_event_enabler is
	port(
		CLK: IN STD_LOGIC;
		E: OUT STD_LOGIC

	);
end entity;

architecture clock_event_enabler of clock_event_enabler is
  begin
process (CLK)
begin


if (CLK'event and CLK = '1') then
e <= '1';
end if;
end process;
end clock_event_enabler; 
