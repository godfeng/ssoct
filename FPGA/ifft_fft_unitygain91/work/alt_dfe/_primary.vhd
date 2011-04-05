library verilog;
use verilog.vl_types.all;
entity alt_dfe is
    generic(
        channel_address_width: integer := 3;
        lpm_type        : string  := "alt_dfe";
        lpm_hint        : string  := "UNUSED";
        avmm_slave_addr_width: integer := 16;
        avmm_slave_rdata_width: integer := 16;
        avmm_slave_wdata_width: integer := 16;
        avmm_master_addr_width: integer := 16;
        avmm_master_rdata_width: integer := 16;
        avmm_master_wdata_width: integer := 16;
        dprio_addr_width: integer := 16;
        dprio_data_width: integer := 16;
        ireg_wdaddr_width: integer := 2;
        ireg_data_width : integer := 16;
        ST_IDLE         : integer := 0;
        ST_WRITE        : integer := 1;
        ST_READ         : integer := 2
    );
    port(
        i_resetn        : in     vl_logic;
        i_avmm_clk      : in     vl_logic;
        i_avmm_saddress : in     vl_logic_vector;
        i_avmm_sread    : in     vl_logic;
        i_avmm_swrite   : in     vl_logic;
        i_avmm_swritedata: in     vl_logic_vector;
        o_avmm_sreaddata: out    vl_logic_vector;
        o_avmm_swaitrequest: out    vl_logic;
        i_remap_address : in     vl_logic_vector(11 downto 0);
        o_quad_address  : out    vl_logic_vector(8 downto 0);
        o_reconfig_busy : out    vl_logic;
        i_dprio_busy    : in     vl_logic;
        i_dprio_in      : in     vl_logic_vector;
        o_dprio_wren    : out    vl_logic;
        o_dprio_rden    : out    vl_logic;
        o_dprio_addr    : out    vl_logic_vector;
        o_dprio_data    : out    vl_logic_vector
    );
end alt_dfe;
