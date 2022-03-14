LIBRARY IEEE;
	use IEEE.STD_LOGIC_1164.all;
	use IEEE.NUMERIC_STD.ALL;
	
entity HelloWorld is 
	port(
		entrada: in std_logic_vector(13 downto 0);
		salidaCero: out std_logic_vector(3 downto 0);
		salidaUno: out std_logic_vector(3 downto 0);
		salidaDos: out std_logic_vector(3 downto 0);
		salidaTres: out std_logic_vector(3 downto 0)
	);
end HelloWorld;

architecture RTL of HelloWorld is
	--signal intermedioEntrada: unsigned (13 downto 0);
	signal numeroEntrada: integer;
	signal numeroSalidaCero: std_logic_vector(3 downto 0);
	signal numeroSalidaUno: std_logic_vector(3 downto 0);
	signal numeroSalidaDos: std_logic_vector(3 downto 0);
	signal numeroSalidaTres: std_logic_vector(3 downto 0);
begin
	numeroEntrada <= to_integer(signed(entrada));
	process(numeroEntrada)
		variable numeroModificar: integer;
		begin
			numeroModificar := numeroEntrada;
			if numeroModificar < 1000 then
				numeroSalidaTres <= "0000";
			elsif numeroModificar < 2000 then
				numeroModificar := numeroModificar - 1000;
				numeroSalidaTres <= "0001";
			elsif numeroModificar < 3000 then
				numeroModificar := numeroModificar - 2000;
				numeroSalidaTres <= "0010";
			elsif numeroModificar < 4000 then
				numeroModificar := numeroModificar - 3000;
				numeroSalidaTres <= "0011";
			elsif numeroModificar < 5000 then
				numeroModificar := numeroModificar - 4000;
				numeroSalidaTres <= "0100";
			elsif numeroModificar < 6000 then
				numeroModificar := numeroModificar - 5000;
				numeroSalidaTres <= "0101";
			elsif numeroModificar < 7000 then
				numeroModificar := numeroModificar - 6000;
				numeroSalidaTres <= "0110";
			elsif numeroModificar < 8000 then
				numeroModificar := numeroModificar - 7000;
				numeroSalidaTres <= "0111";
			elsif numeroModificar < 9000 then
				numeroModificar := numeroModificar - 8000;
				numeroSalidaTres <= "1000";
			elsif numeroModificar < 10000 then
				numeroModificar := numeroModificar - 9000;
				numeroSalidaTres <= "1001";
			end if;
			if numeroModificar < 100 then
				numeroSalidaDos <= "0000";
			elsif numeroModificar < 200 then
				numeroModificar := numeroModificar - 100;
				numeroSalidaDos <= "0001";
			elsif numeroModificar < 300 then
				numeroModificar := numeroModificar - 200;
				numeroSalidaDos <= "0010";
			elsif numeroModificar < 400 then
				numeroModificar := numeroModificar - 300;
				numeroSalidaDos <= "0011";
			elsif numeroModificar < 500 then
				numeroModificar := numeroModificar - 400;
				numeroSalidaDos <= "0100";
			elsif numeroModificar < 600 then
				numeroModificar := numeroModificar - 500;
				numeroSalidaDos <= "0101";
			elsif numeroModificar < 700 then
				numeroModificar := numeroModificar - 600;
				numeroSalidaDos <= "0110";
			elsif numeroModificar < 800 then
				numeroModificar := numeroModificar - 700;
				numeroSalidaDos <= "0111";
			elsif numeroModificar < 900 then
				numeroModificar := numeroModificar - 800;
				numeroSalidaDos <= "1000";
			elsif numeroModificar < 1000 then
				numeroModificar := numeroModificar - 900;
				numeroSalidaDos <= "1001";
			end if;
			if numeroModificar < 10 then
				numeroSalidaUno <= "0000";
			elsif numeroModificar < 20 then
				numeroModificar := numeroModificar - 10;
				numeroSalidaUno <= "0001";
			elsif numeroModificar < 30 then
				numeroModificar := numeroModificar - 20;
				numeroSalidaUno <= "0010";
			elsif numeroModificar < 40 then
				numeroModificar := numeroModificar - 30;
				numeroSalidaUno <= "0011";
			elsif numeroModificar < 50 then
				numeroModificar := numeroModificar - 40;
				numeroSalidaUno <= "0100";
			elsif numeroModificar < 60 then
				numeroModificar := numeroModificar - 50;
				numeroSalidaUno <= "0101";
			elsif numeroModificar < 70 then
				numeroModificar := numeroModificar - 60;
				numeroSalidaUno <= "0110";
			elsif numeroModificar < 80 then
				numeroModificar := numeroModificar - 70;
				numeroSalidaUno <= "0111";
			elsif numeroModificar < 90 then
				numeroModificar := numeroModificar - 80;
				numeroSalidaUno <= "1000";
			elsif numeroModificar < 100 then
				numeroModificar := numeroModificar - 90;
				numeroSalidaUno <= "1001";
			end if;
			if numeroModificar < 1 then
				numeroSalidaCero <= "0000";
			elsif numeroModificar < 2 then
				numeroSalidaCero <= "0001";
			elsif numeroModificar < 3 then
				numeroSalidaCero <= "0010";
			elsif numeroModificar < 4 then
				numeroSalidaCero <= "0011";
			elsif numeroModificar < 5 then
				numeroSalidaCero <= "0100";
			elsif numeroModificar < 6 then
				numeroSalidaCero <= "0101";
			elsif numeroModificar < 7 then
				numeroSalidaCero <= "0110";
			elsif numeroModificar < 8 then
				numeroSalidaCero <= "0111";
			elsif numeroModificar < 9 then
				numeroSalidaCero <= "1000";
			elsif numeroModificar < 10 then
				numeroSalidaCero <= "1001";
			end if;
	end process;

	salidaCero <= numeroSalidaCero;
	salidaUno <= numeroSalidaUno;
	salidaDos <= numeroSalidaDos;
	salidaTres <= numeroSalidaTres;

end RTL;