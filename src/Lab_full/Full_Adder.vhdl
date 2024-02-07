library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        CIN : in  STD_LOGIC;
        S : out  STD_LOGIC;
        COUT : out  STD_LOGIC
    );
end Full_Adder;

architecture Behavioral of Full_Adder is

    signal S1, C1, C2: STD_LOGIC;

    component OR_Gate is
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component Half_Adder is
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            S : out STD_LOGIC;
            C : out STD_LOGIC
        );
    end component;

begin

    HA1: entity work.Half_Adder PORT MAP (
        A => A,
        B => B,
        S => S1,
        C => C1
    );

    HA2: entity work.Half_Adder PORT MAP (
        A => S1,
        B => CIN,
        S => S,
        C => C2
    );

    G1: entity work.OR_Gate PORT MAP (
        A => C1,
        B => C2,
        Y => COUT
    );

end Behavioral;
