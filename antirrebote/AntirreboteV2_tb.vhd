LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;

ENTITY AntirreboteV2_tb IS
END ENTITY;

ARCHITECTURE tb OF AntirreboteV2_tb IS

--- components DUTs
  component AntirreboteV2 is
		port(
			clk: in std_logic;
			input: in std_logic;
			contador: out integer;
			output: out std_logic
		);
	end component;

--- constants
	constant 	clk_T			: 	time   :=20 ns;

---signals
	
	signal clk 	: std_logic;
	signal stop_clk	: boolean;

  signal input: std_logic;
  signal contador: integer;
  signal output: std_logic;

begin


-- instances DUTs

  U0: AntirreboteV2 port map(clk,input,contador,output);

stimulus: process

  begin
    
  stop_clk  <= false;
  -- Put initialisation code here
  input <= '0';
  
  wait for 100 ns;
  
  input <= '1';
  
  wait for 500 ns;
  
  input <= '0';
  
  wait for 600 ns;
  
  input <= '1';
  
  wait for 1100 ns;
  
  input <= '0';
  
  wait for 500 ns;
  
  input <= '1';
  
  wait for 600 ns;
  
  input <= '0';
  
  wait for 1100 ns;


	stop_clk <= true;

  wait;
  end process; --stimulus

clocking: process
  begin
    while NOT stop_clk loop
      clk <= '1', '0' after clk_T / 2;
      wait for clk_T;
    end loop;
    wait;
  end process; --clocking

end tb;