library verilog;
use verilog.vl_types.all;
entity v_control is
    generic(
        Vsynch          : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        Vbp             : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        Vactice         : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        Vfp             : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    port(
        sys_clk         : in     vl_logic;
        reset           : in     vl_logic;
        co2             : in     vl_logic;
        EndLine         : in     vl_logic;
        v_nblank        : out    vl_logic;
        vsync           : out    vl_logic;
        EndFrame        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Vsynch : constant is 1;
    attribute mti_svvh_generic_type of Vbp : constant is 1;
    attribute mti_svvh_generic_type of Vactice : constant is 1;
    attribute mti_svvh_generic_type of Vfp : constant is 1;
end v_control;
