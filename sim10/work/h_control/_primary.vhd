library verilog;
use verilog.vl_types.all;
entity h_control is
    generic(
        Hsynch          : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        Hbp             : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        Hactice         : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        Hfp             : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    port(
        sys_clk         : in     vl_logic;
        reset           : in     vl_logic;
        co1             : in     vl_logic;
        h_nblank        : out    vl_logic;
        EndLine         : out    vl_logic;
        hsync           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Hsynch : constant is 1;
    attribute mti_svvh_generic_type of Hbp : constant is 1;
    attribute mti_svvh_generic_type of Hactice : constant is 1;
    attribute mti_svvh_generic_type of Hfp : constant is 1;
end h_control;
