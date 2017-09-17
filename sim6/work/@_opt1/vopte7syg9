library verilog;
use verilog.vl_types.all;
entity game_retract is
    port(
        clk             : in     vl_logic;
        game_state      : out    vl_logic_vector(133 downto 0);
        game_state_int  : in     vl_logic_vector(133 downto 0);
        game_state_bm   : in     vl_logic_vector(133 downto 0);
        game_state_mm   : in     vl_logic_vector(133 downto 0);
        game_state_en   : in     vl_logic;
        sel             : in     vl_logic_vector(1 downto 0);
        real_retract    : out    vl_logic
    );
end game_retract;
