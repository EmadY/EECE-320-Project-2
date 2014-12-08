library IEEE;
use IEEE.std_logic_1164.all;

entity adder8b_seq is
    port (
	en: in std_logic;
        X : in  STD_LOGIC_VECTOR(7 downto 0);
        Y : in  STD_LOGIC_VECTOR(7 downto 0);
        C0: in  STD_LOGIC;
        S : out STD_LOGIC_VECTOR(7 downto 0);
        C8: out STD_LOGIC
    );
end adder8b_seq;

architecture adder8b_seq of adder8b_seq is
component full_adder_seq
    port ( en  : in std_logic;
	   X   : in STD_LOGIC;
           Y   : in STD_LOGIC;
           CIN : in STD_LOGIC;
           S   : out STD_LOGIC;
           COUT: out STD_LOGIC
         );
end component;
signal C : std_logic_vector(0 to 8);   
begin
g1: for b in 0 to 7 generate
  U1: full_adder_seq port map (en=>en,X=>X(b), Y=>Y(b), CIN=> C(b), S=>S(b), COUT=>C(b+1));
 end generate;
 C(0)<=C0;
 C8<=C(8);
end adder8b_seq;