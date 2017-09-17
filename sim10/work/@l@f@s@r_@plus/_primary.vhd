library verilog;
use verilog.vl_types.all;
entity LFSR_Plus is
    generic(
        W               : integer := 6;
        V               : integer := 18;
        g_type          : integer := 0;
        u_type          : integer := 0
    );
    port(
        g_noise_out     : out    vl_logic_vector;
        u_noise_out     : out    vl_logic_vector;
        clk             : in     vl_logic;
        n_reset         : in     vl_logic;
        enable          : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of W : constant is 1;
    attribute mti_svvh_generic_type of V : constant is 1;
    attribute mti_svvh_generic_type of g_type : constant is 1;
    attribute mti_svvh_generic_type of u_type : constant is 1;
end LFSR_Plus;
