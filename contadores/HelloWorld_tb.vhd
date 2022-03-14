LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;

ENTITY HelloWorld_tb IS
END ENTITY;

ARCHITECTURE tb OF HelloWorld_tb IS

--- components DUTs
component HelloWorld is
	port(
		entrada: in std_logic_vector(13 downto 0);
		salidaCero: out std_logic_vector(3 downto 0);
		salidaUno: out std_logic_vector(3 downto 0);
		salidaDos: out std_logic_vector(3 downto 0);
		salidaTres: out std_logic_vector(3 downto 0)
	);
end component;

--- constants
	constant 	clk_T			: 	time   :=20 ns;

---signals
	
	signal clk : std_logic;
	signal stop_clk: boolean;

	signal entrada: std_logic_vector(13 downto 0);
	signal salidaCero: std_logic_vector(3 downto 0);
	signal salidaUno: std_logic_vector(3 downto 0);
	signal salidaDos: std_logic_vector(3 downto 0);
	signal salidaTres: std_logic_vector(3 downto 0);

begin

-- instances DUTs

U0: HelloWorld port map(entrada,salidaCero,salidaUno,salidaDos,salidaTres);

stimulus: process

  begin

   stop_clk  <= false;
  -- Put initialisation code here
  entrada <= "01000010010010";
  
  wait for 20 ns;
  
  entrada <= "00010011010010";
  
  wait for 20 ns;
  
  entrada <= "01111010111011";
  
  wait for 20 ns;
  
  entrada <= "01100100000101";
  
  wait for 20 ns;
  
  entrada <= "00110111111010";
  
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