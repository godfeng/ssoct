onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /BFP_unitygain_tb/sink_valid
add wave -noupdate -format Logic /BFP_unitygain_tb/sink_sop
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/sink_real
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/sink_imag
add wave -noupdate -format Logic /BFP_unitygain_tb/sink_eop
add wave -noupdate -format Literal /BFP_unitygain_tb/sink_error
add wave -noupdate -format Logic /BFP_unitygain_tb/source_ready
add wave -noupdate -divider {New Divider}
add wave -noupdate -format Logic /BFP_unitygain_tb/sink_ready
add wave -noupdate -format Literal /BFP_unitygain_tb/sink_error
add wave -noupdate -format Logic /BFP_unitygain_tb/source_valid
add wave -noupdate -format Logic /BFP_unitygain_tb/source_sop
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/source_real
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/source_imag
add wave -noupdate -format Logic /BFP_unitygain_tb/source_eop
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/ifft_sink_valid
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/ifft_sink_sop
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/ifft_sink_eop
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/dut/ifft_sink_real
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/dut/ifft_sink_imag
add wave -noupdate -format Literal /BFP_unitygain_tb/dut/ifft_sink_error
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/ifft_source_valid
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/ifft_source_sop
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/ifft_source_eop
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/dut/ifft_source_exp
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/dut/ifft_source_real
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/dut/ifft_source_imag
add wave -noupdate -format Literal /BFP_unitygain_tb/dut/ifft_source_error
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/fft_sink_valid
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/fft_sink_sop
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/fft_sink_eop
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/dut/fft_sink_real
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/dut/fft_sink_imag
add wave -noupdate -format Literal /BFP_unitygain_tb/dut/fft_sink_error
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/fft_source_ready
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/fft_source_valid
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/fft_source_sop
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/fft_source_eop
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/dut/fft_source_exp
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/dut/fft_source_real
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/dut/fft_source_imag
add wave -noupdate -format Literal /BFP_unitygain_tb/dut/fft_source_error
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/scaler_sink_valid
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/scaler_sink_sop
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/scaler_sink_eop
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/dut/scaler_sink_exp
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/dut/scaler_sink_real
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/dut/scaler_sink_imag
add wave -noupdate -format Literal /BFP_unitygain_tb/dut/scaler_sink_error
add wave -noupdate -format Literal /BFP_unitygain_tb/dut/scaler_source_error
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/scaler_source_valid
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/scaler_source_sop
add wave -noupdate -format Logic /BFP_unitygain_tb/dut/scaler_source_eop
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/dut/scaler_source_real
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/dut/scaler_source_imag
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/dut/exp_ifft
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/dut/exp_ifft_fft_sum
add wave -noupdate -format Literal -radix decimal /BFP_unitygain_tb/dut/fft_source_exp_d1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 312
configure wave -valuecolwidth 58
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {0 ps} {21 us}
