library verilog;
use verilog.vl_types.all;
entity ms_round_check is
    port(
        check           : out    vl_logic_vector(63 downto 0);
        is_zero         : in     vl_logic_vector(63 downto 0);
        \open\          : in     vl_logic_vector(63 downto 0)
    );
end ms_round_check;
