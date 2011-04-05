onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider testbench
add wave -noupdate -format Logic /fft_32K_tb/clk
add wave -noupdate -format Logic /fft_32K_tb/reset
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/data_real_in
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/data_imag_in
add wave -noupdate -format Logic /fft_32K_tb/master_sink_dav
add wave -noupdate -format Logic /fft_32K_tb/master_sink_ena
add wave -noupdate -format Logic /fft_32K_tb/master_sink_sop
add wave -noupdate -format Logic /fft_32K_tb/master_source_dav
add wave -noupdate -format Logic /fft_32K_tb/inv_i
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/fft_real_out
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/fft_imag_out
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/exponent_out
add wave -noupdate -format Logic /fft_32K_tb/master_source_ena
add wave -noupdate -format Logic /fft_32K_tb/master_source_sop
add wave -noupdate -format Logic /fft_32K_tb/master_source_eop
add wave -noupdate -divider combine_fft
add wave -noupdate -format Logic /fft_32K_tb/dut/combine_fft_inst/clk_fft
add wave -noupdate -format Logic /fft_32K_tb/dut/combine_fft_inst/clk_data_out
add wave -noupdate -format Logic /fft_32K_tb/dut/combine_fft_inst/reset
add wave -noupdate -format Logic /fft_32K_tb/dut/combine_fft_inst/master_source_ena
add wave -noupdate -format Logic /fft_32K_tb/dut/combine_fft_inst/master_source_sop
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/fft_real_out_fft_top
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/fft_imag_out_fft_top
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/exponent_out_fft_top
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/fft_real_out_fft_bot
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/fft_imag_out_fft_bot
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/exponent_out_fft_bot
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/fft_real_comb
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/fft_imag_comb
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/exponent_comb
add wave -noupdate -divider twiddle_rom
add wave -noupdate -format Literal -radix unsigned /fft_32K_tb/dut/combine_fft_inst/twiddle_add/rom_add
add wave -noupdate -format Literal -radix unsigned /fft_32K_tb/dut/combine_fft_inst/twiddle_add/rom_add_sin
add wave -noupdate -format Logic /fft_32K_tb/dut/combine_fft_inst/twiddle_add/tf_sp
add wave -noupdate -format Logic /fft_32K_tb/dut/combine_fft_inst/twiddle_add/quadrant_3_4
add wave -noupdate -format Logic /fft_32K_tb/dut/combine_fft_inst/twiddle_add/quadrant_2_3
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/twiddle_add/cr
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/twiddle_add/ci
add wave -noupdate -format Literal -radix unsigned /fft_32K_tb/dut/combine_fft_inst/twiddle_add/count
add wave -noupdate -format Logic /fft_32K_tb/dut/combine_fft_inst/twiddle_add/cnt_dir
add wave -noupdate -format Logic /fft_32K_tb/dut/combine_fft_inst/twiddle_add/reset_cnt
add wave -noupdate -format Literal /fft_32K_tb/dut/combine_fft_inst/twiddle_add/quadrant_wire
add wave -noupdate -format Logic /fft_32K_tb/dut/combine_fft_inst/twiddle_add/cnt_en_d1
add wave -noupdate -format Logic /fft_32K_tb/dut/combine_fft_inst/twiddle_add/cnt_en
add wave -noupdate -divider multiply_tf
add wave -noupdate -format Logic /fft_32K_tb/dut/combine_fft_inst/multiply_twiddle_factor/quadrant_3_4
add wave -noupdate -format Logic /fft_32K_tb/dut/combine_fft_inst/multiply_twiddle_factor/quadrant_2_3
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/multiply_twiddle_factor/cr
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/multiply_twiddle_factor/ci
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/multiply_twiddle_factor/cr_mod_reg
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/multiply_twiddle_factor/ci_mod_reg
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/multiply_twiddle_factor/cr_rom_reg
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/multiply_twiddle_factor/ci_rom_reg
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/multiply_twiddle_factor/mult_add_real/dataa_0
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/multiply_twiddle_factor/mult_add_real/datab_0
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/multiply_twiddle_factor/mult_add_real/dataa_1
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/multiply_twiddle_factor/mult_add_real/datab_1
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/multiply_twiddle_factor/mult_add_real/result
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/multiply_twiddle_factor/mult_add_imag/dataa_0
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/multiply_twiddle_factor/mult_add_imag/datab_0
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/multiply_twiddle_factor/mult_add_imag/dataa_1
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/multiply_twiddle_factor/mult_add_imag/datab_1
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/multiply_twiddle_factor/mult_add_imag/result
add wave -noupdate -divider scale_fft
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/scale_fft_real_imag/exponent_out_fft_top
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/scale_fft_real_imag/exponent_out_fft_bot
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/scale_fft_real_imag/exponent_out_del
add wave -noupdate -format Logic /fft_32K_tb/dut/combine_fft_inst/scale_fft_real_imag/shift_dir
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/scale_fft_real_imag/shift_diff
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/scale_fft_real_imag/distance
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/scale_fft_real_imag/rr_scaled
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/scale_fft_real_imag/ri_scaled
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/scale_fft_real_imag/rr_scaled_shifted
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/scale_fft_real_imag/ri_scaled_shifted
add wave -noupdate -divider combine_fft_top_bot
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/comb_fft_add_real/dataa
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/comb_fft_add_real/datab
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/comb_fft_add_real/result
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/comb_fft_add_imag/dataa
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/comb_fft_add_imag/datab
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/comb_fft_add_imag/result
add wave -noupdate -format Logic /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/mram_wren
add wave -noupdate -format Literal -radix unsigned /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/mram_writeadd_w
add wave -noupdate -format Logic /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/toggle_mram_wradd
add wave -noupdate -format Literal -radix unsigned /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/count
add wave -noupdate -format Literal -radix unsigned /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/mram_writeadd
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/fft_real_comb_wire
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/fft_imag_comb_wire
add wave -noupdate -format Literal -radix unsigned /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/mram_readadd
add wave -noupdate -format Logic -radix unsigned /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/mram_rden
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/fft_real_out_fft_w
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/fft_imag_out_fft_w
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/fft_real_out_fft
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/combine_fft_inst/combine_fft_top_bot/fft_imag_out_fft
add wave -noupdate -divider parse_input
add wave -noupdate -format Logic /fft_32K_tb/dut/parse_fft_input_inst/clk_data_in
add wave -noupdate -format Logic /fft_32K_tb/dut/parse_fft_input_inst/clk_fft
add wave -noupdate -format Logic /fft_32K_tb/dut/parse_fft_input_inst/reset
add wave -noupdate -format Logic /fft_32K_tb/dut/parse_fft_input_inst/master_sink_dav
add wave -noupdate -format Logic /fft_32K_tb/dut/parse_fft_input_inst/master_sink_sop
add wave -noupdate -format Logic /fft_32K_tb/dut/parse_fft_input_inst/master_source_dav
add wave -noupdate -format Logic /fft_32K_tb/dut/parse_fft_input_inst/inv_i
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/parse_fft_input_inst/data_real_in
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/parse_fft_input_inst/data_imag_in
add wave -noupdate -format Logic /fft_32K_tb/dut/parse_fft_input_inst/master_sink_ena
add wave -noupdate -format Logic /fft_32K_tb/dut/parse_fft_input_inst/master_sink_dav_fft
add wave -noupdate -format Logic /fft_32K_tb/dut/parse_fft_input_inst/master_sink_sop_fft
add wave -noupdate -format Logic /fft_32K_tb/dut/parse_fft_input_inst/master_source_dav_fft
add wave -noupdate -format Logic /fft_32K_tb/dut/parse_fft_input_inst/inv_i_fft
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/parse_fft_input_inst/data_real_in_fft_top
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/parse_fft_input_inst/data_imag_in_fft_top
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/parse_fft_input_inst/data_real_in_fft_bot
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/parse_fft_input_inst/data_imag_in_fft_bot
add wave -noupdate -format Logic /fft_32K_tb/dut/parse_fft_input_inst/cnt
add wave -noupdate -divider fft_small_top
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_top/clk
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_top/master_sink_dav
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_top/master_sink_ena
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_top/master_sink_sop
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/fft_small_top/data_real_in
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/fft_small_top/data_imag_in
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_top/master_source_dav
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_top/master_source_ena
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_top/master_source_sop
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_top/master_source_eop
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/fft_small_top/fft_real_out
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/fft_small_top/fft_imag_out
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/fft_small_top/exponent_out
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_top/inv_i
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_top/reset
add wave -noupdate -divider fft_small_bot
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_bot/clk
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_bot/master_sink_dav
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_bot/master_sink_ena
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_bot/master_sink_sop
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/fft_small_bot/data_imag_in
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/fft_small_bot/data_real_in
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_bot/master_source_dav
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_bot/master_source_ena
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_bot/master_source_sop
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_bot/master_source_eop
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/fft_small_bot/fft_real_out
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/fft_small_bot/fft_imag_out
add wave -noupdate -format Literal -radix decimal /fft_32K_tb/dut/fft_small_bot/exponent_out
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_bot/inv_i
add wave -noupdate -format Logic /fft_32K_tb/dut/fft_small_bot/reset
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 406
configure wave -valuecolwidth 113
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
WaveRestoreZoom {0 ps} {1575 us}
