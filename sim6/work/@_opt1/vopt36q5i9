library verilog;
use verilog.vl_types.all;
entity game_core is
    generic(
        UP              : integer := 0;
        DOWN            : integer := 1;
        \LEFT\          : integer := 2;
        \RIGHT\         : integer := 3
    );
    port(
        win             : out    vl_logic;
        lose            : out    vl_logic;
        stage           : out    vl_logic_vector(1 downto 0);
        man             : out    vl_logic_vector(5 downto 0);
        wall            : out    vl_logic_vector(63 downto 0);
        destination     : out    vl_logic_vector(63 downto 0);
        box             : out    vl_logic_vector(63 downto 0);
        way             : out    vl_logic_vector(63 downto 0);
        step            : out    vl_logic_vector(7 downto 0);
        step_exp        : out    vl_logic_vector(7 downto 0);
        direction       : out    vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        game_area       : in     vl_logic;
        retract         : in     vl_logic;
        retry           : in     vl_logic;
        left            : in     vl_logic;
        right           : in     vl_logic;
        reset           : in     vl_logic;
        cursor          : in     vl_logic_vector(5 downto 0);
        key             : in     vl_logic_vector(7 downto 0)
    );
end game_core;
