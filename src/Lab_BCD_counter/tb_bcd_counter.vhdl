library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_bcd_counter is
end tb_bcd_counter;

architecture TB of tb_bcd_counter is

    -- Component Declaration for the BCD Counter
    component BCD_Counter
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               seg_out : out STD_LOGIC_VECTOR(6 downto 0);
               anode : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    -- Constants declaration
    constant CLOCK_PERIOD : time := 1 ns;

    -- Signals declaration
    signal clk_tb : STD_LOGIC := '0';
    signal reset_tb : STD_LOGIC := '0';
    signal seg_out_tb : STD_LOGIC_VECTOR(6 downto 0);
    signal anode_tb : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Clock process
    clk_process: process
    begin
        while now < 100000 ns loop  -- Extend simulation duration to 100,000 ns
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
        wait for 100 ns;  -- Wait for some cycles to see the counter incrementing
        
        -- Wait for some time to observe the counter's behavior
        wait for 10 us;
        reset_tb <= '1';  -- Reset active
        wait for 20 ns;
        reset_tb <= '0';  -- Deactivate reset
        wait;
    end process stim_proc;

    -- Instantiate the BCD Counter
    UUT: BCD_Counter port map(
        clk => clk_tb,
        reset => reset_tb,
        seg_out => seg_out_tb,
        anode => anode_tb
    );

    -- Stimulus generation
    monitor_proc: process
    begin
        -- Monitor the seg_out signal
        while now < 100000 ns loop  -- Extend simulation duration to 100,000 ns
            wait until rising_edge(clk_tb);
            if reset_tb = '0' then
                -- Display the current counter value
                case seg_out_tb is
                    when "1000000" =>
                        report "Segment: 0" severity NOTE;
                    when "1111001" =>
                        report "Segment: 1" severity NOTE;
                    when "0100100" =>
                        report "Segment: 2" severity NOTE;
                    when "0000001" =>
                        report "Segment: 3" severity NOTE;
                    when others =>
                        report "Invalid segment" severity ERROR;
                end case;
            end if;
        end loop;
        wait;
    end process monitor_proc;

end TB;
