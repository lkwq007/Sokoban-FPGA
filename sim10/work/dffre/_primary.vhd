library verilog;
use verilog.vl_types.all;
entity dffre is
    generic(
        N               : integer := 134
    );
    port(
        d               : in     vl_logic_vector;
        en              : in     vl_logic;
        r               : in     vl_logic;
        clk             : in     vl_logic;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end dffre;
