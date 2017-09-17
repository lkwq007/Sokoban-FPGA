library verilog;
use verilog.vl_types.all;
entity v_control is
    generic(
        Vsynch          : integer := 0;
        Vbp             : integer := 1;
        Vactice         : integer := 2;
        Vfp             : integer := 3
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
end v_control;
