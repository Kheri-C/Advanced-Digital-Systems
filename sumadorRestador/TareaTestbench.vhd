LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity tareatestbench is
	port(A,B: in std_logic_vector(3 downto 0);
		  Sum: in std_logic;
		  S: out std_logic_vector(3 downto 0);
		  Cout: out std_logic
	);
end tareatestbench;

architecture sumadorrestador of tareatestbench is
	signal aux0,aux1,aux2,aux3,aux4,aux5,aux6: std_logic;
	component fulladder is
		port (
			X : in std_logic;
			Y : in std_logic;
			Cin : in std_logic;
			S : out std_logic;
			Cout : out std_logic 
		);
	end component;
	begin
		aux0 <= B(0) xor Sum;
		aux1 <= B(1) xor Sum;
		aux2 <= B(2) xor Sum;
		aux3 <= B(3) xor Sum;
		u0: fulladder port map(A(0),aux0,Sum,S(0),aux4);
		u1: fulladder port map(A(1),aux1,aux4,S(1),aux5);
		u2: fulladder port map(A(2),aux2,aux5,S(2),aux6);
		u3: fulladder port map(A(3),aux3,aux6,S(3),Cout);
end sumadorrestador;