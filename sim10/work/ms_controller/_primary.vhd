library verilog;
use verilog.vl_types.all;
entity ms_controller is
    generic(
        \RESET\         : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        GEN             : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        GEN_WAIT        : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        \GEN_DONE\      : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        \WAIT\          : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        \LEFT\          : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        \RIGHT\         : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0);
        \WIN\           : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi1);
        \LOSE\          : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        UPDATE          : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi1);
        \QUICK\         : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi0);
        UPDATE1         : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi1);
        UPDATE2         : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi0, Hi0)
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
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \RESET\ : constant is 1;
    attribute mti_svvh_generic_type of GEN : constant is 1;
    attribute mti_svvh_generic_type of GEN_WAIT : constant is 1;
    attribute mti_svvh_generic_type of \GEN_DONE\ : constant is 1;
    attribute mti_svvh_generic_type of \WAIT\ : constant is 1;
    attribute mti_svvh_generic_type of \LEFT\ : constant is 1;
    attribute mti_svvh_generic_type of \RIGHT\ : constant is 1;
    attribute mti_svvh_generic_type of \WIN\ : constant is 1;
    attribute mti_svvh_generic_type of \LOSE\ : constant is 1;
    attribute mti_svvh_generic_type of UPDATE : constant is 1;
    attribute mti_svvh_generic_type of \QUICK\ : constant is 1;
    attribute mti_svvh_generic_type of UPDATE1 : constant is 1;
    attribute mti_svvh_generic_type of UPDATE2 : constant is 1;
end ms_controller;
