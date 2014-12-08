library IEEE;
use IEEE.std_logic_1164.all;


entity register_init_tb is
end entity;

architecture register_init_tb_arch of register_init_tb is
        component sregister_init is
  port( CLK,input,shift,reset: in std_logic; v_in: IN STD_LOGIC_VECTOR(7 downto 0); output : out std_logic; pout : out std_logic_vector(7 downto 0));
end component;
	signal pout_tb: STD_LOGIC_vector (7 downto 0):="00100101";
	signal CLK_tb : std_logic := '0';
	signal output_tb:std_logic;
	signal v_in_tb: STD_LOGIC_vector (7 downto 0):= "00100101";
	signal input_again : STD_LOGIC_vector (7 downto 0);
	
        begin
            T: sregister_init port map(clk_tb,'1','1','0',v_in_tb,output_tb,pout_tb);
			CLK_tb <= NOT CLK_tb after 10 ns;

process(clk_tb)
begin
if (clk_tb'event and clk_tb = '0') then
v_in_tb <= pout_tb;

end if;
end process;

		
				
end register_init_tb_arch;
