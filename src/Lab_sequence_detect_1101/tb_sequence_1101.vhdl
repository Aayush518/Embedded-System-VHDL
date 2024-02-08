library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_sequence_1101 is
end tb_sequence_1101;

architecture TB of tb_sequence_1101 is

    -- Constants declaration
    constant CLOCK_PERIOD : time := 10 ns;

    -- Signals declaration
    signal clk_tb : STD_LOGIC := '0';
    signal reset_tb : STD_LOGIC := '0';
    signal input_bit_tb : STD_LOGIC := '0';
    signal output_detected_tb : STD_LOGIC;

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
        reset_tb <= '1';  -- Reset active
        wait for 20 ns;
        reset_tb <= '0';  -- Deactivate reset
        wait for 100 ns;  -- Wait for some cycles to stabilize
        
        -- Apply input sequence: 1101
        input_bit_tb <= '1';
        wait for 10 ns;
        input_bit_tb <= '1';
        wait for 10 ns;
        input_bit_tb <= '0';
        wait for 10 ns;
        input_bit_tb <= '1';
        wait for 10 ns;

        -- Wait for some time to observe the output
        wait for 100 ns;

        -- Apply another input sequence: 0101
        input_bit_tb <= '0';
        wait for 10 ns;
        input_bit_tb <= '1';
        wait for 10 ns;
        input_bit_tb <= '0';
        wait for 10 ns;
        input_bit_tb <= '1';
        wait for 10 ns;

        wait;
    end process stim_proc;

    -- Instantiate the sequence_detect module
    UUT: entity work.sequence_detect
        port map (
            clk => clk_tb,
            reset => reset_tb,
            input_bit => input_bit_tb,
            output_detected => output_detected_tb
        );

    -- Output observation
    observe_output: process
    begin
        wait until rising_edge(clk_tb);
        report "Output detected: " & std_logic'image(output_detected_tb) severity NOTE;
        -- Add additional wait statements as needed to observe the output
        -- Ensure to extend simulation time appropriately to capture all outputs
    end process observe_output;

end TB;
