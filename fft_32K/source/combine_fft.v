 module combine_fft(
    //inputs
    clk_fft,
	clk_data_out,
	reset,
	master_source_ena,
	master_source_sop,
	fft_real_out_fft_top,
	fft_imag_out_fft_top,
	exponent_out_fft_top,
	fft_real_out_fft_bot,
	fft_imag_out_fft_bot,
	exponent_out_fft_bot,
	//outputs
	fft_real_comb,
	fft_imag_comb,
	exponent_comb,
	master_source_sop_comb,
  	master_source_eop_comb,
	master_source_ena_comb
	);
	
	// GLOBAL PARAMETER DECLARATION
   parameter data_width = 16;    //The number of bits in the input data for both real and imag parts
   parameter twiddle_width = 16; //The number of bits in the twiddle factor for both real and imag parts
   parameter transform_length = 32768;
	parameter coshex_init_file = "fft_32K_coshex.hex";
	parameter sinhex_init_file = "fft_32K_sinhex.hex";
	parameter log2_transform_length = 15;
   parameter	mram_buf_add_width = 15;
 
 
	
	input clk_fft;
	input clk_data_out;
	input reset;
	input master_source_ena;
	input master_source_sop;
	input [data_width-1:0]  fft_real_out_fft_top;
	input [data_width-1:0]	fft_imag_out_fft_top;
	input [5:0] 	exponent_out_fft_top;
	input [data_width-1:0]	fft_real_out_fft_bot;
	input [data_width-1:0]	fft_imag_out_fft_bot;
	input [5:0] 	exponent_out_fft_bot;
	
	output [data_width-1:0] fft_real_comb;
	output [data_width-1:0] fft_imag_comb;
	output [5:0]  exponent_comb;
	
	output master_source_sop_comb;
	output master_source_eop_comb;
	output master_source_ena_comb;
	
	
	wire quadrant_3_4;
	wire quadrant_2_3;
	wire [twiddle_width-1:0] cr;
	wire [twiddle_width-1:0] ci;
	wire [twiddle_width*data_width:0] rr;
	wire [twiddle_width*data_width:0] ri;
	wire [data_width+1:0] rr_scaled;
	wire [data_width+1:0] ri_scaled;
	wire [data_width+1:0] rr_scaled_shifted;
	wire [data_width+1:0] ri_scaled_shifted;
	wire [data_width-1:0] fft_real_out_fft;
	wire [data_width-1:0] fft_imag_out_fft;
	wire [log2_transform_length-3:0] rom_add;
	wire [log2_transform_length-3:0] rom_add_sin;
	wire [log2_transform_length-1:0] count;
	wire tf_sp;

	wire mram_rden;
	wire [log2_transform_length-1:0] mram_readadd;	
	wire master_source_sop_comb_w;
	wire master_source_eop_comb_w;
	wire master_source_ena_comb_w;
	
	
	reg master_source_sop_comb_d1;
	reg master_source_eop_comb_d1;
	reg master_source_ena_comb_d1;
	reg master_source_sop_comb_d2;
	reg master_source_eop_comb_d2;
	reg master_source_ena_comb_d2;
	reg [5:0] exponent_out_fft_top_del;
	
	
		
    assign rr_scaled = rr[data_width+twiddle_width:twiddle_width - 1];  // divided by 2^(twiddle_width-1) - scale based on twiddle factor scaling factor
	 assign ri_scaled = ri[data_width+twiddle_width:twiddle_width - 1];  // divided by 2^(twiddle_width-1) - scale based on twiddle factor scaling factor
	
	 assign exponent_comb = exponent_out_fft_top_del;
    assign fft_real_comb = fft_real_out_fft;
    assign fft_imag_comb = fft_imag_out_fft;
   
    assign master_source_sop_comb_w = (mram_readadd == 0 && mram_rden == 1'b1) ? 1'b1 : 1'b0;
    assign master_source_eop_comb_w = (mram_readadd == {(log2_transform_length){1'b1}} && mram_rden == 1'b1) ? 1'b1 : 1'b0;
    assign master_source_ena_comb_w = mram_rden;
   
    assign master_source_sop_comb = master_source_sop_comb_d2;
    assign master_source_eop_comb = master_source_eop_comb_d2;
    assign master_source_ena_comb = master_source_ena_comb_d2;

	
	twiddle_rom_add twiddle_add(
    //inputs
    .clk_fft(clk_fft),
	.clk_data_out(clk_data_out),
	.reset(reset),
	.master_source_ena(master_source_ena),
	.master_source_sop(master_source_sop),
	//outputs
    .rom_add(rom_add),
	.rom_add_sin(rom_add_sin),
	.count(count),
	.tf_sp(tf_sp),
	.quadrant_3_4(quadrant_3_4),
	.quadrant_2_3(quadrant_2_3),
	.cr(cr),
	.ci(ci));
	defparam
		twiddle_add.data_width = data_width,
		twiddle_add.twiddle_width = twiddle_width,
		twiddle_add.transform_length = transform_length,
	   twiddle_add.coshex_init_file = coshex_init_file,
	   twiddle_add.sinhex_init_file = sinhex_init_file,
	   twiddle_add.log2_transform_length = log2_transform_length;
 
	   
		   
	mul_fft_bot_tf multiply_twiddle_factor(
 	//inputs
   .clk_data_out(clk_data_out),
   .clk_fft(clk_fft),
	.reset(reset),
	.fft_bot_real(fft_real_out_fft_bot),
	.fft_bot_imag(fft_imag_out_fft_bot),
	.cr(cr),
	.ci(ci),
	.quadrant_3_4(quadrant_3_4),
	.quadrant_2_3(quadrant_2_3),
	.rom_add(rom_add),
	.count(count),
	.tf_sp(tf_sp),
	//outputs
	.rr(rr),
	.ri(ri)
	);
	defparam
	    multiply_twiddle_factor.data_width = data_width,
	   	multiply_twiddle_factor.twiddle_width = twiddle_width,
	    multiply_twiddle_factor.transform_length = transform_length,
	    multiply_twiddle_factor.log2_transform_length = log2_transform_length;
 
		
	
	scale_fft_res scale_fft_real_imag(
 	//inputs
   .clk_data_out(clk_data_out),
	.reset(reset),
	.exponent_out_fft_top(exponent_out_fft_top),
	.exponent_out_fft_bot(exponent_out_fft_bot),
	.rr_scaled(rr_scaled),
	.ri_scaled(ri_scaled),
	//outputs
	.rr_scaled_shifted(rr_scaled_shifted),
	.ri_scaled_shifted(ri_scaled_shifted)
	);
	defparam
		scale_fft_real_imag.data_width = data_width;
		
		
    comb_final_fft_res combine_fft_top_bot(
	//inputs
    .clk_fft(clk_fft),
	.clk_data_out(clk_data_out),
	.reset(reset),
	.rr_scaled_shifted(rr_scaled_shifted),
	.ri_scaled_shifted(ri_scaled_shifted),
	.fft_real_out_fft_top(fft_real_out_fft_top),
	.fft_imag_out_fft_top(fft_imag_out_fft_top),
	.master_source_ena(master_source_ena),
	.master_source_sop(master_source_sop),
	.mram_readadd(mram_readadd),
	.mram_rden(mram_rden),
	//outputs
	.fft_real_out_fft(fft_real_out_fft),
	.fft_imag_out_fft(fft_imag_out_fft)
	);
	defparam
		combine_fft_top_bot.data_width = data_width,
		combine_fft_top_bot.transform_length = transform_length,
	   combine_fft_top_bot.log2_transform_length = log2_transform_length,
	   combine_fft_top_bot.mram_buf_add_width = mram_buf_add_width;
 

	
	always @ (posedge clk_data_out)
	   begin
	      if (reset == 1'b1)
	         exponent_out_fft_top_del <= 6'd0;
	      else if ( master_source_sop_comb_d1 == 1'b1)
	         exponent_out_fft_top_del <= exponent_out_fft_top;
	      else if ( master_source_eop_comb == 1'b1)
	         exponent_out_fft_top_del <= 6'd0;
	      else
	         exponent_out_fft_top_del <= exponent_out_fft_top_del;
	    end
	         
	
	always @ (posedge clk_data_out)
	   begin
	      if (reset == 1'b1)
	         begin
	             master_source_sop_comb_d1 <= 1'b0;
	             master_source_sop_comb_d2 <= 1'b0;
	             master_source_eop_comb_d1 <= 1'b0;
	             master_source_eop_comb_d2 <= 1'b0;
	             master_source_ena_comb_d1 <= 1'b0;
	             master_source_ena_comb_d2 <= 1'b0;
	         end
	      else
	         begin
	             master_source_sop_comb_d1 <= master_source_sop_comb_w;
	             master_source_sop_comb_d2 <= master_source_sop_comb_d1;
	             master_source_eop_comb_d1 <= master_source_eop_comb_w;
	             master_source_eop_comb_d2 <= master_source_eop_comb_d1;
	             master_source_ena_comb_d1 <= master_source_ena_comb_w;
	             master_source_ena_comb_d2 <= master_source_ena_comb_d1;
	         end
	    end
	

endmodule