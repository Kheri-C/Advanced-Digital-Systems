LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity fulladder is
	port (
		X : in std_logic;
		Y : in std_logic;
		Cin : in std_logic;
		S : out std_logic;
		Cout : out std_logic 
	);
end entity fulladder;

architecture BeH of fulladder is

begin

	S <= X xor Y xor Cin;
	Cout <= (X and Y) or (Cin and X) or (Cin and Y);
	
end architecture BeH;