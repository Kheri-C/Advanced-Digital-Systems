library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	
entity FullAdderK is
	port(
		A,B,Cin: in std_logic;
		S,G,P: out std_logic
	);
end FullAdderK;

architecture Suma of FullAdderK is
	begin
		S <= (A xor B xor Cin)or(A and B and Cin);
		G <= A and B;
		P <= (A or B) and Cin;
end Suma;	