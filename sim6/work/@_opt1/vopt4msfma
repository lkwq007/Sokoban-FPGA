library verilog;
use verilog.vl_types.all;
entity ms_timer is
    generic(
        N               : integer := 600;
        BIT             : integer := 10
    );
    port(
        q               : out    vl_logic_vector;
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        start           : in     vl_logic;
        stop            : in     vl_logic
    );
end ms_timer;
