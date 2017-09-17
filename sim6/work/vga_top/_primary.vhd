library verilog;
use verilog.vl_types.all;
entity vga_top is
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        display_mode    : in     vl_logic;
        sys_clk         : out    vl_logic;
        hsync           : out    vl_logic;
        vsync           : out    vl_logic;
        vga_comp_synch  : out    vl_logic;
        vga_blank_z     : out    vl_logic;
        red             : out    vl_logic_vector(7 downto 0);
        green           : out    vl_logic_vector(7 downto 0);
        blue            : out    vl_logic_vector(7 downto 0)
    );
end vga_top;
