library verilog;
use verilog.vl_types.all;
entity layer_sel is
    port(
        Red             : out    vl_logic_vector(7 downto 0);
        Blue            : out    vl_logic_vector(7 downto 0);
        Green           : out    vl_logic_vector(7 downto 0);
        switch_sel      : in     vl_logic;
        RqFlag0         : in     vl_logic;
        Red0            : in     vl_logic_vector(7 downto 0);
        Blue0           : in     vl_logic_vector(7 downto 0);
        Green0          : in     vl_logic_vector(7 downto 0);
        RqFlag1         : in     vl_logic;
        Red1            : in     vl_logic_vector(7 downto 0);
        Blue1           : in     vl_logic_vector(7 downto 0);
        Green1          : in     vl_logic_vector(7 downto 0);
        RqFlag2         : in     vl_logic;
        Red2            : in     vl_logic_vector(7 downto 0);
        Blue2           : in     vl_logic_vector(7 downto 0);
        Green2          : in     vl_logic_vector(7 downto 0);
        RqFlag3         : in     vl_logic;
        Red3            : in     vl_logic_vector(7 downto 0);
        Blue3           : in     vl_logic_vector(7 downto 0);
        Green3          : in     vl_logic_vector(7 downto 0);
        RqFlagm         : in     vl_logic;
        Redm            : in     vl_logic_vector(7 downto 0);
        Bluem           : in     vl_logic_vector(7 downto 0);
        Greenm          : in     vl_logic_vector(7 downto 0)
    );
end layer_sel;
