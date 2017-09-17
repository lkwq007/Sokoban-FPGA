library verilog;
use verilog.vl_types.all;
entity game_mux_4 is
    generic(
        N               : integer := 134
    );
    port(
        sel             : in     vl_logic_vector(1 downto 0);
        in_0            : in     vl_logic_vector;
        in_1            : in     vl_logic_vector;
        in_2            : in     vl_logic_vector;
        in_3            : in     vl_logic_vector;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end game_mux_4;
