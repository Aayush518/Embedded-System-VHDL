library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux is
end tb_mux;

architecture TB of tb_mux is

    -- Signals declaration
    signal a_tb, b_tb, sel_tb, y_tb : std_logic;

begin

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: sel = '0', a = '0', b = '0'
        sel_tb <= '0';
        a_tb <= '0';
        b_tb <= '0';
        wait for 10 ns;

        -- Test case 2: sel = '0', a = '1', b = '0'
        sel_tb <= '0';
        a_tb <= '1';
        b_tb <= '0';
        wait for 10 ns;

        -- Test case 3: sel = '1', a = '0', b = '1'
        sel_tb <= '1';
        a_tb <= '0';
        b_tb <= '1';
        wait for 10 ns;

        -- Test case 4: sel = '1', a = '1', b = '1'
        sel_tb <= '1';
        a_tb <= '1';
        b_tb <= '1';
        wait for 10 ns;

        wait;
    end process stim_proc;

    -- Instantiate the mux2to1 module
    UUT: entity work.mux2to1
        port map (
            a => a_tb,
            b => b_tb,
            sel => sel_tb,
            y => y_tb
        );

    -- Output observation
    observe_output: process
    begin
        wait until rising_edge(sel_tb);
        report "Output (y): " & std_logic'image(y_tb) severity NOTE;
        wait;
    end process observe_output;

end TB;
