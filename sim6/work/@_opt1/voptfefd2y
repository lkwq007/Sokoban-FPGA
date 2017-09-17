library verilog;
use verilog.vl_types.all;
entity interface is
    port(
        sys_clk         : in     vl_logic;
        reset           : in     vl_logic;
        ps2_clk         : in     vl_logic;
        ps2_data        : in     vl_logic;
        scan_code_ready : out    vl_logic;
        scan_code       : out    vl_logic_vector(7 downto 0);
        parity_error    : out    vl_logic
    );
end interface;
