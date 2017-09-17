library verilog;
use verilog.vl_types.all;
entity data_process is
    generic(
        shift_key_clr   : integer := 0;
        sign_clr        : integer := 1;
        wait_data       : integer := 2;
        extend_code_set : integer := 3;
        released_code_set: integer := 4;
        shift_key_set   : integer := 5;
        data_output     : integer := 6;
        EXTEND_CODE     : integer := 224;
        RELEASE_CODE    : integer := 240;
        LEFT_SHIFT      : integer := 18;
        RIGHT_SHIFT     : integer := 89
    );
    port(
        sys_clk         : in     vl_logic;
        reset           : in     vl_logic;
        scan_code       : in     vl_logic_vector(7 downto 0);
        scan_code_ready : in     vl_logic;
        read            : in     vl_logic;
        extended        : out    vl_logic;
        released        : out    vl_logic;
        shift_key_on    : out    vl_logic;
        scan_code_out   : out    vl_logic_vector(7 downto 0);
        ascii_out       : out    vl_logic_vector(7 downto 0);
        data_ready      : out    vl_logic
    );
end data_process;
