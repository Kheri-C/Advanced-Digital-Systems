library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.NUMERIC_STD.ALL;
	
entity RAM is
	port(
		nWriteEnable: in std_logic;
		nChipSelect: in std_logic;
		nOutputEnable: in std_logic;
		address: in std_logic_vector(2 downto 0);
		data: inout std_logic_vector(7 downto 0)
	);
end RAM;

architecture leeYEscribeDatos of RAM is
	type ramtable is array (0 to 7) of std_logic_vector(7 downto 0);
	signal ramdata: ramtable; -- := (others => (others => '1'));
begin
	process(nWriteEnable,nChipSelect,nOutputEnable)
		begin
			if(nChipSelect = '0') then 
				if(nWriteEnable = '0') then
					ramdata(to_integer(unsigned(address))) <= data;
				else
					if(nOutputEnable = '0') then
						data <= ramdata(to_integer(unsigned(address)));
					else
						data <= (others => 'Z');
					end if;
				end if;
			else
				data <= (others => 'Z');
			end if;
	end process;
end leeYEscribeDatos;
			