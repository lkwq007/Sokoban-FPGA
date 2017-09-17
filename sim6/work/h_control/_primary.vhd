library verilog;
use verilog.vl_types.all;
entity h_control is
    generic(
        Hsynch          : integer := 0;
        Hbp             : integer := 1;
        Hactice         : integer := 2;
        Hfp             : integer := 3
    );
    port(
        sys_clk         : in     vl_logic;
        reset           : in     vl_logic;
        co1             : in     vl_logic;
        h_nblank        : out    vl_logic;
        EndLine         : out    vl_logic;
        hsync           : out    vl_logic
    );
end h_control;
