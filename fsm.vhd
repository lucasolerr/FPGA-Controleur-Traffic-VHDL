Library ieee;
Use ieee.std_logic_1164.all;

--bug mode maintenance gerer avec boutons poussoirs
--passage au mode maintenance seulement sur etat RV


ENTITY fsm IS
    PORT (
        reset : IN STD_LOGIC;
        clock : IN STD_LOGIC;
        compteur : IN std_logic_vector (3 downto 0);
        rouge : IN std_logic_vector (3 downto 0);
        vert : IN std_logic_vector (3 downto 0);
        orange : IN std_logic_vector (3 downto 0);
        maintenance : IN STD_LOGIC;
        clignotant : IN std_logic_vector (3 downto 0);
        r1 : OUT STD_LOGIC;
        o1 : OUT STD_LOGIC;
        v1 : OUT STD_LOGIC;
        r2 : OUT STD_LOGIC;
        o2 : OUT STD_LOGIC;
		  reset_compteur : out std_logic;
        v2 : OUT STD_LOGIC;
		  pv1 : OUT STD_LOGIC;
		  pv2 : OUT STD_LOGIC;
		  pr1 : OUT STD_LOGIC;
		  reset_decompteur1 : OUT STD_LOGIC;
		  reset_decompteur2 : OUT STD_LOGIC;
		  pr2 : OUT STD_LOGIC;
		  etat_machine : OUT STD_LOGIC_VECTOR (2 downto 0)
    );
END fsm;

ARCHITECTURE BEHAVIOR OF fsm IS
    TYPE type_fstate IS (RV,RO,RR,VR,OrangeR,RougeR,OO2,OO1);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
	 SIGNAL is_maintenance : std_logic;
