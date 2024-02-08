library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder_n_to_2n is
    generic (
        N : integer := 2    -- Number of input lines (default is 2)
    );
    port (
        input : in std_logic_vector(N-1 downto 0);
        output : out std_logic_vector(2**N - 1 downto 0)
    );
end decoder_n_to_2n;

architecture behavioral of decoder_n_to_2n is
begin
    process(input)
        variable decoded_index : integer range 0 to 2**N - 1;
    begin
        decoded_index := to_integer(unsigned(input));
        output <= (others => '0');
        output(decoded_index) <= '1';
    end process;
end behavioral;
