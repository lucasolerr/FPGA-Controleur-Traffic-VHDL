Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;


entity constante is
PORT (
		n: out std_logic_vector (3 downto 0);
		rouge: out std_logic_vector (3 downto 0);
		orange: out std_logic_vector (3 downto 0);
		vert: out std_logic_vector (3 downto 0)

		
);
end constante;

architecture DESCRIPTION of constante is

begin

	n <= "1111";
	rouge <= "1000"; --8
	orange <= "0100"; --4
	vert <= "0111"; --7

end DESCRIPTION;