library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_decoder is
end tb_decoder;

architecture TB of tb_decoder is

    -- Constants declaration
    constant N_VALUE : integer := 2; -- Set the value of N here

    -- Signals declaration
    signal input_tb : std_logic_vector(N_VALUE - 1 downto 0);
    signal output_tb : std_logic_vector(2**N_VALUE - 1 downto 0);

begin

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: input = "00"
        input_tb <= "00";
        wait for 10 ns;
        
        -- Test case 2: input = "01"
        input_tb <= "01";
        wait for 10 ns;
        
        -- Test case 3: input = "10"
        input_tb <= "10";
        wait for 10 ns;
        
        -- Test case 4: input = "11"
        input_tb <= "11";
        wait for 10 ns;
        
        wait;
    end process stim_proc;

    -- Instantiate the decoder_n_to_2n module
    UUT: entity work.decoder_n_to_2n
        generic map (
            N => N_VALUE
        )
        port map (
            input => input_tb,
            output => output_tb
        );

    -- Output observation
    observe_output: process
    begin
        wait until input_tb'event;
        report "Output: ";
        for i in output_tb'range loop
            report std_logic'image(output_tb(i)) severity NOTE;
        end loop;
        wait;
    end process observe_output;


end TB;
