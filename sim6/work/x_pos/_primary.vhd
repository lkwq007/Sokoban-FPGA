library verilog;
use verilog.vl_types.all;
entity x_pos is
    port(
        sys_clk         : in     vl_logic;
        reset           : in     vl_logic;
        x_pos           : out    vl_logic_vector(9 downto 0);
        co1             : out    vl_logic
    );
end x_pos;
