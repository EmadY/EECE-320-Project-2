library ieee;
use ieee.std_logic_1164.all;

entity seq_mult is
 port (
	I1 : in std_logic_vector(7 downto 0); --multiplicand, the one shifter
	I2 : in STD_LOGIC_VECTOR(7 downto 0); --multiplier. Remains constant throughout
	CLK : in std_logic;
	O: out STD_LOGIC_VECTOR(15 downto 0)
);
 end seq_mult;

 architecture seq_mult_arch of seq_mult is
 
 component enabled_buffer is --enable buffer
	port(I: IN STD_LOGIC_VECTOR(7 downto 0);
		 E: IN STD_LOGIC;
		 O: OUT STD_LOGIC_VECTOR(7 downto 0)
		 );
 end component;
 
component weird_adder is port( --adder with memory
  CLK: IN STD_LOGIC;
  MI: IN STD_LOGIC_VECTOR(7 downto 0);
  SI: IN STD_LOGIC_VECTOR(7 downto 0);
  O: OUT STD_LOGIC_VECTOR(7 downto 0);
  CO: OUT STD_LOGIC
 );
end component;

component sregister is 	--shift register
	port(CLK, input, shift, reset: in std_logic; 
		 output: out std_logic; 
		 pout: out std_logic_vector(7 downto 0)
		 );
end component;

component sregister_init is port(
	CLK,input,shift,reset: in std_logic; 
	v_in: IN STD_LOGIC_VECTOR(7 downto 0); 
	output : out std_logic; 
	pout : out std_logic_vector(7 downto 0)
	);
end component;

component clock_builder is	--clock builder
	port(
		CLK_i: IN STD_LOGIC;
		CLK_M: OUT STD_LOGIC; -- the clock for the iterations
		CLK_A: OUT STD_LOGIC; -- the clock for the adder
		CLK_R1: OUT STD_LOGIC; -- the clock for the register of the left part of the product
		CLK_R2: OUT STD_LOGIC
	);
end component;

component counter163 is --msi counter
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

component multiplexer is 
	port (
		x:in STD_LOGIC_VECTOR (7 downto 0);
		sel:in STD_LOGIC_VECTOR (2 downto 0);
		y : out STD_LOGIC
	);
end component;


SIGNAL CLK_M: STD_LOGIC := CLK; -- the clock for the iterations
SIGNAL CLK_A: STD_LOGIC := CLK; -- the clock for the adder
SIGNAL CLK_R1: STD_LOGIC := CLK; -- the clock for the register of the left part of the product
SIGNAL CLK_R2: STD_LOGIC := CLK;

SIGNAL Count : STD_LOGIC_VECTOR(3 downto 0) := "0000"; --used to keep track of which iteration we're on
SIGNAL New_Count: STD_LOGIC_VECTOR(3 downto 0):= "0000"; --same, but after update
SIGNAL Finished: STD_LOGIC := '0'; --used in counter. checks if we finished iterations
SIGNAL MUX_OUT: STD_LOGIC := '0'; --output from the MUX
SIGNAL EB_OUT: STD_LOGIC_VECTOR(7 downto 0) := "00000000"; --output from enabled_buffer. used in adder
SIGNAL SE_COUT: STD_LOGIC := '0'; --sequential adder carry out bit. Used in first register
SIGNAL REG_OUT: STD_LOGIC := '0'; --first shift register output bit. Used in second register

SIGNAL LP: STD_LOGIC_VECTOR(7 downto 0) := "00000000"; --left part: pout of 1st register
SIGNAL RP: STD_LOGIC_VECTOR(7 downto 0) := "00000000"; --right part: pout of 2nd register
SIGNAL LP_ADD: STD_LOGIC_VECTOR(7 downto 0); --left part after addition 
SIGNAL SUM_PART: STD_LOGIC_VECTOR(15 downto 0); --due to not globally static error

SIGNAL CI : STD_LOGIC := '0';
SIGNAL AI : STD_LOGIC := '0';
SIGNAL BI : STD_LOGIC := '0';
SIGNAL SO : STD_LOGIC := '0';

SIGNAL DUMMY: STD_LOGIC; --dummy variable, used when for useless signals

begin

P1: clock_builder port map(CLK, CLK_M, CLK_A, CLK_R1, CLK_R2); -- initialize clocks
P2: counter163 port map(CLK_M, '1', '1', '1', '1', Count, New_Count, Finished); 
P3: multiplexer port map(I1, Count(2 downto 0), MUX_OUT);
P4: enabled_buffer port map(I2, MUX_OUT, EB_OUT);
P5: weird_adder port map(CLK_A, EB_OUT, LP, LP_ADD, SE_COUT);
P6: sregister_init port map(CLK_R1, SE_COUT, '1', '0', LP_ADD, REG_OUT, LP);
P7: sregister port map(CLK_R2, REG_OUT, '1', '0', DUMMY, RP);
O <= LP&RP;
SUM_PART <= EB_OUT & LP;

process(CLK_R1)
begin
	Count <= New_Count; --update here, because we know that it's safe to update w/o
						--causing errors
end process;




end seq_mult_arch;