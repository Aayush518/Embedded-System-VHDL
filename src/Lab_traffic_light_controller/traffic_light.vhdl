library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity traffic_light_controller is
    port(
        clk       : in  std_logic;
        reset     : in  std_logic;
        light_r   : out std_logic;
        light_y   : out std_logic;
        light_g   : out std_logic
    );
end entity traffic_light_controller;

architecture behavior of traffic_light_controller is
    type state_type is (RED, RED_YELLOW, GREEN, YELLOW);
    signal state, next_state : state_type;
    
    constant RED_DURATION    : integer := 50000000;
    constant YELLOW_DURATION : integer := 10000000;
    constant GREEN_DURATION  : integer := 50000000;
    
    signal counter : unsigned(25 downto 0) := (others => '0');

begin
    process(clk, reset)
    begin
        if reset = '1' then
            state <= RED;
            counter <= (others => '0');
        elsif rising_edge(clk) then
            state <= next_state;
            if state = next_state then
                counter <= counter + 1;
            else
                counter <= (others => '0');
            end if;
        end if;
    end process;

    process(state, counter)
    begin
        case state is
            when RED =>
                if counter = RED_DURATION then
                    next_state <= RED_YELLOW;
                else
                    next_state <= RED;
                end if;
            when RED_YELLOW =>
                if counter = YELLOW_DURATION then
                    next_state <= GREEN;
                else
                    next_state <= RED_YELLOW;
                end if;
            when GREEN =>
                if counter = GREEN_DURATION then
                    next_state <= YELLOW;
                else
                    next_state <= GREEN;
                end if;
            when YELLOW =>
                if counter = YELLOW_DURATION then
                    next_state <= RED;
                else
                    next_state <= YELLOW;
                end if;
            when others =>
                next_state <= RED;
        end case;
    end process;

    light_r <= '1' when state = RED or state = RED_YELLOW else '0';
    light_y <= '1' when state = YELLOW or state = RED_YELLOW else '0';
    light_g <= '1' when state = GREEN else '0';

end architecture behavior;
