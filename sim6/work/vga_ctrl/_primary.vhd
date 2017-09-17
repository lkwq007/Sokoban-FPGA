library verilog;
use verilog.vl_types.all;
entity vga_ctrl is
    port(
        sys_clk         : in     vl_logic;
        reset           : in     vl_logic;
        x_pos           : out    vl_logic_vector(9 downto 0);
        y_pos           : out    vl_logic_vector(9 downto 0);
        nblank          : out    vl_logic;
        EndFrame        : out    vl_logic;
        vsync           : out    vl_logic;
        hsync           : out    vl_logic;
        vga_blank_z     : out    vl_logic;
        vga_comp_synch  : out    vl_logic
    );
end vga_ctrl;
