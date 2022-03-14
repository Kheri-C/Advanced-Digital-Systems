library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.NUMERIC_STD.ALL;
	
entity MemoryMasterV2 is
	port(
		clk: in std_logic;
		enable: in std_logic;
		nRST: in std_logic;
		data_out: out std_logic_vector(7 downto 0);
		-- Salidas de monitoreo
		ROMtoRAM: out std_logic_vector(7 downto 0);
		state: out std_logic_vector(2 downto 0);
		contador: out integer;
		--
		busy: out std_logic
	);
end MemoryMasterV2;

architecture ControlaMemorias of MemoryMasterV2 is

	-- Componentes
	component ROM is --8x8
		port(
			address: in std_logic_vector(2 downto 0);
			data_out: out std_logic_vector(7 downto 0)
		);
	end component;
	component RAM is
		port(
			nWriteEnable: in std_logic;
			nChipSelect: in std_logic;
			nOutputEnable: in std_logic;
			address: in std_logic_vector(2 downto 0);
			data: inout std_logic_vector(7 downto 0)
		);
	end component;
	-- Señales
	type FSM is (STANDBY,PREP,WRITING,PREP2,READING,ENDING);
	signal current_state: FSM;
	signal address: std_logic_vector(2 downto 0);
	signal dataROM: std_logic_vector(7 downto 0);
	signal mntrROMtoRAM: std_logic_vector(7 downto 0);
	signal nWE: std_logic;
	signal nCS: std_logic;
	signal nOE: std_logic;
	signal dataRAM: std_logic_vector(7 downto 0);
	signal cont: integer;
	signal sEstado: std_logic_vector(2 downto 0);
	signal sDataOut: std_logic_vector(7 downto 0);
	signal sBusy: std_logic;
	
begin
	
	ROM0: ROM port map(address,dataROM);
	RAM0: RAM port map(nWE,nCS,nOE,address,dataRAM);
	
	process(nRST,clk,enable,current_state)
	begin
		if(nRST = '0') then -- Si reseteamos el dispositivo
			sDataOut <= (others => '0');
			sBusy <= '0';
			cont <= 0;
			nCS <= '1';
			nOE <= '1';
			nWE <= '1';
		else -- Si no reseteamos el dispositivo
			if(rising_edge(clk)) then -- Si el reloj cambia de 0 a 1
				case(current_state) is 
				
					when STANDBY => -- Esperamos la señal enable
						sEstado <= "000";
						if(enable = '0') then -- Si no llega
							current_state <= STANDBY;
						else -- Si llega
							nCS <= '1';
							nWE <= '0';
							sBusy <= '1';
							cont <= 0;
							current_state <= PREP;
						end if;
						
					when PREP => -- Preparamos el cambio de señal para actualizar la info de la RAM
						sEstado <= "001"; 
						nCS <= '1';
						address <= std_logic_vector(to_unsigned(cont,3));
						current_state <= WRITING;
						
					when WRITING => -- Escribimos la info de la ROM a la RAM
						sEstado <= "010";
						nCS <= '0';
						if(cont < 6) then -- Si todavía no terminamos de copiar la informacion
							cont <= cont + 1;
							dataRAM <= dataROM;
							mntrROMtoRAM <= dataROM;
							current_state <= PREP;
						else -- Si ya terminamos de copiar la informacion
							nWE <= '1';
							nOE <= '0';
							cont <= 0;
							nCS <= '1';
							dataRAM <= (others => 'Z');
							current_state <= PREP2;
						end if;
					
					when PREP2 => -- Preparamos el cambio de senñal para actualizar la info de la RAM
						sEstado <= "011";
						nCS <= '0';
						dataRAM <= (others => 'Z');
						address <= std_logic_vector(to_unsigned(cont,3));
						current_state <= READING;
					
					when READING => -- Escribimos la info de la RAM a la salida
						nCS <= '1';
						sDataOut <= dataRAM;
						sEstado <= "100";
						if(cont < 6) then -- Si todavia no terminamos de copiar la informacion
							cont <= cont + 1;
							current_state <= PREP2;
						else
							current_state <= ENDING;
						end if;
					
					when ENDING =>
						sEstado <= "101";
						cont <= 0;
						sBusy <= '0';
						current_state <= STANDBY;
					
				end case;
			else -- Si el reloj cambia de 1 a 0
				sDataOut <= sDataOut;
				--sBusy <= sBusy;
				current_state <= current_state;
				sEstado <= sEstado;
			end if;
		end if;
	end process;
	data_out <= sDataOut;
	busy <= sBusy;
	state <= sEstado;
	contador <= cont;
	ROMtoRAM <= mntrROMtoRAM;
end ControlaMemorias;