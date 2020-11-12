library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sumres is
	generic(
	gn : integer :=5);
	port(
	a: in std_logic_vector(gn-1 downto 0);
	b: in std_logic_vector(gn-1 downto 0);
	sr : in std_logic;
	--c_out: out std_logic;
	s : out std_logic_vector(gn-1 downto 0);
	ov : out std_logic);
end sumres;

architecture structural of sumres is
	signal c : std_logic_vector(gn downto 0);
	
	component sumador1
		port(
		a_i : in std_logic;
		b_i : in std_logic;
		c_i : in std_logic;
		s_i : out std_logic;
		c_i_1 : out std_logic);
	end component;
begin
	c(0)<=sr;
	--c_out<=c(4);
	
	genSum: for i in 0 to gn-1 generate
		i_sumador : sumador1
			port map(
			a_i=>a(i),
			b_i=> sr xor b(i),
			s_i=>s(i),
			c_i=>c(i),
			c_i_1=>c(i+1));
		end generate genSum;
	ov<=c(5) xor c(4);
end structural;