library verilog;
use verilog.vl_types.all;
entity game_step_counter is
    generic(
        N               : integer := 256;
        CounterBits     : integer := 8
    );
    port(
        clk             : in     vl_logic;
        inc             : in     vl_logic;
        dec             : in     vl_logic;
        rst             : in     vl_logic;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
    attribute mti_svvh_generic_type of CounterBits : constant is 1;
end game_step_counter;
