library verilog;
use verilog.vl_types.all;
entity ps2_mouse_interface_fallingtest is
    generic(
        ps2_clk_h       : integer := 0;
        ps2_clk_falling : integer := 1;
        ps2_clk_l       : integer := 2
    );
    port(
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        ps2_clk         : in     vl_logic;
        falling_edge    : out    vl_logic
    );
end ps2_mouse_interface_fallingtest;
