LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;

ENTITY MemoryMasterV2_tb IS
END ENTITY;

ARCHITECTURE tb OF MemoryMasterV2_tb IS

--- components DUTs
  component MemoryMasterV2 is
		port(
			clk: in std_logic;
			enable: in std_logic;
			nRST: in std_logic;
			data_out: out std_logic_vector(7 downto 0);
			-- Salidas de monitoreo
			ROMtoRAM: out std_logic_vector(7 downto 0);
			state: out std_logic_vector(2 downto 0);
			contador: out integer;
			--
			busy: out std_logic
		);
	end component;

--- constants
	constant 	clk_T			: 	time   :=20 ns;

---signals
	
	signal clk 	: std_logic;
	signal stop_clk	: boolean;

	signal enable: std_logic;
	signal nRST: std_logic;
	signal data_out: std_logic_vector(7 downto 0);
	-- Salidas de monitoreo
	signal ROMtoRAM: std_logic_vector(7 downto 0);
	signal state: std_logic_vector(2 downto 0);
	signal contador: integer;
	--
	signal busy: std_logic;

begin


-- instances DUTs

  U0: MemoryMasterV2 port map(clk,enable,nRST,data_out,ROMtoRAM,state,contador,busy);

stimulus: process

  begin
    
  stop_clk  <= false;
  -- Put initialisation code here
  nRST <= '0';
  
  wait for 20 ns;
  
  nRST <= '1';
  enable <= '0';
  
  wait for 20 ns;
  
  enable <= '1';
  
  wait for 600 ns;


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