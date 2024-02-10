library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_traffic_light_controller is
end tb_traffic_light_controller;

architecture Behavioral of tb_traffic_light_controller is
  -- Corrected component declaration with a different name
  COMPONENT traffic_light_controller 
    PORT ( 
      reset : in std_logic;
      clk : in std_logic;
      start : in std_logic;
      red : out std_logic;
      yellow : out std_logic;
      green : out std_logic
    );
  END COMPONENT traffic_light_controller;

  -- Signals for testbench
  SIGNAL reset_tb : std_logic := '0';
  SIGNAL clk_tb : std_logic := '0';
  SIGNAL start_tb : std_logic := '0';
  SIGNAL red_tb : std_logic := '0';
  SIGNAL yellow_tb : std_logic := '0';
  SIGNAL green_tb : std_logic := '0';

  -- Constant for clock period
  CONSTANT clk_period : time := 10 ns;
begin

  -- Instantiate the correct entity
  uut : traffic_light_controller 
    PORT MAP ( 
      reset => reset_tb,
      clk => clk_tb, 
      start => start_tb,
      red => red_tb,
      yellow => yellow_tb, 
      green => green_tb
    );
   
  -- Clock generation process
  clk_p : PROCESS
  BEGIN
    clk_tb <= '0';
    wait for clk_period / 2;
    clk_tb <= '1';
    wait for clk_period / 2;  
  END PROCESS clk_p;
  
  -- Stimulus process
  stim_p : PROCESS
  BEGIN
    wait for clk_period;
    reset_tb <= '1';
    wait for clk_period;
    reset_tb <= '0';
    wait for clk_period;
    start_tb <= '1';
    wait for clk_period;
    start_tb <= '0';
    wait for clk_period;
    report "tlctsm simulation done.";
    wait;
  END PROCESS stim_p;

end Behavioral;
