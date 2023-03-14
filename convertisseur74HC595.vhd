Library ieee;
Use ieee.std_logic_1164.all;


ENTITY convertisseur74HC595 IS
    PORT (
			RESET, CLOCK : in std_logic;
			V1 : in std_logic;
			O1 : in std_logic;
			R1 : in std_logic;
			V2 : in std_logic;
			O2 : in std_logic;
			R2 : in std_logic;
			compteur : in std_logic_vector (2 downto 0);
			data_out : out std_logic;
			ST_CP : inout std_logic;
			SH_CP : inout std_logic
        
    );
END convertisseur74HC595;

ARCHITECTURE BEHAVIOR OF convertisseur74HC595 IS
BEGIN

	process (RESET,CLOCK)
	
	begin
		if RESET='1' then
			SH_CP <= '0';
		elsif (rising_edge(CLOCK)) then
			SH_CP <= not(SH_CP);
		end if;
		
	end process;
	

    PROCESS (compteur)
    BEGIN
	 
	 --100001
		  
        CASE compteur IS
            WHEN "000" =>
						data_out <= V1;
						ST_CP <= '0';
						
            WHEN "001" =>
						data_out <= O1;
						ST_CP <= '0';
						
            WHEN "010" =>
						data_out <= R1;
						ST_CP <= '0';
					 
            WHEN "011" =>
						data_out <= V2;
						ST_CP <= '0';	
					 
            WHEN "100" =>
						data_out <= O2;
						ST_CP <= '0';

            WHEN "101" =>
						data_out <= R2;
						ST_CP <= '0';
						
                
            WHEN "110" =>
						data_out <= '0';
						ST_CP <= '0';

						
                
            WHEN "111" =>
						data_out <= '0';
						ST_CP <= '1';
						
                
            WHEN OTHERS => 
                data_out <= '0';
					 
                report "Reach undefined state";
        END CASE;
		  
    END PROCESS;	 
	 
END BEHAVIOR;
