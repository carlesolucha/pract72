library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sumador1 is
	port(
	a_i : in std_logic;
	b_i : in std_logic;
	c_i : in std_logic;
	s_i : out std_logic;
	c_i_1 : out std_logic);
end sumador1;

architecture behavioral of sumador1 is
begin

	s_i<=c_i xor (a_i xor b_i);
	c_i_1<= (a_i and b_i) or (c_i and (a_i xor b_i));
end behavioral;