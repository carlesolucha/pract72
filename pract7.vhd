library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pract7 is
	port(
	a : in std_logic_vector(4 downto 0);
	b : in std_logic_vector(4 downto 0);
	sel : in std_logic_vector(2 downto 0);
	s : out std_logic_vector(4 downto 0);
	ov : out std_logic);
end pract7;

architecture structural of pract7 is 
	signal medias: std_logic_vector(6 downto 0);
	signal salidafun : std_logic_vector(4 downto 0);
	signal salidamulti : std_logic_vector( 9 downto 0);
	signal salidasumres : std_logic_vector(4 downto 0);
	signal mux1s : std_logic_vector(4 downto 0);
	signal overflows :std_logic_vector(1 downto 0);
	component BinA7Seg
		port(
		E			:in std_logic_vector(3 downto 0);
		salida	:out std_logic_vector(6 downto 0));
	end component;
	
	component multiplexor1
		port(
		a : in std_logic_vector(4 downto 0);
		b : in std_logic_vector(4 downto 0);
		sel_b : in std_logic;
		salida : out std_logic_vector(4 downto 0));
	end component;
	
	component multiplexor2
		port(
		sel_ov : in std_logic;
		ovm  : in std_logic;
		ovsr : in std_logic;
		ov : out std_logic);
	end component;
	
	component multiplexor3
		port(
		sfunlog : in std_logic_vector(4 downto 0);
		smulti  : in std_logic_vector(4 downto 0);
		ssumres : in std_logic_vector(4 downto 0);
		sel_s   : in std_logic_vector(1 downto 0);
		s       : out std_logic_vector(4 downto 0));
	end component;
	
	component multiplicador5
	generic(
	gn : integer := 5);
	port(
	a : in std_logic_vector(gn-1 downto 0);
	b : in std_logic_vector(gn-1 downto 0);
	pant : out std_logic_vector(9 downto 0);
	ov_p : out std_logic);
	end component;
	
	component sumres
		generic(
		gn : integer :=5);
		port(
		a: in std_logic_vector(gn-1 downto 0);
		b: in std_logic_vector(gn-1 downto 0);
		sr : in std_logic;
		--c_out: out std_logic;
		s : out std_logic_vector(gn-1 downto 0);
		ov : out std_logic);
	end component;
	
	component unidadfunlog
		port(
		a : in std_logic_vector(4 downto 0);
		b : in std_logic_vector(4 downto 0);
		sel_log : in std_logic_vector(1 downto 0);
		s : out std_logic_vector(4 downto 0));
	end component;
	
	component unidadcontrol
		port(
		sel: in std_logic_vector(2 downto 0);
		sel_s : out std_logic_vector(1 downto 0);
		sr : out std_logic;
		sel_b : out std_logic;
		sel_ov : out std_logic;
		sel_log : out std_logic_vector(1 downto 0));
	end component;
begin
	i_unidadcontrol : unidadcontrol
		port map(
		sel => sel,
		sel_s => medias(6 downto 5),
		sel_ov => medias(4),
		sr => medias(3),
		sel_b => medias(2),
		sel_log => medias (1 downto 0));
	i_unidadfunlog : unidadfunlog
		port map(
		sel_log => medias(1 downto 0),
		a => a,
		b => b,
		s => salidafun);
	i_multiplicador5 : multiplicador5
		port map(
		a => a,
		b => b,
		pant => salidamulti,
		ov_p => overflows(1));
	i_multiplexor1 : multiplexor1
		port map(
		a =>"00001",
		b =>b,
		sel_b => medias(2),
		salida => mux1s);
	i_sumadorrestador : sumres
		port map(
		sr=> medias(3),
		a=> a,
		b=> mux1s,
		s=> salidasumres,
		ov => overflows(1));
	i_multiplexor3 : multiplexor3
		port map(
		sel_s => medias(6 downto 5),
		sfunlog =>salidas(2),
		smulti =>salidas(1), 
		ssumres => salidas(0),
		s=>s);
	i_multiplexor2 : multiplexor2
		port map(
		sel_ov => medias(4),
		ovm  => overflows(0),
		ovsr => overflows(1),
		ov => ov);
		
		
	
end structural;