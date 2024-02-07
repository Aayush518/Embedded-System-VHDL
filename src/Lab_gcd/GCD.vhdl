library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GCD is
    Port ( RESET : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           GO : in  STD_LOGIC;
           NUM1 : in  INTEGER;
           NUM2 : in  INTEGER;
           Result_GCD : out  INTEGER); -- Renamed the output signal to avoid name conflict
end GCD;


architecture Behavioral of GCD is
    type state is (START, INPUT, CALCULATE, OUTPUT);
    signal PS, NS: state;
    signal X, Y: INTEGER;

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
        variable A, B: INTEGER;
    begin
        case PS is
            when START =>
                Result_GCD <= 0;  -- Changed from GCD to Result_GCD
                NS <= INPUT;
            when INPUT =>
                X <= NUM1;
                Y <= NUM2;
                NS <= CALCULATE;
            when CALCULATE =>
                A := X;
                B := Y;
                while A /= B loop
                    if A > B then
                        A := A - B;
                    else
                        B := B - A;
                    end if;
                end loop;
                Result_GCD <= A;  -- Changed from GCD to Result_GCD
                NS <= OUTPUT;
            when OUTPUT =>
                NS <= START;
            when OTHERS =>
                Result_GCD <= 0;  -- Changed from GCD to Result_GCD
                NS <= START;
        end case;
        
    end process comb_proc;
end Behavioral;
