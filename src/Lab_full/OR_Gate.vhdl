library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_Gate is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out  STD_LOGIC
    );
end OR_Gate;

architecture Behavioral of OR_Gate is
begin
    Y <= A OR B;
end Behavioral;
