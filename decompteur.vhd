Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

entity decompteur is
PORT (
		RESET, CLOCK : in std_logic;
		n : in std_logic_vector (3 downto 0);
		vector_out : out std_logic_vector (3 downto 0)
		);
end decompteur;

architecture DESCRIPTION of decompteur is

signal s_compt_sortie: unsigned (3 downto 0);

begin

	process (RESET,CLOCK)
	
	begin
		if RESET='1' then
			s_compt_sortie <= unsigned(n);
			
		elsif (rising_edge(CLOCK)) then
			s_compt_sortie <= s_compt_sortie - 1;
			
			if(s_compt_sortie = 0) then s_compt_sortie <= unsigned(n);
			
			end if;
		end if;
	
	end process;
	
	vector_out <= std_logic_vector(s_compt_sortie);
	
end DESCRIPTION;
			