library verilog;
use verilog.vl_types.all;
entity bottomROM is
    port(
        addr            : in     vl_logic_vector(13 downto 0);
        clk             : in     vl_logic;
        dout            : out    vl_logic_vector(23 downto 0);
        en              : in     vl_logic
    );
end bottomROM;
