library verilog;
use verilog.vl_types.all;
entity display is
    port(
        red             : out    vl_logic_vector(7 downto 0);
        green           : out    vl_logic_vector(7 downto 0);
        blue            : out    vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        win             : in     vl_logic;
        lose            : in     vl_logic;
        switch_sel      : in     vl_logic;
        direction       : in     vl_logic_vector(1 downto 0);
        step            : in     vl_logic_vector(7 downto 0);
        step_exp        : in     vl_logic_vector(7 downto 0);
        x_pos           : in     vl_logic_vector(9 downto 0);
        y_pos           : in     vl_logic_vector(9 downto 0);
        wall            : in     vl_logic_vector(63 downto 0);
        way             : in     vl_logic_vector(63 downto 0);
        box             : in     vl_logic_vector(63 downto 0);
        destination     : in     vl_logic_vector(63 downto 0);
        mine            : in     vl_logic_vector(63 downto 0);
        flag            : in     vl_logic_vector(63 downto 0);
        doubt           : in     vl_logic_vector(63 downto 0);
        \open\          : in     vl_logic_vector(63 downto 0);
        count           : in     vl_logic_vector(255 downto 0);
        man             : in     vl_logic_vector(5 downto 0);
        arrow_x         : in     vl_logic_vector(9 downto 0);
        arrow_y         : in     vl_logic_vector(9 downto 0);
        stage           : in     vl_logic_vector(1 downto 0)
    );
end display;
