library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_tb is
end decoder_tb;

architecture Behavioral of decoder_tb is
    -- Component declaration for the DUT (Design Under Test)
    component decoder
        Port ( input : in  STD_LOGIC_VECTOR (1 downto 0);
               output : out  STD_LOGIC_VECTOR (3 downto 0));
    end component;

    -- Signals declaration
    signal input_signal : STD_LOGIC_VECTOR(1 downto 0);
    signal output_signal : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instantiate the DUT
    DUT: decoder port map (
        input => input_signal,
        output => output_signal
    );

    -- Stimulus process
    stimulus_process: process
    begin
        -- Test case 1: input "00"
        input_signal <= "00";
        wait for 10 ns;
        
        -- Test case 2: input "01"
        input_signal <= "01";
        wait for 10 ns;

        -- Test case 3: input "10"
        input_signal <= "10";
        wait for 10 ns;

        -- Test case 4: input "11"
        input_signal <= "11";
        wait for 10 ns;

        -- End of testbench
        wait;
    end process;

end Behavioral;
