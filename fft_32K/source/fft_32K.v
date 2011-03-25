module fft_32K (
	clk,
	reset,
	master_sink_dav,
	master_sink_sop,
	master_source_dav,
	inv_i,
	data_real_in,
	data_imag_in,
	fft_real_out,
	fft_imag_out,
	exponent_out,
	master_sink_ena,
	master_source_sop,
	master_source_eop,
	master_source_ena);
	
		
	// GLOBAL PARAMETER DECLARATION
   parameter data_width = 16;    //The number of bits in the input data for both real and imag parts
	parameter twiddle_width = 16; //The number of bits in the twiddle factor for both real and imag parts
   parameter transform_length = 32768;
  	parameter coshex_init_file = "fft_32K_coshex.hex";
	parameter sinhex_init_file = "fft_32K_sinhex.hex";
	parameter log2_transform_length = 15;
	parameter	mram_buf_add_width = 15; 
 

	input			clk;
	input			reset;
	input			master_sink_dav;
	input			master_sink_sop;
	input			master_source_dav;
	input			inv_i;
	input	[data_width-1:0]	data_real_in;
	input	[data_width-1:0]	data_imag_in;
	output	[data_width-1:0]	fft_real_out;
	output	[data_width-1:0]	fft_imag_out;
	output	[5:0]	exponent_out;
	output			master_sink_ena;
	output			master_source_sop;
	output			master_source_eop;
	output			master_source_ena;
	
	wire 			clk_fft;
	wire 			clk_data;
	wire 	[data_width-1:0]  data_real_in_fft_top;
	wire 	[data_width-1:0]  data_imag_in_fft_top;
	wire 	[data_width-1:0]  data_real_in_fft_bot;
	wire 	[data_width-1:0]  data_imag_in_fft_bot;
	wire			inv_i_fft;
	wire			master_sink_ena_comb;
	wire			master_sink_ena_fft_top;
	wire			master_sink_ena_fft_bot;
	wire			master_sink_dav_fft;
	wire 			master_sink_sop_fft;
	
	wire [data_width-1:0]  fft_real_out_fft_top;
	wire	[data_width-1:0]  fft_imag_out_fft_top;
	wire	[data_width-1:0]  fft_real_out_fft_bot;
	wire	[data_width-1:0]  fft_imag_out_fft_bot;
	wire	[5:0]	exp_out_fft_top;
	wire	[5:0] exp_out_fft_bot;
	wire 			master_source_dav_fft;
	wire 			master_source_sop_fft_top;
	wire			master_source_eop_fft_top;
	wire			master_source_ena_fft_top;
	wire			master_source_sop_fft_bot;
	wire			master_source_eop_fft_bot;
	wire			master_source_ena_fft_bot;
	wire     master_source_ena_comb;
	wire     master_source_sop_comb;
	wire     master_source_eop_comb;
	
	assign master_sink_ena = master_sink_ena_comb;
	assign master_sink_ena_comb = master_sink_ena_fft_top && master_sink_ena_fft_bot;
   assign master_source_ena_comb = master_source_ena_fft_top || master_source_ena_fft_bot;
   assign master_source_sop_comb = master_source_sop_fft_top || master_source_sop_fft_bot;
   assign master_source_eop_comb = master_source_eop_fft_top || master_source_eop_fft_bot;
   
     
   clk_pll clk_pll_inst(
	.inclk0(clk),
	.c0(clk_data),
	.c1(clk_fft));
	
	parse_fft_input parse_fft_input_inst(
	//inputs
	.clk_data_in(clk_data),
	.clk_fft(clk_fft),
	.reset(reset),
	.master_sink_dav(master_sink_dav),
	.master_sink_sop(master_sink_sop),
	.master_source_dav(master_source_dav),
	.inv_i(inv_i),
	.data_real_in(data_real_in),
	.data_imag_in(data_imag_in),
	.master_sink_ena(master_sink_ena_comb),
	//outputs
	.master_sink_dav_fft(master_sink_dav_fft),
	.master_sink_sop_fft(master_sink_sop_fft),
	.master_source_dav_fft(master_source_dav_fft),
	.inv_i_fft(inv_i_fft),
	.data_real_in_fft_top(data_real_in_fft_top),
	.data_imag_in_fft_top(data_imag_in_fft_top),
	.data_real_in_fft_bot(data_real_in_fft_bot),
	.data_imag_in_fft_bot(data_imag_in_fft_bot));
	defparam
		parse_fft_input_inst.data_width = data_width;
	
	fft_small fft_small_top(
	//inputs
	.clk(clk_fft),
	.reset(reset),
	.master_sink_dav(master_sink_dav_fft),
	.master_sink_sop(master_sink_sop_fft),
	.master_source_dav(master_source_dav_fft),
	.inv_i(inv_i_fft),
	.data_real_in(data_real_in_fft_top),
	.data_imag_in(data_imag_in_fft_top),
	//outputs
	.fft_real_out(fft_real_out_fft_top),
	.fft_imag_out(fft_imag_out_fft_top),
	.exponent_out(exp_out_fft_top),
	.master_sink_ena(master_sink_ena_fft_top),
	.master_source_sop(master_source_sop_fft_top),
	.master_source_eop(master_source_eop_fft_top),
	.master_source_ena(master_source_ena_fft_top));
	
	fft_small fft_small_bot(
	//inputs
	.clk(clk_fft),
    .reset(reset),
	.master_sink_dav(master_sink_dav_fft),
	.master_sink_sop(master_sink_sop_fft),
	.master_source_dav(master_source_dav_fft),
	.inv_i(inv_i_fft),
	.data_real_in(data_real_in_fft_bot),
	.data_imag_in(data_imag_in_fft_bot),
	//outputs
	.fft_real_out(fft_real_out_fft_bot),
	.fft_imag_out(fft_imag_out_fft_bot),
	.exponent_out(exp_out_fft_bot),
	.master_sink_ena(master_sink_ena_fft_bot),
	.master_source_sop(master_source_sop_fft_bot),
	.master_source_eop(master_source_eop_fft_bot),
	.master_source_ena(master_source_ena_fft_bot));
	
	combine_fft combine_fft_inst(
	//inputs
	.clk_fft(clk_fft),
	.clk_data_out(clk_data),
	.reset(reset),
	.master_source_ena(master_source_ena_comb),
	.master_source_sop(master_source_sop_comb),
	.fft_real_out_fft_top(fft_real_out_fft_top),
	.fft_imag_out_fft_top(fft_imag_out_fft_top),
	.exponent_out_fft_top(exp_out_fft_top),
	.fft_real_out_fft_bot(fft_real_out_fft_bot),
	.fft_imag_out_fft_bot(fft_imag_out_fft_bot),
	.exponent_out_fft_bot(exp_out_fft_bot),
	//outputs
	.fft_real_comb(fft_real_out),
	.fft_imag_comb(fft_imag_out),
	.exponent_comb(exponent_out),
	.master_source_sop_comb(master_source_sop),
	.master_source_eop_comb(master_source_eop),
	.master_source_ena_comb(master_source_ena));
	defparam
	   combine_fft_inst.data_width = data_width,
	   combine_fft_inst.twiddle_width = twiddle_width,
	   combine_fft_inst.transform_length = transform_length,
	   combine_fft_inst.coshex_init_file = coshex_init_file,
	   combine_fft_inst.sinhex_init_file = sinhex_init_file,
	   combine_fft_inst.log2_transform_length = log2_transform_length,
	   combine_fft_inst.mram_buf_add_width = mram_buf_add_width;

	
endmodule