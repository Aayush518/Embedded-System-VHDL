library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FlipFlop is
    Port (
        J    : in  std_logic;
        K    : in  std_logic;
        CLK  : in  std_logic;
        RST  : in  std_logic;
        Q    : out std_logic
    );
end JK_FlipFlop;

architecture Behavioral of JK_FlipFlop is
    signal Q_temp : std_logic := '0';
begin
    process(CLK, RST)
    begin
        if RST = '1' then
            Q_temp <= '0';
        elsif rising_edge(CLK) then
            if (J = '1' and K = '0') then
                Q_temp <= '1';
            elsif (J = '0' and K = '1') then
                Q_temp <= '0';
            elsif (J = '1' and K = '1') then
                Q_temp <= not Q_temp;
            end if;
        end if;
    end process;

    Q <= Q_temp;
end Behavioral;
