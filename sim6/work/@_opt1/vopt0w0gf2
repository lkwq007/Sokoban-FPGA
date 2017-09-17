library verilog;
use verilog.vl_types.all;
entity ps2_mouse_interface_controller is
    generic(
        start           : integer := 0;
        hold_clk_l      : integer := 1;
        transmit        : integer := 2;
        error_ack       : integer := 3;
        wait_response   : integer := 4;
        receive_start   : integer := 5;
        gather          : integer := 6;
        verify          : integer := 7;
        data_output     : integer := 8
    );
    port(
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        timer_150us_done: in     vl_logic;
        timer_400us_done: in     vl_logic;
        bit_reset       : out    vl_logic;
        bit_counter     : in     vl_logic_vector(6 downto 0);
        ps2_clk_hiz     : out    vl_logic;
        ps2_data_hiz    : out    vl_logic;
        load            : out    vl_logic;
        q               : in     vl_logic_vector(32 downto 0);
        data_ready      : out    vl_logic;
        error_no_ack    : out    vl_logic;
        ps2_data        : in     vl_logic
    );
end ps2_mouse_interface_controller;
