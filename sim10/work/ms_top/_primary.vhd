library verilog;
use verilog.vl_types.all;
entity ms_top is
    port(
        flag            : out    vl_logic_vector(63 downto 0);
        doubt           : out    vl_logic_vector(63 downto 0);
        \open\          : out    vl_logic_vector(63 downto 0);
        mine            : out    vl_logic_vector(63 downto 0);
        win             : out    vl_logic;
        lose            : out    vl_logic;
        count_mine      : out    vl_logic_vector(255 downto 0);
        clk             : in     vl_logic;
        left            : in     vl_logic;
        right           : in     vl_logic;
        game_area       : in     vl_logic;
        retry           : in     vl_logic;
        reset           : in     vl_logic;
        cursor          : in     vl_logic_vector(5 downto 0)
    );
end ms_top;
