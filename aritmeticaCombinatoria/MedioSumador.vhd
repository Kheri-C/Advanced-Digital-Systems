library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	
entity MedioSumador is
	port(
		A,B: in std_logic;
		Sum,Carry: out std_logic
	);
end MedioSumador;

architecture SumaDosBits of MedioSumador is
	begin
		Sum <= A xor B;
		Carry <= A and B;
end SumaDosBits;