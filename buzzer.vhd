Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

entity buzzer is 

port (
		clk : in std_logic;
		data_out: out integer range -128 to 127
		);
end buzzer;

architecture Audio of buzzer is
	signal i : integer range 0 to 30:=0;
	type memory_type is array(0 to 29) of integer range -128 to 127;
	signal sine : memory_type := (0,16,31,45,58,67,74,77,77,74,67,58,45,31,16,0,
	-16,-31,-45,-58,-67,-74,-77,-77,-67,-58,-45,-31,-16,0);
	
begin
	
process(clk)
begin
	if(rising_edge(clk)) then
		data_out <= sine(i);
		i <= i+ 1;
		if (i = 29) then
			i <= 0;
		end if;
	end if;
end process;

end Audio;