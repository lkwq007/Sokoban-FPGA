library verilog;
use verilog.vl_types.all;
entity ms_controller is
    generic(
        \RESET\         : integer := 0;
        GEN             : integer := 1;
        GEN_WAIT        : integer := 2;
        \GEN_DONE\      : integer := 3;
        \WAIT\          : integer := 4;
        \LEFT\          : integer := 5;
        \RIGHT\         : integer := 6;
        \WIN\           : integer := 7;
        \LOSE\          : integer := 8;
        UPDATE          : integer := 9;
        \QUICK\         : integer := 10;
        UPDATE1         : integer := 11;
        UPDATE2         : integer := 12
    );
    port(
        flag            : out    vl_logic_vector(63 downto 0);
        doubt           : out    vl_logic_vector(63 downto 0);
        \open\          : out    vl_logic_vector(63 downto 0);
        gen_reset       : out    vl_logic;
        win             : out    vl_logic;
        lose            : out    vl_logic;
        start           : out    vl_logic;
        stop            : out    vl_logic;
        clr             : out    vl_logic;
        state           : out    vl_logic_vector(3 downto 0);
        gen_done        : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        retry           : in     vl_logic;
        left            : in     vl_logic;
        right           : in     vl_logic;
        game_area       : in     vl_logic;
        mid             : in     vl_logic;
        cursor          : in     vl_logic_vector(5 downto 0);
        mine            : in     vl_logic_vector(63 downto 0);
        check           : in     vl_logic_vector(63 downto 0);
        quick           : in     vl_logic_vector(63 downto 0);
        open_quick      : in     vl_logic_vector(63 downto 0)
    );
end ms_controller;
