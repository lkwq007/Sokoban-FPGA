library verilog;
use verilog.vl_types.all;
entity game_controller is
    generic(
        \RESET\         : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        INIT            : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        \WAIT\          : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        PAUSE           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        OVER            : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        \NEXT\          : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        INTERIM         : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0);
        \RETRACT\       : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi1);
        MOVE            : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        \LOSE\          : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi1)
    );
    port(
        game_state_en   : out    vl_logic;
        stage_up        : out    vl_logic;
        win             : out    vl_logic;
        lose            : out    vl_logic;
        sel             : out    vl_logic_vector(1 downto 0);
        step_inc        : out    vl_logic;
        step_dec        : out    vl_logic;
        clk             : in     vl_logic;
        retry           : in     vl_logic;
        retract         : in     vl_logic;
        left            : in     vl_logic;
        game_area       : in     vl_logic;
        reset           : in     vl_logic;
        right           : in     vl_logic;
        move_result     : in     vl_logic;
        cursor          : in     vl_logic_vector(5 downto 0);
        destination     : in     vl_logic_vector(63 downto 0);
        stage           : in     vl_logic_vector(1 downto 0);
        game_state      : in     vl_logic_vector(133 downto 0);
        step_exp        : in     vl_logic_vector(7 downto 0);
        step            : in     vl_logic_vector(7 downto 0);
        key_hit         : in     vl_logic;
        key_retry       : in     vl_logic;
        key_retract     : in     vl_logic;
        key_next        : in     vl_logic;
        real_retract    : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \RESET\ : constant is 1;
    attribute mti_svvh_generic_type of INIT : constant is 1;
    attribute mti_svvh_generic_type of \WAIT\ : constant is 1;
    attribute mti_svvh_generic_type of PAUSE : constant is 1;
    attribute mti_svvh_generic_type of OVER : constant is 1;
    attribute mti_svvh_generic_type of \NEXT\ : constant is 1;
    attribute mti_svvh_generic_type of INTERIM : constant is 1;
    attribute mti_svvh_generic_type of \RETRACT\ : constant is 1;
    attribute mti_svvh_generic_type of MOVE : constant is 1;
    attribute mti_svvh_generic_type of \LOSE\ : constant is 1;
end game_controller;
