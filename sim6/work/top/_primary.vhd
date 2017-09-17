library verilog;
use verilog.vl_types.all;
entity top is
    port(
        ps2_data        : inout  vl_logic;
        ps2_clk         : inout  vl_logic;
        ps2_data_key    : in     vl_logic;
        ps2_clk_key     : in     vl_logic;
        red             : out    vl_logic_vector(7 downto 0);
        green           : out    vl_logic_vector(7 downto 0);
        blue            : out    vl_logic_vector(7 downto 0);
        pixel_clk       : out    vl_logic;
        vga_comp_synch  : out    vl_logic;
        vga_blank_z     : out    vl_logic;
        hsync           : out    vl_logic;
        vsync           : out    vl_logic;
        clk             : in     vl_logic;
        reset_n         : in     vl_logic
    );
end top;