BEGIN
	 PROCESS (maintenance)
	 BEGIN
		IF (maintenance = '0') THEN
			is_maintenance <= not is_maintenance;
		END IF;
	 END PROCESS;
	 
    PROCESS (clock,reset,reg_fstate)
    BEGIN
        IF (reset='1') THEN
            fstate <= RO;
        ELSIF (clock='1' AND clock'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,compteur,rouge,vert,orange,maintenance,clignotant)
    BEGIN
        r1 <= '0';
        o1 <= '0';
        v1 <= '0';
        r2 <= '0';
        o2 <= '0';
        v2 <= '0';
		  pv1 <= '0';
		  pv2 <= '0';
		  pr1 <= '0';
		  pr2 <= '0';
		  reset_decompteur1 <= '0';
		  reset_decompteur2 <= '0';
        CASE fstate IS
--5		  
            WHEN RV =>
                IF ((is_maintenance = '1')) THEN
						  etat_machine <= "111";
                    reg_fstate <= OO1;
						  reset_compteur <= '1';
                ELSIF (((compteur = vert) AND NOT((is_maintenance = '1')))) THEN
                    etat_machine <= "000";
						  reg_fstate <= RO;
						  reset_compteur <= '1';
						  reset_decompteur1 <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= RV;
						  reset_compteur <= '0';
                END IF;

                v2 <= '1';
                r1 <= '1';
					 pv1 <= '1';
					 pr2 <= '1';
--000
            WHEN RO =>
					 IF ((is_maintenance = '1')) THEN
                    reg_fstate <= OO1;
						  etat_machine <= "111";
						  reset_compteur <= '1';
                ELSIF ((compteur = orange) AND NOT((is_maintenance = '1'))) THEN
                    reg_fstate <= RR;
						  etat_machine <= "001";
						  reset_compteur <= '1';
						  reset_decompteur2 <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= RO;
						  reset_compteur <= '0';
                END IF;

                o2 <= '1';
                r1 <= '1';
					 pr1 <= '1';
					 pr2 <= '1';
--1					 
            WHEN RR =>
                IF ((is_maintenance = '1')) THEN
                    reg_fstate <= OO1;
						  etat_machine <= "111";
						  reset_compteur <= '1';
                ELSIF ((compteur = rouge) AND NOT((is_maintenance = '1'))) THEN
                    reg_fstate <= VR;
						  etat_machine <= "010";
						  reset_compteur <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= RR;
						  reset_compteur <= '0';
						  
                END IF;

                r1 <= '1';
                r2 <= '1';
					 pv2 <= '1';
					 pr1 <= '1';
--2					 
            WHEN VR =>
                IF ((is_maintenance = '1')) THEN
                    reg_fstate <= OO1;
						  etat_machine <= "111";
						  reset_compteur <= '1';
                ELSIF ((compteur = vert) AND NOT((is_maintenance = '1'))) THEN
                    reg_fstate <= OrangeR;
						  etat_machine <= "011";
						  reset_compteur <= '1';
						  reset_decompteur2 <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= VR;
						  reset_compteur <= '0';
                END IF;

                v1 <= '1';
                r2 <= '1';
					 pv2 <= '1';
					 pr1 <= '1';
--3					 
            WHEN OrangeR =>
                IF ((is_maintenance = '1')) THEN
                    reg_fstate <= OO1;
						  etat_machine <= "111";
						  reset_compteur <= '1';
                ELSIF ((compteur = orange) AND NOT((is_maintenance = '1'))) THEN
                    reg_fstate <= RougeR;
						  etat_machine <= "100";
						  reset_compteur <= '1';
						  reset_decompteur1 <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= OrangeR;
						  reset_compteur <= '0';
						  
                END IF;

                o1 <= '1';
                r2 <= '1';
					 pr1 <= '1';
					 pr2 <= '1';
					 
--4					 
            WHEN RougeR =>
                IF ((is_maintenance = '1')) THEN
                    reg_fstate <= OO1;
						  etat_machine <= "111";
						  reset_compteur <= '1';
                ELSIF ((compteur = rouge) AND NOT((is_maintenance = '1'))) THEN
                    reg_fstate <= RV;
						  etat_machine <= "101";
						  reset_compteur <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= RougeR;
						  reset_compteur <= '0';
						  
                END IF;

                r1 <= '1';
                r2 <= '1';
					 pv1 <= '1';
					 pr2 <= '1';
--7					 
            WHEN OO2 =>
					 IF (NOT((is_maintenance = '1'))) THEN
                    reg_fstate <= RO;
						  etat_machine <= "000";
						  reset_compteur <= '1';
						  reset_decompteur1 <= '1';
						  reset_decompteur2 <= '1';
                ELSIF ((compteur = "0001") AND (is_maintenance = '1')) THEN
                    reg_fstate <= OO1;
						  etat_machine <= "111";
						  reset_compteur <= '1';
						  reset_decompteur1 <= '1';
						  reset_decompteur2 <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= OO2;
						  reset_compteur <= '0';
                END IF;
--7					 
            WHEN OO1 =>
                IF (NOT((is_maintenance = '1'))) THEN
                    reg_fstate <= RO;
						  etat_machine <= "000";
						  reset_compteur <= '1';
						  reset_decompteur1 <= '1';
						  reset_decompteur2 <= '1';
                ELSIF (((compteur = "0001") AND (is_maintenance = '1'))) THEN
                    reg_fstate <= OO2;
						  etat_machine <= "111";
						  reset_compteur <= '1';
						  reset_decompteur1 <= '1';
						  reset_decompteur2 <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= OO1;
						  reset_compteur <= '0';
                END IF;

                o1 <= '1';
                o2 <= '1';
					 
            WHEN OTHERS => 
                r1 <= 'X';
                o1 <= 'X';
                v1 <= 'X';
                r2 <= 'X';
                o2 <= 'X';
                v2 <= 'X';
                report "Reach undefined state";
        END CASE;
		  
    END PROCESS;	 
	 
END BEHAVIOR;
