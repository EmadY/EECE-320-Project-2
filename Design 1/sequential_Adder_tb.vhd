library IEEE;
use IEEE.std_logic_1164.all;


entity seq_adder_tb is
end entity;

architecture seq_adder_tb_arch of seq_adder_tb is
        component SA_VHDL is
   Port ( I : in std_logic_vector(15 downto 0);
          O : out std_logic_vector(7 downto 0);
          c_i, a_i, b_i, c_o, s_o : out std_logic;
          CLK : in std_logic;
          Load : in std_logic);
end component;
	signal i_tb: STD_LOGIC_vector (15 downto 0):= "0000100000001000";
	signal o_tb: STD_LOGIC_vector (7 downto 0);
	signal c_i_tb,a_i_tb,b_i_tb,c_o_tb,s_o_tb :std_logic;
	signal CLK_tb : std_logic;
	
	
	
	
	
        begin
            T: SA_VHDL port map(i_tb, o_tb,c_i_tb,a_i_tb,b_i_tb,c_o_tb,s_o_tb,CLK_tb,'1');
			CLK_tb <= NOT CLK_tb after 10 ns;
end seq_adder_tb_arch; 
