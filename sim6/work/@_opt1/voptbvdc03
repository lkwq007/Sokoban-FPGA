library verilog;
use verilog.vl_types.all;
entity bottom_layer is
    port(
        x_pos           : in     vl_logic_vector(9 downto 0);
        y_pos           : in     vl_logic_vector(9 downto 0);
        stage           : in     vl_logic_vector(1 downto 0);
        win             : in     vl_logic;
        lose            : in     vl_logic;
        sys_clk         : in     vl_logic;
        Red0            : out    vl_logic_vector(7 downto 0);
        Green0          : out    vl_logic_vector(7 downto 0);
        Blue0           : out    vl_logic_vector(7 downto 0);
        RqFlag0         : out    vl_logic;
        step            : in     vl_logic_vector(7 downto 0);
        step_exp        : in     vl_logic_vector(7 downto 0)
    );
end bottom_layer;
