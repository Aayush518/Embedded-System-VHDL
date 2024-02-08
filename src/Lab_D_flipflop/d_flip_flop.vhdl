library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FlipFlop is
    Port (
        D   : in  std_logic;  
        CLK : in  std_logic;  
        RST : in  std_logic;  
        Q   : out std_logic; 
        Q_n : out std_logic   
    );
end D_FlipFlop;

architecture Behavioral of D_FlipFlop is
    signal Q_temp : std_logic;
begin
    process(CLK, RST)
    begin
        if RST = '1' then
            Q_temp <= '0';  
        elsif rising_edge(CLK) then
            Q_temp <= D;     
        end if;
    end process;

    -- Output assignments
    Q   <= Q_temp;
    Q_n <= not Q_temp;
end Behavioral;
