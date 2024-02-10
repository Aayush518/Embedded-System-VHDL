library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_T_FF is
end tb_T_FF;

architecture behavior of tb_T_FF is
    constant CLK_PERIOD : time := 10 ns;
    
    signal T_sig : std_logic := '0';
    signal CLK_sig : std_logic := '0';
    signal RST_sig : std_logic := '0';
    signal Q_sig : std_logic;
    signal Q_bar_sig : std_logic;

begin
    -- Instantiate the T flip-flop
    uut: entity work.T_FF
        port map (
            T => T_sig,
            CLK => CLK_sig,
            RST => RST_sig,
            Q => Q_sig,
            Q_bar => Q_bar_sig
        );

    -- Clock process
    CLK_process: process
    begin
        while now < 1000 ns loop
            CLK_sig <= not CLK_sig;
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process CLK_process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Hold reset state for a while
        RST_sig <= '1';
        wait for 50 ns;
        RST_sig <= '0';

        -- Apply T input and observe outputs
        T_sig <= '1';
        wait for 200 ns;  -- Increased from 100 ns to 200 ns
        T_sig <= '0';     -- Reset T input
        wait for 20 ns;   -- Small delay for the flip-flop to react
        assert Q_sig = '1' and Q_bar_sig = '0' report "Error: Q and Q_bar should be 1 and 0 respectively" severity error;

        wait;
    end process stim_proc;

end behavior;
