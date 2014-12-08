library IEEE;
use IEEE.std_logic_1164.all;


entity counter163_tb is
end entity;

architecture counter163_tb_arch of counter163_tb is
        component counter163 is
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
end component;
	
	
	signal CLK_tb : std_logic := '1';
	signal D_tb: STD_LOGIC_VECTOR (3 downto 0):="0000";
	signal Q_tb:  STD_LOGIC_VECTOR (3 downto 0);
	signal rc_tb: std_logic;
	
        begin
            T: counter163 port map(CLK_tb,'1','1','1','1',D_tb,q_tb,rc_tb);
			CLK_tb <= NOT CLK_tb after 10 ns;
		
				
end counter163_tb_arch;
