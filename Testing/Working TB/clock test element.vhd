library IEEE;
use IEEE.std_logic_1164.all;

entity clock_test_element is
	port(
		CLK: IN STD_LOGIC;
		qout1 :  out STD_LOGIC_VECTOR (3 downto 0);
		qout2 :  out STD_LOGIC_VECTOR (3 downto 0);
		qout3 :  out STD_LOGIC_VECTOR (3 downto 0);
		qout4 :  out STD_LOGIC_VECTOR (3 downto 0)
		

	);
end entity;

architecture clock_test_element of clock_test_element is

 component clock_builder is
	port(
		CLK_i: IN STD_LOGIC;
		CLK_M: OUT STD_LOGIC; -- the clock for the iterations
		CLK_A: OUT STD_LOGIC; -- the clock for the adder
		CLK_R1: OUT STD_LOGIC; -- the clock for the register of the left part of the product
		CLK_R2: OUT STD_LOGIC
	);
end component;
	
	

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

	signal mCLK: STD_LOGIC;
	signal aCLK: STD_LOGIC;
	signal r1CLK: STD_LOGIC;
	signal r2CLK: STD_LOGIC;
	signal q1 :  STD_LOGIC_VECTOR (3 downto 0);
	signal q2 :  STD_LOGIC_VECTOR (3 downto 0);
	signal q3 :  STD_LOGIC_VECTOR (3 downto 0);
	signal q4 :  STD_LOGIC_VECTOR (3 downto 0);
	signal rc1: STD_LOGIC;
	signal rc2: STD_LOGIC;
        signal rc3: STD_LOGIC;
	signal rc4: STD_LOGIC;


        

        begin

t1: clock_builder port map (CLK_i=>CLK,CLK_m=>mCLK,CLK_a=>aCLK,CLK_R1=>r1CLK,CLK_R2=>r2CLK);
c1: counter163 port map(Clk=>mCLK,CLR_L=>'1',LD_L=>'1',ENP=>'1',ENT=>'1',D=>"0000",q=>q1,RCO=>rc1);
c2: counter163 port map(Clk=>aCLK,CLR_L=>'1',LD_L=>'1',ENP=>'1',ENT=>'1',D=>"0000",q=>q2,RCO=>rc2);
c3: counter163 port map(Clk=>r1CLK,CLR_L=>'1',LD_L=>'1',ENP=>'1',ENT=>'1',D=>"0000",q=>q3,RCO=>rc3);
c4: counter163 port map(Clk=>r2CLK,CLR_L=>'1',LD_L=>'1',ENP=>'1',ENT=>'1',D=>"0000",q=>q4,RCO=>rc4);

qout1 <= q1;
qout2 <= q2;
qout3 <= q3;
qout4 <= q4;
















end clock_test_element; 
