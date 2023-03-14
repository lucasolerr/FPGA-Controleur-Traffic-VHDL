Library ieee;
Use ieee.std_logic_1164.all;

--012345
--VORVOR
--1er2em


ENTITY fsm2 IS
    PORT (
        reset : IN STD_LOGIC;
        clock : IN STD_LOGIC;
        compteur : IN std_logic_vector (3 downto 0);
        rouge : IN std_logic_vector (3 downto 0);
        vert : IN std_logic_vector (3 downto 0);
        orange : IN std_logic_vector (3 downto 0);
        maintenance : IN STD_LOGIC;
        clignotant : IN std_logic_vector (3 downto 0);
        vectorBit : out std_logic_vector (5 downto 0);
		  reset_compteur : out std_logic
        
    );
END fsm2;

ARCHITECTURE BEHAVIOR OF fsm2 IS
    TYPE type_fstate IS (RV,RO,RR,VR,OrangeR,RougeR,OO2,OO1);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
BEGIN
    PROCESS (clock,reset,reg_fstate)
    BEGIN
        IF (reset='1') THEN
            fstate <= RV;
        ELSIF (clock='1' AND clock'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,compteur,rouge,vert,orange,maintenance,clignotant)
    BEGIN
        vectorBit(0) <= '0';
		  vectorBit(1) <= '0';
		  vectorBit(2) <= '0';
		  vectorBit(3) <= '0';
		  vectorBit(4) <= '0';
		  vectorBit(5) <= '0';
		  
        CASE fstate IS
            WHEN RV =>
                IF ((maintenance = '1')) THEN
                    reg_fstate <= OO1;
						  reset_compteur <= '1';
                ELSIF (((compteur = vert) AND NOT((maintenance = '1')))) THEN
                    reg_fstate <= RO;
						  reset_compteur <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= RV;
						  reset_compteur <= '0';
                END IF;
					 vectorBit(3) <= '1';
					 vectorBit(2) <= '1';

            WHEN RO =>
                IF ((compteur = orange)) THEN
                    reg_fstate <= RR;
						  reset_compteur <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= RO;
						  reset_compteur <= '0';
                END IF;

					 vectorBit(4) <= '1';
					 vectorBit(2) <= '1';
					 
            WHEN RR =>
                IF ((compteur = rouge)) THEN
                    reg_fstate <= VR;
						  reset_compteur <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= RR;
						  reset_compteur <= '0';
                END IF;

					 vectorBit(2) <= '1';
					 vectorBit(5) <= '1';
					 
            WHEN VR =>
                IF ((compteur = vert)) THEN
                    reg_fstate <= OrangeR;
						  reset_compteur <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= VR;
						  reset_compteur <= '0';
                END IF;

					 vectorBit(0) <= '1';
					 vectorBit(5) <= '1';
					 --100001
					 
            WHEN OrangeR =>
                IF ((compteur = orange)) THEN
                    reg_fstate <= RougeR;
						  reset_compteur <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= OrangeR;
						  reset_compteur <= '0';
                END IF;
					 
					 vectorBit(1) <= '1';
					 vectorBit(5) <= '1';
					 
					 
            WHEN RougeR =>
                IF ((compteur = rouge)) THEN
                    reg_fstate <= RV;
						  reset_compteur <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= RougeR;
						  reset_compteur <= '0';
                END IF;

					 vectorBit(2) <= '1';
					 vectorBit(5) <= '1';
					 
            WHEN OO2 =>
                IF ((compteur = clignotant)) THEN
                    reg_fstate <= OO1;
						  reset_compteur <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= OO2;
						  reset_compteur <= '0';
                END IF;
            WHEN OO1 =>
                IF (NOT((maintenance = '1'))) THEN
                    reg_fstate <= RV;
                ELSIF (((compteur = clignotant) AND (maintenance = '1'))) THEN
                    reg_fstate <= OO2;
						  reset_compteur <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= OO1;
						  reset_compteur <= '0';
                END IF;

					 vectorBit(1) <= '1';
					 vectorBit(4) <= '1';
					 
            WHEN OTHERS => 
                vectorBit(0) <= 'X';
					 vectorBit(1) <= 'X';
					 vectorBit(2) <= 'X';
					 vectorBit(3) <= 'X';
					 vectorBit(4) <= 'X';
					 vectorBit(5) <= 'X';
                report "Reach undefined state";
        END CASE;
		  
    END PROCESS;	 
	 
END BEHAVIOR;
