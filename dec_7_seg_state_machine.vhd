Library ieee;
Use ieee.std_logic_1164.all;

entity dec_7_seg_state_machine is
PORT (
		nombre: in std_logic_vector (2 downto 0);
		segments1: out std_logic_vector (6 downto 0);
		segments2: out std_logic_vector (6 downto 0)
);
end dec_7_seg_state_machine;

architecture DESCRIPTION of dec_7_seg_state_machine is

begin

	process(nombre)
	begin
	case nombre is
			when "000" =>
					segments1 <= "1000000"; --0
					segments2 <= "1000000"; --0
			when "001" => 
					segments1 <= "1111001"; --1
					segments2 <= "1000000"; --0

			when "010" => 
					segments1 <= "0100100"; --2
					segments2 <= "1000000"; --0
			when "011" => 
					segments1 <= "0110000"; --3
					segments2 <= "1000000"; --0
			when "100" => 
					segments1 <= "0011001"; --4
					segments2 <= "1000000"; --0
			when "101" => 
					segments1 <= "0010010"; --5
					segments2 <= "1000000"; --0
			when "110" => 
					segments1 <= "0000011"; --6
					segments2 <= "1000000"; --0
			when "111" => 
					segments1 <= "1111000"; --7
					segments2 <= "1000000"; --0
			when others =>
					segments1 <= "0000000";
					segments2 <= "0000000";
		end case;
		
	end process;

end DESCRIPTION;