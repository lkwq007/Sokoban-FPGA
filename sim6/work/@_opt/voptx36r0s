library verilog;
use verilog.vl_types.all;
entity ps2_dataprogramme is
    port(
        data_ready      : in     vl_logic;
        reset           : in     vl_logic;
        x_increment     : in     vl_logic_vector(8 downto 0);
        y_increment     : in     vl_logic_vector(8 downto 0);
        left_button     : in     vl_logic;
        right_button    : in     vl_logic;
        sys_clk         : in     vl_logic;
        ArrowPosX       : out    vl_logic_vector(9 downto 0);
        ArrowPosY       : out    vl_logic_vector(9 downto 0);
        cursor          : out    vl_logic_vector(5 downto 0);
        GameArea        : out    vl_logic;
        retract         : out    vl_logic;
        retry           : out    vl_logic;
        left            : out    vl_logic;
        right           : out    vl_logic
    );
end ps2_dataprogramme;
