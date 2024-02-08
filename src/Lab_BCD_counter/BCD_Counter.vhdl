library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_Counter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           seg_out : out STD_LOGIC_VECTOR(6 downto 0);
           anode : out STD_LOGIC_VECTOR(3 downto 0));
end BCD_Counter;

architecture Behavioral of BCD_Counter is
    signal counter : integer range 0 to 9999 := 0;
    signal bcd : STD_LOGIC_VECTOR(15 downto 0);
    signal digit : STD_LOGIC_VECTOR(3 downto 0);
    signal disp_en : STD_LOGIC := '1';

begin

    process(clk, reset)
    begin
        if reset = '1' then
            counter <= 0;
        elsif rising_edge(clk) then
            if counter < 9999 then
                counter <= counter + 1;
            else
                counter <= 0;
            end if;
        end if;
    end process;

    process(counter)
    begin
        bcd <= std_logic_vector(to_unsigned(counter, 16));
    end process;

    process(bcd)
    begin
        case bcd(15 downto 12) is
            when "0000" =>
                digit <= "0001";
            when "0001" =>
                digit <= "0010";
            when "0010" =>
                digit <= "0100";
            when "0011" =>
                digit <= "1000";
            when others =>
                digit <= "0000";
        end case;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            if disp_en = '1' then
                case digit is
                    when "0001" =>
                        seg_out <= "1000000";
                        anode <= "1110";
                    when "0010" =>
                        seg_out <= "1111001";
                        anode <= "1101";
                    when "0100" =>
                        seg_out <= "0100100";
                        anode <= "1011";
                    when "1000" =>
                        seg_out <= "0000001";
                        anode <= "0111";
                    when others =>
                        seg_out <= "1111111";
                        anode <= "1111";
                end case;
            else
                seg_out <= "1111111";
                anode <= "1111";
            end if;
        end if;
    end process;

end Behavioral;
