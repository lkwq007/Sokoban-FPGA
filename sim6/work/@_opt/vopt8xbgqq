library verilog;
use verilog.vl_types.all;
entity game_controller is
    generic(
        \RESET\         : integer := 0;
        INIT            : integer := 1;
        \WAIT\          : integer := 2;
        PAUSE           : integer := 3;
        OVER            : integer := 4;
        \NEXT\          : integer := 5;
        INTERIM         : integer := 6;
        \RETRACT\       : integer := 7;
        MOVE            : integer := 8;
        \LOSE\          : integer := 9
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
end game_controller;
