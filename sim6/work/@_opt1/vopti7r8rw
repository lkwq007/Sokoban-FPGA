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
end LFSR_Plus;
