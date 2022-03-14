library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contadorModuloDiez is
	port(
		clk: in std_logic;
		reset: in std_logic;
		load: in std_logic;
		data: in std_logic_vector(3 downto 0);
		counter: out std_logic_vector(3 downto 0)
	);
end contadorModuloDiez;

architecture cuentaCeroaNueve of contadorModuloDiez is
	signal cnt_temp: unsigned(3 downto 0);
begin
	process(load,reset,clk,cnt_temp,data)
		begin
			if reset = '1' then
				cnt_temp <= "0000";
			elsif load = '1' then
				cnt_temp <= unsigned(data);
			elsif  rising_edge(clk) then
				if cnt_temp = "1001" then
				cnt_temp <= "0000";
				else
				cnt_temp <= cnt_temp + 1;
				end if;
			else
				cnt_temp <= cnt_temp;
			end if;
	end process;
	counter <= std_logic_vector(cnt_temp);
end cuentaCeroaNueve;