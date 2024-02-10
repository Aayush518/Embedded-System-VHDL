
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity traffic_light_controller is
	PORT ( reset : in std_logic;
		   clk : in std_logic;
		   start : in std_logic;
		   red : out std_logic;
		   yellow : out std_logic;                                                     
		   green : out std_logic );
end traffic_light_controller;

architecture Behavioral of traffic_light_controller is
TYPE State_type IS ( st_stop, st_red, st_redyel, st_green, st_yel );
SIGNAL state, next_state : State_type;
CONSTANT MAX_COUNT : integer := 10;
SUBTYPE Count_type IS integer RANGE 0 to MAX_COUNT-1;
SIGNAL await_clks : Count_type;

begin

	seq_p : PROCESS (clk)
	VARIABLE cnt : Count_type := 0;
	BEGIN
		IF rising_edge(clk) THEN
			IF reset='1' THEN
				state <= st_stop;
			ELSE
				IF cnt=await_clks THEN
					state <= next_state;
					cnt := 0;
				ELSE
					cnt := cnt + 1;	
				END IF;
			END IF;
		END IF;
	END PROCESS seq_p;
	
	
	cmb_p : PROCESS (state, start)
	VARIABLE cnt : Count_type := 0;
	BEGIN
		next_state <= state;
		await_clks <= 0;
		red <= '0';
		yellow <= '0';
		green <= '0';
		CASE state IS
			WHEN st_stop =>
				IF start='1' THEN
					next_state <= st_red;
				END IF;
				red <= '1';
			WHEN st_red => 
				red <= '1';
				await_clks <= 4;
				next_state <= st_redyel;
			WHEN st_redyel => 
				red <= '1';
				yellow <= '1';
				next_state <= st_green;
			WHEN st_green =>
				green <= '1';
				await_clks <= 5;
				next_state <= st_yel;
			WHEN st_yel =>
				IF start='1' THEN
					next_state <= st_red;
				ELSIF start='0' THEN
					next_state <= st_stop;
				END IF;
				yellow <= '1';
		END CASE;
	END PROCESS cmb_p;
	
end Behavioral;