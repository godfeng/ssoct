module comb_final_fft_res (
	//inputs
    clk_fft,
	clk_data_out,
	reset,
	rr_scaled_shifted,
	ri_scaled_shifted,
	fft_real_out_fft_top,
	fft_imag_out_fft_top,
	master_source_ena,
	master_source_sop,
	//outputs
	fft_real_out_fft,
	fft_imag_out_fft,
	mram_readadd,
	mram_rden
	);
	
	// GLOBAL PARAMETER DECLARATION
    parameter data_width = 16;    //The number of bits in the input data for both real and imag parts
    parameter transform_length = 32768;
    parameter log2_transform_length = 15;
    parameter mram_buf_add_width = 15;
	
	
	input clk_fft;
	input clk_data_out;
	input reset;
	input [data_width+1:0] rr_scaled_shifted;
	input [data_width+1:0] ri_scaled_shifted;
	input [data_width-1:0] fft_real_out_fft_top;
	input [data_width-1:0] fft_imag_out_fft_top;
	input master_source_ena;
	input master_source_sop;
		
	
	output [data_width-1:0] fft_real_out_fft;
	output [data_width-1:0] fft_imag_out_fft;
	output [log2_transform_length-1:0] mram_readadd;
	output mram_rden;
	
		
	reg [data_width+1:0] real_top_d1;
	reg [data_width+1:0] imag_top_d1;
	reg [data_width+1:0] real_top_d2;
	reg [data_width+1:0] imag_top_d2;
	reg [data_width+1:0] real_top_d3;
	reg [data_width+1:0] imag_top_d3;
	reg [data_width+1:0] real_top_d4;
	reg [data_width+1:0] imag_top_d4;
	reg [data_width+1:0] real_top_d5;
	reg [data_width+1:0] imag_top_d5;
	
	reg [data_width+1:0] rr_scaled_shifted_d1;
	reg [data_width+1:0] ri_scaled_shifted_d1;
	reg [data_width+1:0] rr_scaled_shifted_d2;
	reg [data_width+1:0] ri_scaled_shifted_d2;
	
	reg mram_rden_d1;
	reg master_source_sop_reg;
	reg master_source_ena_reg;
	reg master_source_ena_reg1;
	reg master_source_ena_reg2;
	reg master_source_ena_reg3;
   reg	master_source_ena_reg4;
   reg master_source_ena_reg5;
		
	
	wire toggle_mram_wradd;
	wire [log2_transform_length-1:0] count;
	
	wire [data_width+1:0] fft_real_comb_wire;
	wire [data_width+1:0] fft_imag_comb_wire;
	
	wire mram_wren;
	wire mram_rden;
	wire [log2_transform_length-2:0] mram_writeadd_w;
	wire [log2_transform_length-1:0] mram_writeadd;
	wire [log2_transform_length-1:0] mram_readadd;
	
	wire sign_real;
	wire sign_imag;
	wire [data_width+1:0] comb_real_top;
	wire [data_width+1:0] comb_imag_top;
	wire [data_width-1:0] fft_real_out_fft_w;
	wire [data_width-1:0] fft_imag_out_fft_w;
	
	assign fft_real_out_fft = (mram_rden_d1 == 1'b1) ? fft_real_out_fft_w : 0;
	assign fft_imag_out_fft = (mram_rden_d1 == 1'b1) ? fft_imag_out_fft_w : 0;

   assign toggle_mram_wradd = count[0];
	assign mram_wren = master_source_ena_reg5;
   assign mram_rden = ( mram_writeadd_w > {(log2_transform_length-2){1'b1}} ) || (mram_readadd > 0);
   assign mram_writeadd = {toggle_mram_wradd, mram_writeadd_w[log2_transform_length-2:0]};

	assign sign_real = fft_real_out_fft_top[data_width-1];
	assign sign_imag = fft_imag_out_fft_top[data_width-1];
	assign comb_real_top = real_top_d5;
	assign comb_imag_top = imag_top_d5;
	
	lpm_add_sub	comb_fft_add_real (
				.dataa (comb_real_top),
				.datab (rr_scaled_shifted_d2),
				.clken (1'b1),
				.clock (clk_data_out),
				.result (fft_real_comb_wire)
				// synopsys translate_off
				,
				.aclr (),
				.add_sub (),
				.cin (),
				.cout (),
				.overflow ()
				// synopsys translate_on
				);
	defparam
		comb_fft_add_real.lpm_width = data_width + 2,
		comb_fft_add_real.lpm_direction = "ADD",
		comb_fft_add_real.lpm_type = "LPM_ADD_SUB",
		comb_fft_add_real.lpm_hint = "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=NO",
		comb_fft_add_real.lpm_pipeline = 2;

	
	lpm_add_sub	comb_fft_add_imag (
				.dataa (comb_imag_top),
				.datab (ri_scaled_shifted_d2),
				.clken (1'b1),
				.clock (clk_data_out),
				.result (fft_imag_comb_wire)
				// synopsys translate_off
				,
				.aclr (),
				.add_sub (),
				.cin (),
				.cout (),
				.overflow ()
				// synopsys translate_on
				);
	defparam
		comb_fft_add_imag.lpm_width = data_width + 2,
		comb_fft_add_imag.lpm_direction = "ADD",
		comb_fft_add_imag.lpm_type = "LPM_ADD_SUB",
		comb_fft_add_imag.lpm_hint = "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=NO",
		comb_fft_add_imag.lpm_pipeline = 2;
	
   
	lpm_counter	count_mram_wradd (
				.clk_en (mram_wren),
				.aclr (reset || (master_source_sop_reg && ~mram_wren)),
				.clock (clk_fft),
				.q (mram_writeadd_w)
				// synopsys translate_off
				,
				.aload (),
				.aset (),
				.cin (),
				.cnt_en (),
				.cout (),
				.data (),
				.eq (),
				.sclr (),
				.sload (),
				.sset (),
				.updown ()
				// synopsys translate_on
				);
	defparam
		count_mram_wradd.lpm_width = log2_transform_length - 1,
		count_mram_wradd.lpm_type = "LPM_COUNTER",
		count_mram_wradd.lpm_direction = "UP";


	lpm_counter	count_mram_rdadd (
				.clk_en (mram_rden),
				.aclr (reset),
				.clock (clk_data_out),
				.q (mram_readadd)
				// synopsys translate_off
				,
				.aload (),
				.aset (),
				.cin (),
				.cnt_en (),
				.cout (),
				.data (),
				.eq (),
				.sclr (),
				.sload (),
				.sset (),
				.updown ()
				// synopsys translate_on
				);
	defparam
		count_mram_rdadd.lpm_width = log2_transform_length,
		count_mram_rdadd.lpm_type = "LPM_COUNTER",
		count_mram_rdadd.lpm_direction = "UP";
		
   lpm_counter	counter_rom (
				.clk_en (mram_wren),
				.aclr (reset),
				.clock (clk_data_out),
				.q (count)
				// synopsys translate_off
				,
				.aload (),
				.aset (),
				.cin (),
				.cnt_en (),
				.cout (),
				.data (),
				.eq (),
				.sclr (),
				.sload (),
				.sset (),
				.updown ()
				// synopsys translate_on
				);
	defparam
		counter_rom.lpm_width = log2_transform_length,
		counter_rom.lpm_type = "LPM_COUNTER",
		counter_rom.lpm_direction = "UP";

	mram_buf fft_res_buf_real(
	.data(fft_real_comb_wire[data_width-1:0]),
	.wren(mram_wren),
	.wraddress({ {(mram_buf_add_width-log2_transform_length){1'b0}},mram_writeadd}),
	.rdaddress({ {(mram_buf_add_width-log2_transform_length){1'b0}},mram_readadd}),
	.wrclock(clk_data_out),
	.rdclock(clk_data_out),
	.q(fft_real_out_fft_w));
	defparam
	   fft_res_buf_real.data_width = data_width,
	   fft_res_buf_real.mram_buf_add_width = mram_buf_add_width;
	 	
	mram_buf fft_res_buf_imag(
	.data(fft_imag_comb_wire[data_width-1:0]),
	.wren(mram_wren),
	.wraddress({ {(mram_buf_add_width-log2_transform_length){1'b0}},mram_writeadd}),
	.rdaddress({ {(mram_buf_add_width-log2_transform_length){1'b0}},mram_readadd}),
	.wrclock(clk_data_out),
	.rdclock(clk_data_out),
	.q(fft_imag_out_fft_w));
	defparam
	   fft_res_buf_imag.data_width = data_width,
	   fft_res_buf_imag.mram_buf_add_width = mram_buf_add_width;
	 	
	
	
	always @ (posedge clk_fft)
	   begin
	      if (reset == 1'b1)
	         begin
      	         real_top_d1 <= 0;
   	            imag_top_d1 <= 0;
   	            real_top_d2 <= 0;
   	            imag_top_d2 <= 0;
	             real_top_d3 <= 0;
   	            imag_top_d3 <= 0;
   	            real_top_d4 <= 0;
   	            imag_top_d4 <= 0;
  	             real_top_d5 <= 0;
   	            imag_top_d5 <= 0;
   	            master_source_sop_reg <= 1'b0;
   	            master_source_ena_reg <= 1'b0;
   	            master_source_ena_reg1 <= 1'b0;
   	            master_source_ena_reg2 <= 1'b0;
   	            master_source_ena_reg3 <= 1'b0;
   	            master_source_ena_reg4 <= 1'b0;
                master_source_ena_reg5 <= 1'b0;
                mram_rden_d1 <= 1'b0;
   	         end
         else
            begin
                real_top_d1 <= {sign_real, sign_real, fft_real_out_fft_top};
                imag_top_d1 <= {sign_imag, sign_imag, fft_imag_out_fft_top};
                real_top_d2 <= real_top_d1;
                imag_top_d2 <= imag_top_d1;
                real_top_d3 <= real_top_d2;
                imag_top_d3 <= imag_top_d2;
                real_top_d4 <= real_top_d3;
                imag_top_d4 <= imag_top_d3;
                real_top_d5 <= real_top_d4;
                imag_top_d5 <= imag_top_d4;
                master_source_sop_reg <= master_source_sop;
                master_source_ena_reg <= master_source_ena;
                master_source_ena_reg1 <= master_source_ena_reg; 
                master_source_ena_reg2 <= master_source_ena_reg1;
                master_source_ena_reg3 <= master_source_ena_reg2;
                master_source_ena_reg4 <= master_source_ena_reg3;
                master_source_ena_reg5 <= master_source_ena_reg4;
                mram_rden_d1 <= mram_rden;
  	         end
      end

      always @ (posedge clk_data_out)
	   begin
	      if (reset == 1'b1)
	         begin
	             rr_scaled_shifted_d1 <= 0;
	             ri_scaled_shifted_d1 <= 0;
                rr_scaled_shifted_d2 <= 0;
	             ri_scaled_shifted_d2 <= 0;
	        	end
	      else
	         begin
	             rr_scaled_shifted_d1 <= rr_scaled_shifted;
	             ri_scaled_shifted_d1 <= ri_scaled_shifted;
                rr_scaled_shifted_d2 <= rr_scaled_shifted_d1;
	             ri_scaled_shifted_d2 <= ri_scaled_shifted_d1;
            end
	    end
	
endmodule