library verilog;
use verilog.vl_types.all;
entity switch is
    port(
        switch_reset    : out    vl_logic;
        switch_sel      : out    vl_logic;
        win             : out    vl_logic;
        lose            : out    vl_logic;
        key_switch      : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        win_s           : in     vl_logic;
        win_m           : in     vl_logic;
        lose_s          : in     vl_logic;
        lose_m          : in     vl_logic
    );
end switch;
