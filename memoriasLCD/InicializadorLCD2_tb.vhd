LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;

ENTITY InicializadorLCD2_tb IS
END ENTITY;

ARCHITECTURE tb OF InicializadorLCD2_tb IS

--- components DUTs
  component InicializadorLCD2 is
	port(
		clk: in std_logic;
		RS: out std_logic;
		RW: out std_logic;
		E: out std_logic;
		D: out std_logic_vector(7 downto 0)
	);
end component;

--- constants
	constant 	clk_T			: 	time   :=20 ns;

---signals
	
	signal clk 	: std_logic;
	signal stop_clk	: boolean;

  signal RS: std_logic;
  signal RW: std_logic;
  signal E: std_logic;
  signal D: std_logic_vector(7 downto 0);

begin


-- instances DUTs

  U0: InicializadorLCD2 port map(clk,RS,RW,E,D);

stimulus: process

  begin
    
  stop_clk  <= false;
  -- Put initialisation code here


  wait for 160 ns;


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