library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LCM_TB is
end LCM_TB;

architecture Behavioral of LCM_TB is
    -- Signals
    signal RESET_TB, CLK_TB: STD_LOGIC;
    signal NUM1_TB, NUM2_TB, LCM_Result_TB: INTEGER;

begin
    -- Component instantiation
    DUT: entity work.LCM port map (RESET => RESET_TB, CLK => CLK_TB, NUM1 => NUM1_TB, NUM2 => NUM2_TB, LCM_Result => LCM_Result_TB);

    -- Clock process
    CLK_TB_process: process
    begin
        CLK_TB <= '0';
        wait for 5 ns;
        CLK_TB <= '1';
        wait for 5 ns;
    end process CLK_TB_process;

    -- Stimulus process
    stimulus: process
    begin
        RESET_TB <= '1'; -- Reset high initially
        wait for 10 ns;
        RESET_TB <= '0'; -- Release reset
        NUM1_TB <= 6; -- Example values for testing
        NUM2_TB <= 9;
        wait for 100 ns;
        NUM1_TB <= 15;
        NUM2_TB <= 25;
        wait for 100 ns;
        NUM1_TB <= 8;
        NUM2_TB <= 12;
        wait;
    end process stimulus;

end Behavioral;
