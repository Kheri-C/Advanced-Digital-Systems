library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	
entity AntirreboteV2 is
	port(
		clk: in std_logic;
		input: in std_logic;
		contador: out integer;
		output: out std_logic
	);
end AntirreboteV2;

architecture EvitaRebote of AntirreboteV2 is
	type FSM is (IDLE,CHECKIN,PULSE,CHECKOUT);
	signal current_state: FSM;
	signal cont: integer;
	signal sOUT: std_logic;
begin
	process(clk)
		begin
		if(rising_edge(clk)) then -- Si el reloj pasa de 0 a 1
			case(current_state) is
				when IDLE => -- Esperamos a que cambie la señal
					sOUT <= '0';
					if(input = '1') then -- Si la señal cambia
						cont <= 0;
						current_state <= CHECKIN;
					else -- Si la señal no cambia
						current_state <= IDLE;
					end if;
				
				when CHECKIN => -- Vemos si realmente cambio la señal
					if(cont < 49) then -- Si todavia no terminamos de contar
						cont <= cont + 1;
						current_state <= CHECKIN;
					else -- Si ya terminamos de contar
						if(input = '1') then -- Si la señal de verdad cambio
							current_state <= PULSE;
						else -- Si la señal no cambio
							current_state <= IDLE;
						end if;
					end if;
				
				when PULSE => -- Esperamos a que cambie la señal
					sOUT <= '1';
					if(input = '0') then -- Si la señal cambia
						cont <= 0;
						current_state <= CHECKOUT;
					else -- Si la señal no cambia
						current_state <= PULSE;
					end if;
				
				when CHECKOUT =>
					if(cont < 49) then -- Si todavia no terminamos de contar
						cont <= cont + 1;
						current_state <= CHECKOUT;
					else -- Si ya terminamos de contar
						if(input = '0') then -- Si la señal de verdad cambio
							sOUT <= '0';
							current_state <= IDLE;
						else -- Si la señal no cambio
							current_state <= PULSE;
						end if;
					end if;
			end case;
		else
			cont <= cont;
			sOUT <= sOUT;
		end if;
	end process;
	output <= sOUT;
	contador <= cont;
end EvitaRebote;