LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.NUMERIC_STD.ALL;
	USE IEEE.MATH_REAL.ALL;
	
entity Semaforo2 is
	port(
		clk: in std_logic;
		countReset: in std_logic;
		led: out std_logic_vector(2 downto 0);
		contador: out std_logic_vector(4 downto 0)
	);
end Semaforo2;

architecture prendeLuces of Semaforo2 is
	type FSM is (verde,amarillo,rojo);
	signal current_state: FSM;
	signal ledTemp : std_logic_vector(2 downto 0);
	signal contadorTemp : integer := 0;
begin
	process(clk,countReset)
		begin
			if countReset = '1' then
				contadorTemp <= 0;
			elsif rising_edge (clk)then
				if contadorTemp = 29 then
					contadorTemp <= 0;
				else
					contadorTemp <= contadorTemp + 1;
				end if;
			else
				contadorTemp <= contadorTemp;
			end if;
	end process;
	contador <= std_logic_vector(to_unsigned(contadorTemp,5));
	--
	process(clk,countReset,current_state,ledTemp)
		begin
			if rising_edge(clk) then
				case contadorTemp is
					when 0 =>
						ledTemp <= "001";
						current_state <= verde;
					when 15 =>
						ledTemp <= "010";
						current_state <= amarillo;
					when 20 =>
						ledTemp <= "100";
						current_state <= rojo;
					when others =>
						current_state <= current_state;
				end case;
			else
				current_state <= current_state;
				ledTemp <= ledTemp;
			end if;
	end process;	
	led <= ledTemp;
end prendeLuces;