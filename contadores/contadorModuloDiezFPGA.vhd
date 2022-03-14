library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	
entity contadorModuloDiezFPGA is
	port(
		clk: in std_logic;
		reset: in std_logic;
		load: in std_logic;
		data: in std_logic_vector(3 downto 0);
		counter: out std_logic_vector(3 downto 0);
		led: out std_logic
	);
end contadorModuloDiezFPGA;

architecture cuentaHastaNueve of contadorModuloDiezFPGA is
	signal aux0: std_logic;
	--
	component contadorModuloDiez is
		port(
		clk: in std_logic;
		reset: in std_logic;
		load: in std_logic;
		data: in std_logic_vector(3 downto 0);
		counter: out std_logic_vector(3 downto 0)
	);
	end component;
	--
	component divisorFrecuencia is
		port(
			clk_in: in std_logic;
			clk_out: out std_logic
		);
	end component;
begin
	c0: contadorModuloDiez port map(aux0,reset,load,data,counter);
	d0: divisorFrecuencia port map(clk,aux0);
	led <= aux0;
end cuentaHastaNueve;