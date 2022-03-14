library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.NUMERIC_STD.ALL;
	
entity NeuronaArtificial is
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
end NeuronaArtificial;

architecture Piensa of NeuronaArtificial is
	-- Componentes
	component MultiplicadorWallace is
		port(
			a: in std_logic_vector(3 downto 0);
			b: in std_logic_vector(3 downto 0);
			p: out std_logic_vector(7 downto 0)
		);
	end component;
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
	-- Señales
	signal P0: std_logic_vector(7 downto 0);
	signal P1: std_logic_vector(7 downto 0);
	signal cero: std_logic;
	signal P0_0: std_logic_vector(3 downto 0);
	signal P0_1: std_logic_vector(3 downto 0);
	signal P1_0: std_logic_vector(3 downto 0);
	signal P1_1: std_logic_vector(3 downto 0);
	signal Sum_0: std_logic_vector(3 downto 0);
	signal Sum_1: std_logic_vector(3 downto 0);
	signal Sum: std_logic_vector(7 downto 0);
	signal C4_0: std_logic;
	signal C4_1: std_logic;
	signal PG_0: std_logic;
	signal PG_1: std_logic;
	signal GG_0: std_logic;
	signal GG_1: std_logic;
	signal SumaInt: integer;
	signal signalS: std_logic;
begin
	M0: MultiplicadorWallace port map(A,W1,P0);
	M1: MultiplicadorWallace port map(B,W2,P1);
	S0: LookaheadCarryAdder port map(P0_0,P1_0,cero,Sum_0,C4_0,PG_0,GG_0);
	S1: LookaheadCarryAdder port map(P0_1,P1_1,C4_0,Sum_1,C4_1,PG_1,GG_1);
	process(nRST,A,B,W1,W2,clk)
	begin
		if(nRST = '0') then -- Si reseteamos el dispositivo
			signalS <= 'Z';
		else -- Si no reseteamos el dispositivo
			SumaInt <= to_integer(unsigned(Sum));	
			if(SumaInt < 35) then
				signalS <= '0';
			else
				signalS <= '1';
			end if;
		end if;
	end process;
	cero <= '0';
	P0_0(0) <= P0(0);
	P0_0(1) <= P0(1);
	P0_0(2) <= P0(2);
	P0_0(3) <= P0(3);
	P0_1(0) <= P0(4);
	P0_1(1) <= P0(5);
	P0_1(2) <= P0(6);
	P0_1(3) <= P0(7);
	P1_0(0) <= P1(0);
	P1_0(1) <= P1(1);
	P1_0(2) <= P1(2);
	P1_0(3) <= P1(3);
	P1_1(0) <= P1(4);
	P1_1(1) <= P1(5);
	P1_1(2) <= P1(6);
	P1_1(3) <= P1(7);
	Sum(0) <= Sum_0(0);
	Sum(1) <= Sum_0(1);
	Sum(2) <= Sum_0(2);
	Sum(3) <= Sum_0(3);
	Sum(4) <= Sum_1(0);
	Sum(5) <= Sum_1(1);
	Sum(6) <= Sum_1(2);
	Sum(7) <= Sum_1(3);
	S <= signalS;
end Piensa;