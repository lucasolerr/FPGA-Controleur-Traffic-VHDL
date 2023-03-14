Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

entity decompteurPieton is
PORT (
		RESET, CLOCK : in std_logic;
		vert : in std_logic;
		vector_out : out std_logic_vector (4 downto 0)
		);
end decompteurPieton;

architecture DESCRIPTION of decompteurPieton is

signal s_compt_sortie : unsigned (4 downto 0);
signal n : unsigned (4 downto 0);
signal raz : std_logic;

begin

	process(vert)
	
	begin
		if(vert = '1') then
			n <= "01110";
		else 
			n <= "10110";
		end if;
		
	end process;
	
	
	process (RESET,CLOCK)
	begin
		
		if RESET='1' then
			s_compt_sortie <= unsigned(n);
		elsif (rising_edge(CLOCK)) then
			s_compt_sortie <= s_compt_sortie - 1;
			
			if(s_compt_sortie = 0 or raz = '1') then 
				s_compt_sortie <= unsigned(n);
			end if;
		end if;
	
	end process;
	
	vector_out <= std_logic_vector(s_compt_sortie);
	
end DESCRIPTION;
			