library verilog;
use verilog.vl_types.all;
entity ps2_mouse_interface is
    port(
        sys_clk         : in     vl_logic;
        reset           : in     vl_logic;
        ps2_clk         : inout  vl_logic;
        ps2_data        : inout  vl_logic;
        ArrowPosX       : out    vl_logic_vector(9 downto 0);
        ArrowPosY       : out    vl_logic_vector(9 downto 0);
        cursor          : out    vl_logic_vector(5 downto 0);
        GameArea        : out    vl_logic;
        retract         : out    vl_logic;
        retry           : out    vl_logic;
        left            : out    vl_logic;
        right           : out    vl_logic
    );
end ps2_mouse_interface;
