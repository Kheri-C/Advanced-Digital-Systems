library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.NUMERIC_STD.ALL;
	use IEEE.MATH_REAL.ALL;
	
entity SemaforoFPGA is
	port(
		clk: in std_logic;
		countReset: in std_logic;
		led: out std_logic_vector(2 downto 0);
		contador: out std_logic_vector(4 downto 0)
	);
end SemaforoFPGA;

architecture prendeEnFPGA of SemaforoFPGA is
	signal aux0: std_logic;
	component Semaforo2 is
		port(
			clk: in std_logic;
			countReset: in std_logic;
			led: out std_logic_vector(2 downto 0);
			contador: out std_logic_vector(4 downto 0)
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
	s0: Semaforo2 port map(aux0,countReset,led,contador);
	d0: divisorFrecuencia port map(clk,aux0);
end prendeEnFPGA;