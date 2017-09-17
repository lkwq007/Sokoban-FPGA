library verilog;
use verilog.vl_types.all;
entity ms_counter is
    generic(
        N               : integer := 16;
        CounterBits     : integer := 4
    );
    port(
        clk             : in     vl_logic;
        en              : in     vl_logic;
        rst             : in     vl_logic;
        co              : out    vl_logic;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
    attribute mti_svvh_generic_type of CounterBits : constant is 1;
end ms_counter;
