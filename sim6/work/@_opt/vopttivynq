library verilog;
use verilog.vl_types.all;
entity direct_instruction is
    generic(
        \a_CODE\        : integer := 97;
        \w_CODE\        : integer := 119;
        \s_CODE\        : integer := 115;
        \d_CODE\        : integer := 100;
        \A_CODE\        : integer := 65;
        \W_CODE\        : integer := 87;
        \S_CODE\        : integer := 83;
        \D_CODE\        : integer := 68;
        ENTER_CODE      : integer := 13;
        BACKSPACE_CODE  : integer := 8;
        ESC_CODE        : integer := 27;
        \m_CODE\        : integer := 109;
        \M_CODE\        : integer := 77
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        released        : in     vl_logic;
        ascii           : in     vl_logic_vector(7 downto 0);
        data_ready      : in     vl_logic;
        read            : out    vl_logic;
        a_left          : out    vl_logic;
        m_switch        : out    vl_logic;
        w_up            : out    vl_logic;
        s_down          : out    vl_logic;
        d_right         : out    vl_logic;
        enter_next      : out    vl_logic;
        esc_retry       : out    vl_logic;
        backspace_retract: out    vl_logic
    );
end direct_instruction;
