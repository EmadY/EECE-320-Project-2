library ieee;
use ieee.std_logic_1164.all;

entity data_clock is
 port (
	Input : in std_logic_vector(15 downto 0);
	CLK_add : in std_logic;
	CLK_shift1 : in std_logic;
	CLK_shift2 : in std_logic;
 	c_i, a_i, b_i, c_o, s_o : out std_logic;
	Output : out std_logic_vector(7 downto 0);
        Load : in std_logic;
	reg1_input,reg1_shift,reg1_reset: in std_logic; reg1_output : out std_logic; reg1_pout : out std_logic_vector(7 downto 0);
	reg2_input,reg2_shift,reg2_reset: in std_logic; reg2_output : out std_logic; reg2_pout : out std_logic_vector(7 downto 0)

);
 end data_clock;

 architecture data_clock of data_clock is
  
component SA_VHDL 
Port ( I : in std_logic_vector(15 downto 0);
          O : out std_logic_vector(7 downto 0);
          c_i, a_i, b_i, c_o, s_o : out std_logic;
          CLK : in std_logic;
          Load : in std_logic
	
);
end component;

component sregister is
  port( CLK,input,shift,reset: in std_logic; output : out std_logic; pout : out std_logic_vector(7 downto 0));
  end component;


 begin


u1 : SA_VHDL port map (I => input, O =>output, c_i=>c_i,a_i=>a_i, b_i => b_i, c_o=>c_o, s_o=>s_o,CLK=>CLK_add, load=>load);
u2: sregister port map (CLK_shift1,reg1_input,reg1_shift,reg1_reset,reg1_output,reg1_pout);
u3: sregister port map (CLK_shift2,reg2_input,reg2_shift,reg2_reset,reg2_output,reg2_pout);





end data_clock;
