library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity GCD is
  port
  (
    RESET      : in std_logic;
    CLK        : in std_logic;
    GO         : in std_logic;
    NUM1       : in integer;
    NUM2       : in integer;
    Result_GCD : out integer); -- Renamed the output signal to avoid name conflict
end GCD;
architecture Behavioral of GCD is
  type state is (START, INPUT, CALCULATE, OUTPUT);
  signal PS, NS : state;
  signal X, Y   : integer;

begin
  seq_proc : process (CLK, RESET)
  begin
    if (RESET = '1') then
      PS <= START;
    elsif (rising_edge(CLK)) then
      PS <= NS;
    end if;
  end process seq_proc;

  comb_proc : process (NUM1, NUM2, PS)
    variable A, B : integer;
  begin
    case PS is
      when START =>
        Result_GCD <= 0; -- Changed from GCD to Result_GCD
        NS         <= INPUT;
      when INPUT =>
        X  <= NUM1;
        Y  <= NUM2;
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
        Result_GCD <= A; -- Changed from GCD to Result_GCD
        NS         <= OUTPUT;
      when OUTPUT =>
        NS <= START;
      when others =>
        Result_GCD <= 0; -- Changed from GCD to Result_GCD
        NS         <= START;
    end case;

  end process comb_proc;
end Behavioral;