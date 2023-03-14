Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity testBuzz is 
port ( 
		decompteur : in std_logic_vector(4 downto 0) ; 
		clock, reset : in std_logic ; 
		is_buzzer_on  : in std_logic ; 
		s : inout std_logic 
		);
		
end testBuzz; 

architecture testBehavioral of testBuzz is 

signal i: integer;
signal valeurPivot: integer;

begin 

	process (decompteur) 
	begin
	
		if (decompteur <= "01111" and decompteur >= "01101") then
			
			valeurPivot <= 25000000;
		
		elsif (decompteur < "01101" and decompteur >= "01001") then
			
			valeurPivot <= 13000000;
			
		elsif (decompteur < "01001" and decompteur >= "00110") then
			
			valeurPivot <= 7000000;
			
		elsif (decompteur < "00110" and decompteur >= "00011") then
			
			valeurPivot <= 3000000;
			
		elsif (decompteur < "00011" and decompteur >= "00000") then
			
			valeurPivot <= 1000000;

		end if; 
		
	end process;

	process (clock, reset, valeurPivot) 
	begin

	if (reset= '1') then
	
		i <= 1; 
		 
	elsif (rising_edge(clock)) then 
	
		if (i < valeurPivot) then
		
			i <= i + 1; 
			
		else 
		
			i <= 1;
			
		end if;
		
	end if;
	end process;
	
	process (is_buzzer_on, i, s)
	begin
	
	
	if (is_buzzer_on = '1') then
	
		if(i = 1) then 
	
		s <= not(s);
	 
		end if;
	
	else 
	
		s <= '0';
	
	end if;
	end process; 

end testBehavioral;