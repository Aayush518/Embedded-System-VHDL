library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_full_adder is
end tb_full_adder;

architecture testbench of tb_full_adder is

    -- Component declaration for the DUT (Design Under Test)
    component Full_Adder is
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            CIN : in  STD_LOGIC;
            S : out  STD_LOGIC;
            COUT : out  STD_LOGIC
        );
    end component;

    -- Signals for test bench
    signal A_tb, B_tb, CIN_tb, S_tb, COUT_tb : STD_LOGIC;

begin

    -- Instantiate the Full_Adder DUT
    UUT : Full_Adder
    port map (
        A => A_tb,
        B => B_tb,
        CIN => CIN_tb,
        S => S_tb,
        COUT => COUT_tb
    );

    -- Stimulus process
    stimulus : process
    begin
        -- Test case 1: A = '0', B = '0', CIN = '0'
        A_tb <= '0';
        B_tb <= '0';
        CIN_tb <= '0';
        wait for 10 ns;

        -- Test case 2: A = '0', B = '1', CIN = '0'
        A_tb <= '0';
        B_tb <= '1';
        CIN_tb <= '0';
        wait for 10 ns;

        -- Test case 3: A = '1', B = '1', CIN = '1'
        A_tb <= '1';
        B_tb <= '1';
        CIN_tb <= '1';
        wait for 10 ns;

            -- Test case 4: A = '1', B = '0', CIN = '0'
        A_tb <= '1';
        B_tb <= '0';
        CIN_tb <= '0';
        wait for 10 ns;

        -- Test case 5: A = '0', B = '1', CIN = '1'
        A_tb <= '0';
        B_tb <= '1';
        CIN_tb <= '1';
        wait for 10 ns;

        -- Test case 6: A = '1', B = '0', CIN = '1'
        A_tb <= '1';
        B_tb <= '0';
        CIN_tb <= '1';
        wait for 10 ns;

        -- Test case 7: A = '1', B = '1', CIN = '0'
        A_tb <= '1';
        B_tb <= '1';
        CIN_tb <= '0';
        wait for 10 ns;

        -- Test case 8: A = '1', B = '1', CIN = '1'
        A_tb <= '1';
        B_tb <= '1';
        CIN_tb <= '1';
        wait for 10 ns;


        -- Add more test cases as needed...

        wait;
    end process stimulus;

end testbench;
