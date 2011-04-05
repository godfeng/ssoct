library verilog;
use verilog.vl_types.all;
entity BFP_unitygain_tb is
    generic(
        NUM_FRAMES_c    : integer := 4;
        MAXVAL_c        : integer := 65536;
        OFFSET_c        : integer := 131072;
        MAXVAL_EXP_c    : integer := 32;
        OFFSET_EXP_c    : integer := 64
    );
end BFP_unitygain_tb;
