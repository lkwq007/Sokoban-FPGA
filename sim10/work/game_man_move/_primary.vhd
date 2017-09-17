library verilog;
use verilog.vl_types.all;
entity game_man_move is
    generic(
        UP              : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        DOWN            : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        LEFT            : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        RIGHT           : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    port(
        game_state_next : out    vl_logic_vector(133 downto 0);
        result          : out    vl_logic;
        direction       : out    vl_logic_vector(1 downto 0);
        game_state      : in     vl_logic_vector(133 downto 0);
        cursor          : in     vl_logic_vector(5 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of UP : constant is 1;
    attribute mti_svvh_generic_type of DOWN : constant is 1;
    attribute mti_svvh_generic_type of LEFT : constant is 1;
    attribute mti_svvh_generic_type of RIGHT : constant is 1;
end game_man_move;
