library verilog;
use verilog.vl_types.all;
entity game_controller_tb is
    generic(
        DELAY           : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DELAY : constant is 1;
end game_controller_tb;
