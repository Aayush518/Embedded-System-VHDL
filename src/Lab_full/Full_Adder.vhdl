library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Full_Adder is
  port
  (
    A    : in std_logic;
    B    : in std_logic;
    CIN  : in std_logic;
    S    : out std_logic;
    COUT : out std_logic
  );
end Full_Adder;

architecture Behavioral of Full_Adder is

  signal S1, C1, C2 : std_logic;

  component OR_Gate is
    port
    (
      A : in std_logic;
      B : in std_logic;
      Y : out std_logic
    );
  end component;

  component Half_Adder is
    port
    (
      A : in std_logic;
      B : in std_logic;
      S : out std_logic;
      C : out std_logic
    );
  end component;

begin

  HA1 : entity work.Half_Adder port map
    (
    A => A,
    B => B,
    S => S1,
    C => C1
    );

  HA2 : entity work.Half_Adder port
    map (
    A => S1,
    B => CIN,
    S => S,
    C => C2
    );

  G1 : entity work.OR_Gate port
    map (
    A => C1,
    B => C2,
    Y => COUT
    );

end Behavioral;