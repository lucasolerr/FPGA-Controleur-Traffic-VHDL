Library ieee;
Use ieee.std_logic_1164.all;

entity decodeur_7_seg is
PORT (
		nombre: in std_logic_vector (3 downto 0);
		segments1: out std_logic_vector (6 downto 0);
		segments2: out std_logic_vector (6 downto 0)
);
end decodeur_7_seg;

architecture DESCRIPTION of decodeur_7_seg is

begin

	process(nombre)
	
	begin
		case nombre is
			when "0000" =>
					segments1 <= "1000000"; --0
					segments2 <= "1000000"; --0
			when "0001" => 
					segments1 <= "1111001"; --1
					segments2 <= "1000000"; --0

			when "0010" => 
					segments1 <= "0100100"; --2
					segments2 <= "1000000"; --0
			when "0011" => 
					segments1 <= "0110000"; --3
					segments2 <= "1000000"; --0
			when "0100" => 
					segments1 <= "0011001"; --4
					segments2 <= "1000000"; --0
			when "0101" => 
					segments1 <= "0010010"; --5
					segments2 <= "1000000"; --0
			when "0110" => 
					segments1 <= "0000011"; --6
					segments2 <= "1000000"; --0
			when "0111" => 
					segments1 <= "1111000"; --7
					segments2 <= "1000000"; --0
			when "1000" => 
					segments1 <= "0000000"; --8
					segments2 <= "1000000"; --0
			when "1001" => 
					segments1 <= "0010000"; --9
					segments2 <= "1000000"; --0
			when "1010" =>
					segments1 <= "1000000"; --0
					segments2 <= "1111001"; --1
			when "1011" =>
					segments1 <= "1111001"; --1
					segments2 <= "1111001"; --1
			when "1100" =>
					segments1 <= "0100100"; --2
					segments2 <= "1111001"; --1	
			when "1101" =>
					segments1 <= "0110000"; --3
					segments2 <= "1111001"; --1
			when "1110" => 
					segments1 <= "0011001"; --4
					segments2 <= "1111001"; --1
			when "1111" => 
					segments1 <= "0010010"; --5
					segments2 <= "1111001"; --1
			
			when others =>
					segments1 <= "0000000";
					segments2 <= "0000000";
		end case;
		
	end process;

end DESCRIPTION;