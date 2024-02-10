library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity T_FF is
    port (
        T    : in  std_logic;
        CLK  : in  std_logic;
        RST  : in  std_logic;
        Q    : out std_logic;
        Q_bar: out std_logic
    );
end T_FF;

architecture behavioral of T_FF is
    signal internal_Q : std_logic;
begin
    process (CLK, RST)
    begin
        if RST = '1' then
            internal_Q <= '0';
        elsif rising_edge(CLK) then
            if T = '1' then
                internal_Q <= not internal_Q;
            end if;
        end if;
    end process;

    Q <= internal_Q;
    Q_bar <= not internal_Q;
end behavioral;
