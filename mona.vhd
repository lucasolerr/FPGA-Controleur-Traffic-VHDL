Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

entity buzzer is 
port ( 
		decompteur : in std_logic_vector ; 
		clock, reset : in std_logic ; 
		led1, led2, cnt, i  : in std_logic ; 
		s, freq : out std_logic 
		);
end buzzer; 

architecture Behavioral of buzzer is 

begin 

process (clock, reset) 

	begin

	if rising-edge(clock) then
		 if i<=50000 then
			  i <= i+1; 
			  freq <= 1/i;
		 elsif i>50000 and i<100000 then 
			  i <= i+1; 
			  freq <=  1/i;
		 elsif i=100000 then 
			  i <= 0; 
		 else;
			  i <= i;
		 end if;
	elsif reset=‘1’ then 
		 i <= 0; 
	end if; 

process (led1, led2, decompteur, s ) 
begin
if led1 = '1' then 
    if decompteur = '0101' and decompteur <= ‘0111’ 
         if cnt <= 25000 then 
            s <= '1';
            cnt <= cnt+1;
        elsif cnt > 25000 and cnt < 50000 then 
            s <= '0';
            cnt <= cnt+1;
        elsif cnt = 50000 then 
            cnt <= 0; 
        end if; 

        while ( s = '1') loop 
            s <= freq; 
        end loop; 
 
    elsif decompteur >= '0011' and decompteur <= ‘0101’ then 
        if cnt <= 25000 then 
            s <= '1';
            cnt <= cnt+3;
        elsif cnt > 25000 and cnt < 50000 then 
            s <= '0';
            cnt <= cnt+3;
        elsif cnt = 50000 then 
            cnt <= 0; 
        end if; 

        while ( s = '1') loop 
            s= freq; 
        end loop;
elsif  decompteur >= '0000' and decompteur <= ‘0011’ then 
        if cnt <= 25000 then 
            s <= '1';
            cnt <= cnt+8;
        elsif cnt > 25000 and cnt < 50000 then 
            s <= '0';
            cnt <= cnt+8;
        elsif cnt = 50000 then 
            cnt <= 0; 
        end if; 

        while ( s = '1') loop 
            s <= freq; 
        end loop; 

    elsif decompteur < ‘0000’ then 
        s<= '0'; 
    end if;

elsif led2 = '1' then 
if decompteur = '0101' and decompteur <= '0111' 
         if cnt <= 25000 then 
            s <= '1';
            cnt <= cnt+1;
        elsif cnt > 25000 and cnt < 50000 then 
            s <= '0';
            cnt <= cnt+1;
        elsif cnt = 50000 then 
            cnt <= 0; 
        end if; 

        while ( s = '1') loop 
            s=2freq; 
        end loop; 
 
    elsif decompteur >= '0011' and decompteur <= '0101' then 
        if cnt <= 25000 then 
            s <= '1';
            cnt <= cnt+3;
        elsif cnt > 25000 and cnt < 50000 then 
            s <= '0';
            cnt <= cnt+3;
        elsif cnt = 50000 then 
            cnt <= 0; 
        end if; 

        while ( s = '1') loop 
            s= 2freq; 
        end loop; 

    elsif  decompteur >= '0000' and decompteur <= '0011' then 
        if cnt <= 25000 then 
            s <= ‘1’;
            cnt <= cnt+8;
        elsif cnt > 25000 and cnt < 50000 then 
            s <= '0';
            cnt <= cnt+8;
        elsif cnt = 50000 then 
            cnt <= 0; 
        end if; 

        while ( s = '1') loop 
            s <= 2*freq; 
        end loop; 

    elsif decompteur < '0000' then 
        s <= '0'; 
    end if;
else 
    s <= '0' ; 

end if ; 
end process ; 

end Behavioral