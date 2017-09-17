library verilog;
use verilog.vl_types.all;
entity ms_gen is
    generic(
        \RESET\         : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        START           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        CONFRIM         : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        DONE            : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1)
    );
    port(
        mine            : out    vl_logic_vector(63 downto 0);
        gen_done        : out    vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        rand            : in     vl_logic_vector(5 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \RESET\ : constant is 1;
    attribute mti_svvh_generic_type of START : constant is 1;
    attribute mti_svvh_generic_type of CONFRIM : constant is 1;
    attribute mti_svvh_generic_type of DONE : constant is 1;
end ms_gen;
