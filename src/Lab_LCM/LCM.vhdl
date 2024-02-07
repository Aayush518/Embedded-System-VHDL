library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LCM is
    Port ( RESET : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           NUM1 : in  INTEGER;
           NUM2 : in  INTEGER;
           LCM_Result : out  INTEGER);
end LCM;

architecture Behavioral of LCM is
    type state is (START, INPUT, CHECK, UPDATE_X, UPDATE_Y, CALCULATE, OUTPUT);
    signal PS, NS: state;
    signal X, Y, GCD: INTEGER;
begin
    seq_proc: process(CLK, RESET)
    begin
        if (RESET = '1') then 
            PS <= START;
        elsif (rising_edge(CLK)) then 
            PS <= NS;
        end if;
    end process seq_proc;

    comb_proc: process(NUM1, NUM2, PS)
    begin
        case PS is
            when START =>
                LCM_Result <= 0;
                NS <= INPUT;
            when INPUT =>
                X <= NUM1;
                Y <= NUM2;
                NS <= CHECK;
            when CHECK =>
                if (X > Y) then 
                    NS <= UPDATE_X;
                elsif (X < Y) then 
                    NS <= UPDATE_Y;
                else 
                    NS <= CALCULATE;
                end if;
            when UPDATE_X =>
                X <= X - Y;
                NS <= CHECK;
            when UPDATE_Y =>
                Y <= Y - X;
                NS <= CHECK;
            when CALCULATE =>
                GCD <= X;
                NS <= OUTPUT;
            when OUTPUT =>
                LCM_Result <= (NUM1 * NUM2) / GCD;
                NS <= START;
            when OTHERS =>
                LCM_Result <= 0;
                NS <= START;
        end case;
    end process comb_proc;
end Behavioral;
