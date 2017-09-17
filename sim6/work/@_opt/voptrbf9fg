library verilog;
use verilog.vl_types.all;
entity layer_mid_1 is
    generic(
        TOP             : integer := 91;
        LEFT            : integer := 272;
        WIDTH           : integer := 256;
        HEIGHT          : integer := 256
    );
    port(
        RqFlag1         : out    vl_logic;
        Red1            : out    vl_logic_vector(7 downto 0);
        Blue1           : out    vl_logic_vector(7 downto 0);
        Green1          : out    vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        man             : in     vl_logic_vector(5 downto 0);
        box             : in     vl_logic_vector(63 downto 0);
        way             : in     vl_logic_vector(63 downto 0);
        wall            : in     vl_logic_vector(63 downto 0);
        destination     : in     vl_logic_vector(63 downto 0);
        x_pos           : in     vl_logic_vector(9 downto 0);
        y_pos           : in     vl_logic_vector(9 downto 0)
    );
end layer_mid_1;
