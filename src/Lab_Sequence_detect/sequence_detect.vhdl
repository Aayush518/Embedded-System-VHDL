library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sequence_detect is
    Port ( clk, reset, input_bit : in  STD_LOGIC;
           output_detected : out  STD_LOGIC);
end sequence_detect;

architecture Behavioral of sequence_detect is
    type state_type is (S0, S1, S2, S3);
    signal current_state, next_state : state_type;
    signal prev_input : STD_LOGIC;

begin
    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= S0;
            prev_input <= '0';
        elsif rising_edge(clk) then
            current_state <= next_state;
            prev_input <= input_bit;
        end if;
    end process;

    process(current_state, input_bit)
    begin
        case current_state is
            when S0 =>
                if input_bit = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;
            when S1 =>
                if input_bit = '0' then
                    next_state <= S2;
                else
                    next_state <= S0;
                end if;
            when S2 =>
                if input_bit = '1' then
                    next_state <= S3;
                else
                    next_state <= S0;
                end if;
            when S3 =>
                if input_bit = '1' and prev_input = '0' then
                    next_state <= S0;
                else
                    next_state <= S3;
                end if;
            when others =>
                next_state <= S0;
        end case;
    end process;

    output_detected <= '1' when current_state = S3 else '0';

end Behavioral;
