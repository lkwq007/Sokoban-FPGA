library verilog;
use verilog.vl_types.all;
entity game_init is
    port(
        stage           : in     vl_logic_vector(1 downto 0);
        wall            : out    vl_logic_vector(63 downto 0);
        destination     : out    vl_logic_vector(63 downto 0);
        game_state_int  : out    vl_logic_vector(133 downto 0);
        step_exp        : out    vl_logic_vector(7 downto 0)
    );
end game_init;
