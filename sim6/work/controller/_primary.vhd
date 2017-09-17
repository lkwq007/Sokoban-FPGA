library verilog;
use verilog.vl_types.all;
entity controller is
    generic(
        start           : integer := 0;
        ps2_clk_s_h     : integer := 1;
        falling_edge_marker: integer := 2;
        ps2_clk_s_l     : integer := 3;
        rising_edge_marker: integer := 4
    );
    port(
        sys_clk         : in     vl_logic;
        reset           : in     vl_logic;
        timer_reset     : out    vl_logic;
        timer_done      : in     vl_logic;
        counter_reset   : out    vl_logic;
        counter_en      : out    vl_logic;
        ps2_clk_s       : in     vl_logic;
        shift_en        : out    vl_logic;
        q               : in     vl_logic_vector(10 downto 0)
    );
end controller;
