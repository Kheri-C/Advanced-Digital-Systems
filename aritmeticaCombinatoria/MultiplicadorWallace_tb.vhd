LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;

ENTITY MultiplicadorWallace_tb IS
END ENTITY;

ARCHITECTURE tb OF MultiplicadorWallace_tb IS

--- components DUTs
  component MultiplicadorWallace is
	 port(
	   a: in std_logic_vector(3 downto 0);
		b: in std_logic_vector(3 downto 0);
		p: out std_logic_vector(7 downto 0)
	);
  end component;

--- constants
	constant 	clk_T			: 	time   :=20 ns;

---signals
	
	signal clk 	: std_logic;
	signal stop_clk	: boolean;

  signal a: std_logic_vector(3 downto 0);
  signal b: std_logic_vector(3 downto 0);
  signal p: std_logic_vector(7 downto 0);

begin


-- instances DUTs

  U0: MultiplicadorWallace port map(a,b,p);

stimulus: process

  begin
    
  stop_clk  <= false;
  -- Put initialisation code here
  a <= "0101";
  b <= "0101";

  wait for 20 ns;

  a <= "1111";
  b <= "1111";

  wait for 20 ns;
  
  a <= "0001";
  b <= "0001";

  wait for 20 ns;

  a <= "0011";
  b <= "0101";

  wait for 20 ns;
  
  a <= "1010";
  b <= "1010";

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