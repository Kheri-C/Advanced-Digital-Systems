library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.NUMERIC_STD.ALL;

entity ROM is --8x8
	port(
		address: in std_logic_vector(2 downto 0);
		data_out: out std_logic_vector(7 downto 0)
	);
end ROM;

architecture soloGuardaInfo of ROM is
	type romtable is array (0 to 7) of std_logic_vector(7 downto 0);
	constant romdata: romtable := (
		"11110000","11100001",
		"11010010","11000011",
		"10110100","10100101",
		"10010110","10000111"
	);
begin
	process(address)
		begin
			data_out <= romdata(to_integer(unsigned(address)));
		end process;
end soloGuardaInfo;
	