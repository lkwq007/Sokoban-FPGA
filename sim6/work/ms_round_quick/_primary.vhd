library verilog;
use verilog.vl_types.all;
entity ms_round_quick is
    port(
        quick           : out    vl_logic_vector(63 downto 0);
        open_quick      : out    vl_logic_vector(63 downto 0);
        \open\          : in     vl_logic_vector(63 downto 0);
        cursor          : in     vl_logic_vector(5 downto 0);
        count_flag      : in     vl_logic_vector(255 downto 0);
        count_mine      : in     vl_logic_vector(255 downto 0)
    );
end ms_round_quick;
