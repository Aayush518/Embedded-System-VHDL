library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder is
    Port ( input : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end decoder;

architecture Behavioral of decoder is
begin
    process(input)
    begin
        case input is
            when "00" =>
                output <= "0001";
            when "01" =>
                output <= "0010";
            when "10" =>
                output <= "0100";
            when "11" =>
                output <= "1000";
            when others =>
                output <= (others => '0');
        end case;
    end process;
end Behavioral;
