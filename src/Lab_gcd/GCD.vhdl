
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GCD is
    Port ( RESET : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           GO : in  STD_LOGIC;
           NUM1 : in  INTEGER;
           NUM2 : in  INTEGER;
           GCD : out  INTEGER);
end GCD;

architecture Behavioral of GCD is

type state is (START,INPUT,CHECK,UPDATE_X,UPDATE_Y,OUTPUT);

signal PS,NS:state;

begin

seq_proc:process(CLK,GO,RESET)
begin
if (GO='1') then
    if (RESET = '1') then 
	   PS<=START;
	 elsif (rising_edge(CLK)) then 
	   PS<=NS;
	 end if;
end if;
end process seq_proc;

comb_proc: process(NUM1,NUM2,PS) variable X,Y:integer;

begin

case PS is

 when START=>
     GCD<=0;
	  NS<=INPUT;

 when INPUT=>
     X:=NUM1;
     Y:=NUM2;
     NS<=CHECK;	  
	  
 when CHECK=>
     if (X>Y) then NS<=UPDATE_X;
	  elsif(X<Y) then NS<=UPDATE_Y;
	  else NS<=OUTPUT;
	  end if;
	  
 when UPDATE_X=>
     X:=X-Y;
     NS<=CHECK;
	  
 when UPDATE_Y=>
     Y:=Y-X;
     NS<=CHECK;
	  
 when OUTPUT=>
     GCD<=X;
	  NS<=INPUT;
	  
 when OTHERS=>
     GCD<=0;
     NS<=INPUT;	  
	  
end case;
end process comb_proc;
end Behavioral;
