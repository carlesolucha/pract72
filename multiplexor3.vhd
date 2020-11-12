library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplexor3 is
	port(
	sfunlog : in std_logic_vector(4 downto 0);
	smulti  : in std_logic_vector(4 downto 0);
	ssumres : in std_logic_vector(4 downto 0);
	sel_s   : in std_logic_vector(1 downto 0);
	s       : out std_logic_vector(4 downto 0));
end multiplexor3;

architecture behavioral of multiplexor3 is
begin
	with sel_s select
		s <=  sfunlog when "00",
				smulti when  "01",
				ssumres when "11",
				"--" when others;
end behavioral;