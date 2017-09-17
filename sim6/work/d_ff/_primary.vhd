library verilog;
use verilog.vl_types.all;
entity d_ff is
    port(
        reset           : in     vl_logic;
        sys_clk         : in     vl_logic;
        ps2_clk         : in     vl_logic;
        ps2_data        : in     vl_logic;
        ps2_clk_s       : out    vl_logic;
        ps2_data_s      : out    vl_logic
    );
end d_ff;
