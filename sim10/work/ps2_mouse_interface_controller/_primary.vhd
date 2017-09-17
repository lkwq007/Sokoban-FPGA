library verilog;
use verilog.vl_types.all;
entity ps2_mouse_interface_controller is
    generic(
        start           : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi0, Hi0);
        hold_clk_l      : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi0, Hi1);
        transmit        : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi1, Hi0);
        error_ack       : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi1, Hi1);
        wait_response   : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi0, Hi0);
        receive_start   : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi0, Hi1);
        gather          : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi1, Hi0);
        verify          : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi1, Hi1);
        data_output     : vl_logic_vector(3 downto 0) := (Hi1, Hi0, Hi0, Hi0)
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
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of start : constant is 2;
    attribute mti_svvh_generic_type of hold_clk_l : constant is 2;
    attribute mti_svvh_generic_type of transmit : constant is 2;
    attribute mti_svvh_generic_type of error_ack : constant is 2;
    attribute mti_svvh_generic_type of wait_response : constant is 2;
    attribute mti_svvh_generic_type of receive_start : constant is 2;
    attribute mti_svvh_generic_type of gather : constant is 2;
    attribute mti_svvh_generic_type of verify : constant is 2;
    attribute mti_svvh_generic_type of data_output : constant is 2;
end ps2_mouse_interface_controller;
