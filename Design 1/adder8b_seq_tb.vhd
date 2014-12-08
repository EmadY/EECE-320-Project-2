library ieee;
use ieee.std_logic_1164.all;

entity adder8b_seq_tb is
end adder8b_seq_tb;

architecture adder8b_seq_tb of adder8b_seq_tb is
component adder8b_seq port (
	en: in std_logic;
        X : in  STD_LOGIC_VECTOR(7 downto 0);
        Y : in  STD_LOGIC_VECTOR(7 downto 0);
        C0: in  STD_LOGIC;
        S : out STD_LOGIC_VECTOR(7 downto 0);
        C8: out STD_LOGIC
    );
end component;
signal x1: std_logic_vector(7 downto 0):="00010100";
signal x2: std_logic_vector(7 downto 0):="10101010";
signal cin: std_logic:='0';
signal s1: std_logic_vector(7 downto 0);
signal cout: std_logic;	
signal ent: std_logic:='1';
begin
a: adder8b_seq port map(en=>ent,x=>x1,y=>x2,c0=>cin,s=>s1,c8=>cout);

ent <=not ent after 50 ns;

end adder8b_seq_tb;