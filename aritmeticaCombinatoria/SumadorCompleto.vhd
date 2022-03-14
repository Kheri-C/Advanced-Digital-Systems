library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;

entity SumadorCompleto is
	port(
		A,B,Cin: in std_logic;
		S,Cout: out std_logic
	);
end SumadorCompleto;

architecture SumaTresBits of SumadorCompleto is
begin
	S <= (A and (not B) and (not Cin)) or
		  ((not A) and B and (not Cin)) or
		  ((not A) and (not B) and Cin) or
		  (A and B and Cin);
	Cout <= ((not A) and B and Cin) or
			  (A and (not B) and Cin) or
			  (A and B and (not Cin)) or
			  (A and B and Cin);
end SumaTresBits;