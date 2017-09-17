library verilog;
use verilog.vl_types.all;
entity ms_layer is
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
        lose            : in     vl_logic;
        flag            : in     vl_logic_vector(63 downto 0);
        doubt           : in     vl_logic_vector(63 downto 0);
        mine            : in     vl_logic_vector(63 downto 0);
        \open\          : in     vl_logic_vector(63 downto 0);
        x_pos           : in     vl_logic_vector(9 downto 0);
        y_pos           : in     vl_logic_vector(9 downto 0);
        count           : in     vl_logic_vector(255 downto 0)
    );
end ms_layer;
