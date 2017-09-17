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
end ms_counter;
