library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	
entity LookaheadCarryAdder is
	port(
		A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		C0: in std_logic;
		S: out std_logic_vector(3 downto 0);
		C4: out std_logic;
		PG: out std_logic;
		GG: out std_logic
	);
end LookaheadCarryAdder;

architecture precalculaCarry of LookaheadCarryAdder is
	component FullAdderK is
		port(
		A,B,Cin: in std_logic;
		S,G,P: out std_logic
	);
	end component;
	signal p0,g0: std_logic;
	signal p1,g1,c1: std_logic;
	signal p2,g2,c2: std_logic;
	signal p3,g3,c3: std_logic;
	--
	begin
		U0: FullAdderK port map(A(0),B(0),C0,S(0),g0,p0);
		U1: FullAdderK port map(A(1),B(1),c1,S(1),g1,p1);
		U2: FullAdderK port map(A(2),B(2),c2,S(2),g2,p2);
		U3: FullAdderK port map(A(3),B(3),c3,S(3),g3,p3);
		c1 <= g0 or (p0 and C0);
		c2 <= g1 or (g0 and p1) or (C0 and p0 and p1);
		c3 <= g2 or (g1 and p2) or (g0 and p1 and p2) or (C0 and p0 and p1 and p2);
		C4 <= g3 or (g2 and p3) or (g1 and p2 and p3) or (g0 and p1 and p2 and p3) or (C0 and p0 and p1 and p2 and p3);
		PG <= p0 and p1 and p2 and p2;
		GG <= g3 or (g2 and p3) or (g1 and p3 and p2) or (g0 and p3 and p2 and p1);
end precalculaCarry;