library verilog;
use verilog.vl_types.all;
entity game_stage_counter is
    generic(
        N               : integer := 4;
        CounterBits     : integer := 2
    );
    port(
        clk             : in     vl_logic;
        en              : in     vl_logic;
        rst             : in     vl_logic;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
    attribute mti_svvh_generic_type of CounterBits : constant is 1;
end game_stage_counter;
