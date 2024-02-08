library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_t_flipflop is
end tb_t_flipflop;

architecture TB of tb_t_flipflop is

    -- Constants declaration
    constant CLOCK_PERIOD : time := 10 ns;

    -- Signals declaration
    signal clk_tb : STD_LOGIC := '0';
    signal rst_tb : STD_LOGIC := '0';
    signal t_tb : STD_LOGIC := '0';
    signal q_tb : STD_LOGIC;

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
        
        -- Apply T input sequence: 1010
        t_tb <= '1';
        wait for 10 ns;
        t_tb <= '0';
        wait for 10 ns;
        t_tb <= '1';
        wait for 10 ns;
        t_tb <= '0';
        wait for 10 ns;

        -- Wait for some time to observe the output
        wait for 100 ns;

        -- Apply another T input sequence: 0101
        t_tb <= '0';
        wait for 10 ns;
        t_tb <= '1';
        wait for 10 ns;
        t_tb <= '0';
        wait for 10 ns;
        t_tb <= '1';
        wait for 10 ns;

        wait;
    end process stim_proc;

    -- Instantiate the T_FlipFlop module
    UUT: entity work.T_FlipFlop
        port map (
            T => t_tb,
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
