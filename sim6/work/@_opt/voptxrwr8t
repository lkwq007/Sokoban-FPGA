library verilog;
use verilog.vl_types.all;
entity ms_gen is
    generic(
        \RESET\         : integer := 0;
        START           : integer := 1;
        CONFRIM         : integer := 2;
        DONE            : integer := 3
    );
    port(
        mine            : out    vl_logic_vector(63 downto 0);
        gen_done        : out    vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        rand            : in     vl_logic_vector(5 downto 0)
    );
end ms_gen;
