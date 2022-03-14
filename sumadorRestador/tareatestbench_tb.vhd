LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;

ENTITY tareatestbench_tb IS
END ENTITY;

ARCHITECTURE tb OF tareatestbench_tb IS

--- components DUTs
component tareatestbench is
  port(A,B: in std_logic_vector(3 downto 0);
      Sum: in std_logic;
      S: out std_logic_vector(3 downto 0);
      Cout: out std_logic
  );
end component;

--- constants
	constant 	clk_T			: 	time   :=20 ns;

---signals
	
	signal clk : std_logic;
	signal stop_clk: boolean;

  signal A: std_logic_vector(3 downto 0);
  signal B: std_logic_vector(3 downto 0);
  signal Sum: std_logic;
  signal S: std_logic_vector(3 downto 0);
  signal Cout: std_logic;

begin


-- instances DUTs

U0: tareatestbench port map(A,B,Sum,S,Cout);

stimulus: process

  begin
    
  stop_clk  <= false;
  -- Put initialisation code here
  A <= "1100";
  B <= "0110";
  Sum <= '0';

  wait for 160 ns;

  A <= "0001";
  B <= "1010";
  Sum <= '1';

  wait for 240 ns;

  A <= "1000";
  B <= "0011";
  Sum <= '1';

  wait for 60 ns;

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