module scale_fft_res (

 	//inputs
   	clk_data_out,
	reset,
	exponent_out_fft_top,
	exponent_out_fft_bot,
	rr_scaled,
	ri_scaled,
	//outputs
	rr_scaled_shifted,
	ri_scaled_shifted
	);
	
	// GLOBAL PARAMETER DECLARATION
    parameter data_width = 16;    //The number of bits in the input data for both real and imag parts
	
	input clk_data_out;
	input reset;
	input [5:0] exponent_out_fft_top;
	input [5:0] exponent_out_fft_bot;
	input [data_width+1:0] rr_scaled;
	input [data_width+1:0] ri_scaled;
	
	output [data_width+1:0] rr_scaled_shifted;
	output [data_width+1:0] ri_scaled_shifted;
	
	wire [11:0] exponent_out_del;
	wire shift_dir;
	wire [5:0] shift_diff;
	wire [4:0] distance;
	
	reg [data_width+1:0] rr_scaled_reg;
	reg [data_width+1:0] ri_scaled_reg;
	
	
	assign shift_dir = (shift_diff > 0) ? 1'b1 : 1'b0; //shift right if exp_out_fft_top > exp_out_fft_bot
	assign distance = (shift_diff > 0) ? shift_diff[4:0] : -shift_diff;
	
	
	altshift_taps	delay_exp (
				.clken (1'b1),
				.clock (clk_data_out),
				.shiftin ({exponent_out_fft_top, exponent_out_fft_bot}),
				.taps (),
				.shiftout (exponent_out_del));
	defparam
		delay_exp.width = 12,
		delay_exp.number_of_taps = 1,
		delay_exp.tap_distance = 5,
		delay_exp.lpm_hint = "RAM_BLOCK_TYPE=M512",
		delay_exp.lpm_type = "altshift_taps";
	
		
   lpm_add_sub	exp_shift (
				.dataa (exponent_out_del[11:6]),
				.datab (exponent_out_del[5:0]),
				.clock (clk_data_out),
				.result (shift_diff)
				// synopsys translate_off
				,
				.aclr (),
				.add_sub (),
				.cin (),
				.clken (),
				.cout (),
				.overflow ()
				// synopsys translate_on
				);
	defparam
		exp_shift.lpm_width = 6,
		exp_shift.lpm_direction = "SUB",
		exp_shift.lpm_type = "LPM_ADD_SUB",
		exp_shift.lpm_hint = "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=NO",
		exp_shift.lpm_pipeline = 2;

	
	lpm_clshift	scale_fft_real (
				.distance (distance),
				.direction (shift_dir),
				.data (rr_scaled_reg),
				.result (rr_scaled_shifted)
				// synopsys translate_off
				,
				.overflow (),
				.underflow ()
				// synopsys translate_on
				);
	defparam
		scale_fft_real.lpm_type = "LPM_CLSHIFT",
		scale_fft_real.lpm_shifttype = "ARITHMETIC",
		scale_fft_real.lpm_width = data_width+2,
		scale_fft_real.lpm_widthdist = 5;
	
		
	lpm_clshift	scale_fft_imag (
				.distance (distance),
				.direction (shift_dir),
				.data (ri_scaled_reg),
				.result (ri_scaled_shifted)
				// synopsys translate_off
				,
				.overflow (),
				.underflow ()
				// synopsys translate_on
				);
	defparam
		scale_fft_imag.lpm_type = "LPM_CLSHIFT",
		scale_fft_imag.lpm_shifttype = "ARITHMETIC",
		scale_fft_imag.lpm_width = data_width+2,
		scale_fft_imag.lpm_widthdist = 5;
		
   always @ (posedge clk_data_out)
      begin
          if (reset == 1'b1)
             begin 
                rr_scaled_reg <= 0;
                ri_scaled_reg <= 0;
             end
          else
             begin 
                rr_scaled_reg <= rr_scaled;
                ri_scaled_reg <= ri_scaled;
             end
      end
	
endmodule