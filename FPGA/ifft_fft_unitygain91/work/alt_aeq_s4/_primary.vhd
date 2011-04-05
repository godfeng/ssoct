library verilog;
use verilog.vl_types.all;
entity alt_aeq_s4 is
    generic(
        show_errors     : string  := "NO";
        radce_hflck     : integer := 0;
        radce_lflck     : integer := 0;
        use_hw_conv_det : integer := 0;
        number_of_channels: integer := 5;
        channel_address_width: integer := 3;
        lpm_type        : string  := "alt_aeq_s4";
        lpm_hint        : string  := "UNUSED"
    );
    port(
        reconfig_clk    : in     vl_logic;
        aclr            : in     vl_logic;
        calibrate       : in     vl_logic;
        shutdown        : in     vl_logic;
        all_channels    : in     vl_logic;
        logical_channel_address: in     vl_logic_vector;
        remap_address   : in     vl_logic_vector(11 downto 0);
        quad_address    : out    vl_logic_vector(8 downto 0);
        adce_done       : in     vl_logic_vector;
        busy            : out    vl_logic;
        adce_standby    : out    vl_logic_vector;
        adce_continuous : in     vl_logic;
        dprio_busy      : in     vl_logic;
        dprio_in        : in     vl_logic_vector(15 downto 0);
        dprio_wren      : out    vl_logic;
        dprio_rden      : out    vl_logic;
        dprio_addr      : out    vl_logic_vector(15 downto 0);
        dprio_data      : out    vl_logic_vector(15 downto 0);
        eqout           : out    vl_logic_vector(3 downto 0);
        testbuses       : in     vl_logic_vector;
        testbus_sels    : out    vl_logic_vector;
        conv_error      : out    vl_logic_vector;
        error           : out    vl_logic_vector
    );
end alt_aeq_s4;
