library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.NUMERIC_STD.ALL;
	
entity InicializadorLCD2 is
	port(
		clk: in std_logic;
		RS: out std_logic;
		RW: out std_logic;
		E: out std_logic;
		D: out std_logic_vector(7 downto 0)
	);
end InicializadorLCD2;

architecture InicializaLCD of InicializadorLCD2 is
	type FSM is (FunctionSet1,FunctionSet0,DisplayControl1,DisplayControl0,ClearDisplay1,ClearDisplay0,CursorShift1,CursorShift0);
	signal current_state: FSM;
	signal RSTemp: std_logic;
	signal RWTemp: std_logic;
	signal ETemp: std_logic;
	signal DTemp: std_logic_vector(7 downto 0);
begin
	--
	process(clk,current_state,RSTemp,RWTemp,ETemp,DTEmp)
		begin
			if rising_edge(clk) then
				case current_state is
					when FunctionSet1 =>
						RSTemp <= '0';
						RWTemp <= '0';
						ETemp <= '1';
						DTemp <= "00111000";
						current_state <= FunctionSet0;
					when FunctionSet0 =>
						RSTemp <= '0';
						RWTemp <= '0';
						ETemp <= '0';
						DTemp <= "00111000";
						current_state <= DisplayControl1;
					when DisplayControl1 =>
						RSTemp <= '0';
						RWTemp <= '0';
						ETemp <= '1';
						DTemp <= "00001111";
						current_state <= DisplayControl0;
					when DisplayControl0 =>
						RSTemp <= '0';
						RWTemp <= '0';
						ETemp <= '0';
						DTemp <= "00001111";
						current_state <= ClearDisplay1;
					when ClearDisplay1 =>
						RSTemp <= '0';
						RWTemp <= '0';
						ETemp <= '1';
						DTemp <= "00000001";
						current_state <= ClearDisplay0;
					when ClearDisplay0 =>
						RSTemp <= '0';
						RWTemp <= '0';
						ETemp <= '0';
						DTemp <= "00000001";
						current_state <= CursorShift1;
					when CursorShift1 =>
						RSTemp <= '0';
						RWTemp <= '0';
						ETemp <= '1';
						DTemp <= "11000011";
						current_state <= CursorShift0;
					when CursorShift0 =>
						RSTemp <= '0';
						RWTemp <= '0';
						ETemp <= '0';
						DTemp <= "11000011";
						--current_state <= cursorShift1;
					when others =>
						current_state <= current_state;
				end case;
			else
				current_state <= current_state;
				RSTemp <= RSTemp;
				RWTemp <= RWTemp;
				ETemp <= ETemp;
				DTemp <= DTemp;
			end if;
	end process;
	RS <= RSTemp;
	RW <= RWTemp;
	E <= ETemp;
	D <= DTemp;
end inicializaLCD;