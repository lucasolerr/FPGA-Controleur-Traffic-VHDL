Library ieee;
Use ieee.std_logic_1164.all;

entity decodeur_7_seg_pieton is
PORT (
		nombre: in std_logic_vector (4 downto 0);
		segments1: out std_logic_vector (6 downto 0);
		segments2: out std_logic_vector (6 downto 0)
);
end decodeur_7_seg_pieton;

architecture DESCRIPTION of decodeur_7_seg_pieton is

begin

	process(nombre)
	
	begin
		case nombre is
			when "00000" =>
					segments1 <= "1000000"; --0
					segments2 <= "1000000"; --0
			when "00001" => 
					segments1 <= "1111001"; --1
					segments2 <= "1000000"; --0

			when "00010" => 
					segments1 <= "0100100"; --2
					segments2 <= "1000000"; --0
			when "00011" => 
					segments1 <= "0110000"; --3
					segments2 <= "1000000"; --0
			when "00100" => 
					segments1 <= "0011001"; --4
					segments2 <= "1000000"; --0
			when "00101" => 
					segments1 <= "0010010"; --5
					segments2 <= "1000000"; --0
			when "00110" => 
					segments1 <= "0000011"; --6
					segments2 <= "1000000"; --0
			when "00111" => 
					segments1 <= "1111000"; --7
					segments2 <= "1000000"; --0
			when "01000" => 
					segments1 <= "0000000"; --8
					segments2 <= "1000000"; --0
			when "01001" => 
					segments1 <= "0010000"; --9
					segments2 <= "1000000"; --0
			when "01010" =>
					segments1 <= "1000000"; --0
					segments2 <= "1111001"; --1
			when "01011" =>
					segments1 <= "1111001"; --1
					segments2 <= "1111001"; --1
			when "01100" =>
					segments1 <= "0100100"; --2
					segments2 <= "1111001"; --1	
			when "01101" =>
					segments1 <= "0110000"; --3
					segments2 <= "1111001"; --1
			when "01110" => 
					segments1 <= "0011001"; --4
					segments2 <= "1111001"; --1
			when "01111" => 
					segments1 <= "0010010"; --5
					segments2 <= "1111001"; --1
			when "10000" =>
					segments1 <= "0000011"; --6
					segments2 <= "1111001"; --1
			when "10001" =>
					segments1 <= "1111000"; --7
					segments2 <= "1111001"; --1
			when "10010" =>
					segments1 <= "0000000"; --8
					segments2 <= "1111001"; --1
			when "10011" =>
					segments1 <= "0010000"; --9
					segments2 <= "1111001"; --1
			when "10100" =>
					segments1 <= "1000000"; --0
					segments2 <= "0100100"; --2
			when "10101" =>
					segments1 <= "1111001"; --1
					segments2 <= "0100100"; --2
			when "10110" =>
					segments1 <= "0100100"; --2
					segments2 <= "0100100"; --2
			when "10111" =>
					segments1 <= "0110000"; --3
					segments2 <= "0100100"; --2
			when others =>
					segments1 <= "0000000";
					segments2 <= "0000000";
		end case;
		
	end process;

end DESCRIPTION;