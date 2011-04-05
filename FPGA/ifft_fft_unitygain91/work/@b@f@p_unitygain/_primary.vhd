library verilog;
use verilog.vl_types.all;
entity BFP_unitygain is
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        ifft_sink_valid : in     vl_logic;
        ifft_sink_sop   : in     vl_logic;
        ifft_sink_eop   : in     vl_logic;
        ifft_sink_real  : in     vl_logic_vector(15 downto 0);
        ifft_sink_imag  : in     vl_logic_vector(15 downto 0);
        ifft_sink_error : in     vl_logic_vector(1 downto 0);
        scaler_source_ready: in     vl_logic;
        ifft_sink_ready : out    vl_logic;
        scaler_source_valid: out    vl_logic;
        scaler_source_sop: out    vl_logic;
        scaler_source_eop: out    vl_logic;
        scaler_source_real: out    vl_logic_vector(16 downto 0);
        scaler_source_imag: out    vl_logic_vector(16 downto 0);
        scaler_source_error: out    vl_logic_vector(1 downto 0)
    );
end BFP_unitygain;
