library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FlipFlop is
    Port (
        T    : in  std_logic;  -- Toggle input
        CLK  : in  std_logic;  -- Clock input
        RST  : in  std_logic;  -- Reset input
        Q    : out std_logic   -- Output
    );
end T_FlipFlop;

architecture Behavioral of T_FlipFlop is
    signal Q_temp : std_logic := '0';
begin
    process(CLK, RST)
    begin
        if RST = '1' then
            Q_temp <= '0';
        elsif rising_edge(CLK) then
            if T = '1' then
                Q_temp <= not Q_temp;
            end if;
        end if;
    end process;

    Q <= Q_temp;
end Behavioral;
