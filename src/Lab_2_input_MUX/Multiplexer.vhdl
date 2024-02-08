library ieee;
use ieee.std_logic_1164.all;

entity mux2to1 is
    port (
        a, b: in std_logic;
        sel: in std_logic;
        y: out std_logic
    );
end mux2to1;

architecture behavioral of mux2to1 is
begin
    process (a, b, sel)
    begin
        if sel = '0' then
            y <= a;
        else
            y <= b;
        end if;
    end process;
end behavioral;
