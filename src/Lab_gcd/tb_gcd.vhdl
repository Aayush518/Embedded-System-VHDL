library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_gcd is
end tb_gcd;

architecture Behavioral of tb_gcd is
    -- Constants
    constant CLK_PERIOD : time := 10 ns;

    -- Signals
    signal RESET_TB, CLK_TB, GO_TB : std_logic := '0';
    signal NUM1_TB, NUM2_TB, Result_GCD_TB : integer := 0;

begin
    -- DUT instantiation
    DUT : entity work.GCD
        port map (
            RESET => RESET_TB,
            CLK => CLK_TB,
            GO => GO_TB,
            NUM1 => NUM1_TB,
            NUM2 => NUM2_TB,
            Result_GCD => Result_GCD_TB
        );

    -- Clock process
    CLK_TB_process : process
    begin
        CLK_TB <= '0';
        wait for CLK_PERIOD / 2;
        CLK_TB <= '1';
        wait for CLK_PERIOD / 2;
    end process CLK_TB_process;

    -- Stimulus process
    stimulus : process
    begin
        -- Reset
        RESET_TB <= '1';
        wait for CLK_PERIOD * 2;
        RESET_TB <= '0';
        wait for CLK_PERIOD * 2;

        -- Test cases
        NUM1_TB <= 12;
        NUM2_TB <= 18;
        GO_TB <= '1';
        wait for CLK_PERIOD * 5;  -- Wait for a few clock cycles for the computation to finish

        NUM1_TB <= 25;
        NUM2_TB <= 35;
        GO_TB <= '1';
        wait for CLK_PERIOD * 5;

        -- Add more test cases as needed

        -- End simulation
        wait;
    end process stimulus;

end Behavioral;
