library verilog;
use verilog.vl_types.all;
entity game_man_move is
    generic(
        UP              : integer := 0;
        DOWN            : integer := 1;
        LEFT            : integer := 2;
        RIGHT           : integer := 3
    );
    port(
        game_state_next : out    vl_logic_vector(133 downto 0);
        result          : out    vl_logic;
        direction       : out    vl_logic_vector(1 downto 0);
        game_state      : in     vl_logic_vector(133 downto 0);
        cursor          : in     vl_logic_vector(5 downto 0)
    );
end game_man_move;
