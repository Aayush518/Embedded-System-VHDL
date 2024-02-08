library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_jk_flipflop is
end tb_jk_flipflop;

architecture TB of tb_jk_flipflop is

    -- Constants declaration
    constant CLOCK_PERIOD : time := 10 ns;

    -- Signals declaration
    signal j_tb, k_tb, clk_tb, rst_tb, q_tb : std_logic;

begin

    -- Clock process
    clk_process: process
    begin
        while now < 1000 ns loop
            clk_tb <= '0';
            wait for CLOCK_PERIOD / 2;
            clk_tb <= '1';
            wait for CLOCK_PERIOD / 2;
        end loop;
        wait;
    end process clk_process;

    -- Stimulus process
    stim_proc: process
    begin
        rst_tb <= '1';  -- Reset active
        wait for 20 ns;
        rst_tb <= '0';  -- Deactivate reset
        wait for 100 ns;  -- Wait for some cycles to stabilize
        
        -- Test case 1: J = '0', K = '0'
        j_tb <= '0';
        k_tb <= '0';
        wait for 10 ns;
        
        -- Test case 2: J = '1', K = '0'
        j_tb <= '1';
        k_tb <= '0';
        wait for 10 ns;
        
        -- Test case 3: J = '0', K = '1'
        j_tb <= '0';
        k_tb <= '1';
        wait for 10 ns;
        
        -- Test case 4: J = '1', K = '1'
        j_tb <= '1';
        k_tb <= '1';
        wait for 10 ns;
        
        wait;
    end process stim_proc;

    -- Instantiate the JK_FlipFlop module
    UUT: entity work.JK_FlipFlop
        port map (
            J => j_tb,
            K => k_tb,
            CLK => clk_tb,
            RST => rst_tb,
            Q => q_tb
        );

    -- Output observation
    observe_output: process
    begin
        wait until rising_edge(clk_tb);
        report "Q: " & std_logic'image(q_tb) severity NOTE;
        -- Add additional wait statements as needed to observe the output
        -- Ensure to extend simulation time appropriately to capture all outputs
    end process observe_output;

end TB;
