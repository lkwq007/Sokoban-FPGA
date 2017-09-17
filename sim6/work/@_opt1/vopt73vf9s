library verilog;
use verilog.vl_types.all;
entity layer_mid_2 is
    generic(
        TOP             : integer := 91;
        LEFT            : integer := 272;
        WIDTH           : integer := 256;
        HEIGHT          : integer := 256;
        MAN_UP          : integer := 0;
        MAN_DOWN        : integer := 1;
        MAN_LEFT        : integer := 2;
        MAN_RIGHT       : integer := 3
    );
    port(
        RqFlag2         : out    vl_logic;
        Red2            : out    vl_logic_vector(7 downto 0);
        Blue2           : out    vl_logic_vector(7 downto 0);
        Green2          : out    vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        x_pos           : in     vl_logic_vector(9 downto 0);
        y_pos           : in     vl_logic_vector(9 downto 0);
        man             : in     vl_logic_vector(5 downto 0);
        direction       : in     vl_logic_vector(1 downto 0)
    );
end layer_mid_2;
