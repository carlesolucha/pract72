library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplexor1 is
	port(
	a : in std_logic_vector(4 downto 0);
	b : in std_logic_vector(4 downto 0);
	sel_b : in std_logic;
	salida : out std_logic_vector(4 downto 0));
end multiplexor1;

architecture behavioral of multiplexor1 is
begin
	with sel_b select
		salida <=     a when '0',
					 	  b when '1',
						"-----" when others;
end behavioral;
	