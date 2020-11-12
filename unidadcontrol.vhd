library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity unidadcontrol is
	port(
	sel: in std_logic_vector(2 downto 0);
	sel_s : out std_logic_vector(1 downto 0);
	sr : out std_logic;
	sel_b : out std_logic;
	sel_ov : out std_logic;
	sel_log : out std_logic_vector(1 downto 0));
end unidadcontrol;

architecture behavioral of unidadcontrol is
	signal salidas : std_logic_vector(6 downto 0);
begin
	with sel select
	salidas <= 
	"00---00" WHEN "000",
	"00---01" when "001",
	"00---10" when "010",
	"00---11" when "011",
	"10000--" when "101",
	"10010--" when "110",
	"10001--" when "111",
	"-------" when others;
	sel_s <= salidas(6 downto 5);
	sel_ov <= salidas(4);
	sr <=salidas(3);
	sel_b <= salidas(2);
	sel_log <= salidas( 1 downto 0);
end behavioral;
		