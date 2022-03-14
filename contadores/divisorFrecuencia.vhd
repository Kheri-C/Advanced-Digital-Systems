library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divisorFrecuencia is
	port(
		clk_in: in std_logic;
		clk_out: out std_logic
	);
end divisorFrecuencia;

architecture divideFrecuencia of divisorFrecuencia is
	signal count_temp: integer;
	signal clk_temp: std_logic;
begin
	process(clk_in,count_temp,clk_temp)
		begin
			if(rising_edge(clk_in)) then
				if(count_temp = 24999999) then
					clk_temp <= not clk_temp;
					count_temp <= 0;
				else
					clk_temp <= clk_temp;
					count_temp <= count_temp + 1;
				end if;
			else
				count_temp <= count_temp;
			end if;
	end process;
	clk_out <= clk_temp;
end divideFrecuencia;