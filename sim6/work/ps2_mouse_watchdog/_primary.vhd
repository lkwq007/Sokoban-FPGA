library verilog;
use verilog.vl_types.all;
entity ps2_mouse_watchdog is
    port(
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        falling_edge    : in     vl_logic;
        timer_150us_done: out    vl_logic;
        timer_400us_done: out    vl_logic
    );
end ps2_mouse_watchdog;
