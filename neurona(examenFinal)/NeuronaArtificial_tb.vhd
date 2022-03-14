LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;

ENTITY NeuronaArtificial_tb IS
END ENTITY;

ARCHITECTURE tb OF NeuronaArtificial_tb IS

--- components DUTs
  component NeuronaArtificial is
		port(
		clk: in std_logic;
		nRST: in std_logic;
		A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		W1: in std_logic_vector(3 downto 0);
		W2: in std_logic_vector(3 downto 0);
		--MOnitoreo
		S: out std_logic
	);
	end component;

--- constants
	constant 	clk_T			: 	time   :=20 ns;

---signals
	
	signal clk 	: std_logic;
	signal stop_clk	: boolean;

	signal nRST: std_logic;
	signal A: std_logic_vector(3 downto 0);
	signal B: std_logic_vector(3 downto 0);
	signal W1: std_logic_vector(3 downto 0);
	signal W2: std_logic_vector(3 downto 0);
	signal S: std_logic;

begin


-- instances DUTs

  U0: NeuronaArtificial port map(clk,nRST,A,B,W1,W2,S);

stimulus: process

	begin
	    
	  stop_clk  <= false;
	  -- Put initialisation code here
		A <= "0110";
		B <= "1001";
		W1 <= "0011";
		W2 <= "0101";
		nRST <= '0';
	  
	    wait for 500 ns;
		 
		A <= "0110";
		B <= "1001";
		W1 <= "0011";
		W2 <= "0101";
		nRST <= '1';

	    wait for 500 ns;
		 
		A <= "0010";
		B <= "0100";
		W1 <= "0011";
		W2 <= "0101";
		nRST <= '1';

	    wait for 500 ns;
		 
	   A <= "1010";
		B <= "0001";
		W1 <= "0011";
		W2 <= "0101";
		nRST <= '1';

	    wait for 500 ns;

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