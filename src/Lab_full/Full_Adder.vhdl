---------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Full_Adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           CIN : in  STD_LOGIC;
           S : out  STD_LOGIC;
           COUT : out  STD_LOGIC);
end Full_Adder;

architecture Behavioral of Full_Adder is

signal S1,C1,C2:STD_LOGIC;

component OR_Gate is
PORT (A: in STD_LOGIC;
B: in STD_LOGIC;
Y:out STD_LOGIC);

end component;

component Half_Adder is
PORT (A: in STD_LOGIC;
B: in STD_LOGIC;
S: out STD_LOGIC;
C: out STD_LOGIC);

end component;

begin

HA1: Half_Adder PORT MAP (A,B,S1,C1);
HA2: Half_Adder PORT MAP (S1,CIN,S,C2);
G1: OR_Gate port map (c1,c2,Cout);

end Behavioral;
