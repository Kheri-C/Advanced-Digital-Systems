LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;

ENTITY LookaheadCarryAdder_tb IS
END ENTITY;

ARCHITECTURE tb OF LookaheadCarryAdder_tb IS

--- components DUTs
  component LookaheadCarryAdder is
    port(
		A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		C0: in std_logic;
		S: out std_logic_vector(3 downto 0);
		C4: out std_logic;
		PG: out std_logic;
		GG: out std_logic
	);
  end component;

--- constants
	constant 	clk_T			: 	time   :=20 ns;

---signals
	
	signal clk 	: std_logic;
	signal stop_clk	: boolean;

  signal A: std_logic_vector(3 downto 0);
  signal B: std_logic_vector(3 downto 0);
  signal C0: std_logic;
  signal S: std_logic_vector(3 downto 0);
  signal C4: std_logic;
  signal PG: std_logic;
  signal GG: std_logic;

begin


-- instances DUTs

  U0: LookaheadCarryAdder port map(A,B,C0,S,C4,PG,GG);

stimulus: process

  begin
    
  stop_clk  <= false;
  -- Put initialisation code here
  A <= "1010";
  B <= "1010";
  C0 <= '0';
  wait for 20 ns;

  A <= "1010";
  B <= "1010";
  C0 <= '1';
  wait for 20 ns;
  
  A <= "0101";
  B <= "0101";
  C0 <= '1';
  wait for 20 ns;
  
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