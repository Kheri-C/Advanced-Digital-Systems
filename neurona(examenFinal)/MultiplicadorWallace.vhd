library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	
entity MultiplicadorWallace is
	port(
		a: in std_logic_vector(3 downto 0);
		b: in std_logic_vector(3 downto 0);
		p: out std_logic_vector(7 downto 0)
	);
end MultiplicadorWallace;

architecture MultiplicaCuatroBits of MultiplicadorWallace is
   -- Componentes
	component MedioSumador is
		port(
			A,B: in std_logic;
			Sum,Carry: out std_logic
		);
	end component;
	component SumadorCompleto is
		port(
			A,B,Cin: in std_logic;
			S,Cout: out std_logic
		);
	end component;
	-- Señales
	signal a0b0,a0b1,a1b0,a0b2,a1b1,a2b0,a0b3,a1b2,a2b1,a1b3,a2b2,a3b1,a2b3,a3b2: std_logic;
	signal s1,c1,s2,c2,s3,c3,s4,c4,a3b0,s5,c5,a3b3: std_logic;
	signal s6,c6,s7,c7,s8,c8,s9,c9,s10,c10: std_logic;
	signal q0,q1,q2,q3: std_logic;
	signal extra: std_logic;
begin
	a0b0 <= A(0) and B(0);
	a0b1 <= A(0) and B(1);
	a1b0 <= A(1) and B(0);
	a0b2 <= A(0) and B(2);
	a1b1 <= A(1) and B(1);
	a2b0 <= A(2) and B(0);
	a0b3 <= A(0) and B(3);
	a1b2 <= A(1) and B(2);
	a2b1 <= A(2) and B(1);
	a1b3 <= A(1) and B(3);
	a2b2 <= A(2) and B(2);
	a3b1 <= A(3) and B(1);
	a2b3 <= A(2) and B(3);
	a3b2 <= A(3) and B(2);
	a3b0 <= A(3) and B(0);
	a3b3 <= A(3) and B(3);
	H0: MedioSumador port map(a0b1,a1b0,s1,c1);
	H1: MedioSumador port map(c1,s2,s6,c6);
	H2: MedioSumador port map(c2,s3,s7,c7);
	H3: MedioSumador port map(c6,s7,p(3),q0);
	H4: MedioSumador port map(a2b3,a3b2,s5,c5);
	H5: MedioSumador port map(c4,s5,s9,c9);
	H6: MedioSumador port map(c5,a3b3,s10,c10);
	H7: MedioSumador port map(q3,c10,p(7),extra);
	F0: SumadorCompleto port map(a0b2,a1b1,a2b0,s2,c2);
	F1: SumadorCompleto port map(a0b3,a1b2,a2b1,s3,c3);
	F2: SumadorCompleto port map(a1b3,a2b2,a3b1,s4,c4);
	F3: SumadorCompleto port map(c3,s4,a3b0,s8,c8);
	F4: SumadorCompleto port map(q0,c7,s8,p(4),q1);
	F5: SumadorCompleto port map(q1,c8,s9,p(5),q2);
	F6: SumadorCompleto port map(q2,c9,s10,p(6),q3);
	p(2) <= s6;
	p(1) <= s1;
	p(0) <= a0b0;
end MultiplicaCuatroBits;