module mul_fft_bot_tf(

 	//inputs
   clk_data_out,
   clk_fft,
	reset,
	fft_bot_real,
	fft_bot_imag,
	cr,
	ci,
	quadrant_3_4,
	quadrant_2_3,
	rom_add,
	count,
	tf_sp,
	//outputs
	rr,
	ri
	);
	
	// GLOBAL PARAMETER DECLARATION
    parameter data_width = 16;    //The number of bits in the input data for both real and imag parts
    parameter twiddle_width = 16; //The number of bits in the twiddle factor for both real and imag parts
    parameter transform_length = 32768;
    parameter log2_transform_length = 15;
 
	input clk_data_out;
	input clk_fft;
	input reset;
	input [data_width-1:0] fft_bot_real;
	input [data_width-1:0] fft_bot_imag;
	input [twiddle_width-1:0] cr;
	input [twiddle_width-1:0] ci;
	input quadrant_3_4;
	input quadrant_2_3;
	input [log2_transform_length-3:0] rom_add;
	input [log2_transform_length-1:0] count;
	input tf_sp;
	
	
	output [twiddle_width*data_width:0] rr;
	output [twiddle_width*data_width:0] ri;


   reg [data_width-1:0] real_bot_d1;
	reg [data_width-1:0] imag_bot_d1;
	reg [data_width-1:0] real_bot_d2;
	reg [data_width-1:0] imag_bot_d2;
	reg [twiddle_width-1:0] cr_mod_reg;
	reg [twiddle_width-1:0] ci_mod_reg;
	reg [twiddle_width-1:0] cr_rom_reg;
	reg [twiddle_width-1:0] ci_rom_reg;
	
	reg quadrant_2_3_d1;
	reg quadrant_3_4_d1;
   
	wire [twiddle_width-1:0] cr_mod;
	wire [twiddle_width-1:0] ci_mod;
	wire [twiddle_width-1:0] cr_rom;
	wire [twiddle_width-1:0] ci_rom;
	wire [twiddle_width-1:0] cr_mod_temp;
	
	
	wire [data_width-1:0] dr_delayed;
	wire [data_width-1:0] di_delayed;
	wire [twiddle_width-1:0] cr_delayed;
	wire [twiddle_width-1:0] ci_delayed;


	assign dr_delayed = real_bot_d2; 
	assign di_delayed = imag_bot_d2;
	assign cr_delayed = cr_rom_reg;
	assign ci_delayed = ci_rom_reg;
	
	
	
	mult_add mult_add_real(
	.clock0(clk_data_out),
	.dataa_0(dr_delayed),
	.dataa_1(di_delayed),
	.datab_0(cr_delayed),
	.addnsub1(1'b0),
	.datab_1(ci_delayed),
	.result(rr));
	defparam
	    mult_add_real.data_width = data_width,
	    mult_add_real.twiddle_width = twiddle_width;
	
	mult_add mult_add_imag(
	.clock0(clk_data_out),
	.dataa_0(dr_delayed),
	.dataa_1(di_delayed),
	.datab_0(ci_delayed),
	.addnsub1(1'b1),
	.datab_1(cr_delayed),
	.result(ri));
	defparam
	    mult_add_imag.data_width = data_width,
	    mult_add_imag.twiddle_width = twiddle_width;
	    
	always @ (posedge clk_fft)
	   begin
	      if (reset == 1'b1)
	         begin
      	        real_bot_d1 <= 0;
   	           imag_bot_d1 <= 0;
   	           real_bot_d2 <= 0;
   	           imag_bot_d2 <= 0;
   	         end
         else
            begin
               real_bot_d1 <= fft_bot_real;
               imag_bot_d1 <= fft_bot_imag;
               real_bot_d2 <= real_bot_d1;
   	           imag_bot_d2 <= imag_bot_d1;
   	        end
      end
      
   always @ (posedge clk_data_out)
	   begin
	      if (reset == 1'b1)
   	        cr_mod_reg <= 0;
         else if (tf_sp == 1'b1)
            cr_mod_reg <= 0;
   	     else
            cr_mod_reg <= cr;
         end

    always @ (posedge clk_data_out)
	   begin
	      if (reset == 1'b1)
	        ci_mod_reg <= 0;
   	      else if (count == 2 || count == 3)
            ci_mod_reg <= 0;
          else
            ci_mod_reg <= ci;
   	      end
      	
	
	always @ (posedge clk_data_out)
	   begin
	      if (reset == 1'b1)
	         ci_rom_reg <= 0;
         else if (quadrant_3_4_d1 == 1'b1)
             ci_rom_reg <= ci_mod_reg;
         else
             ci_rom_reg <= -ci_mod_reg;
       end
      
   always @ (posedge clk_data_out)
	   begin
	      if (reset == 1'b1)
   	        cr_rom_reg <= 0;
         else if (quadrant_2_3_d1 ^ quadrant_3_4_d1 )
            cr_rom_reg <= -cr_mod_reg;
         else
            cr_rom_reg <= cr_mod_reg;
        end
      
   always @ (posedge clk_data_out)
	   begin
	      if (reset == 1'b1)
	         begin
      	        quadrant_2_3_d1 <= 1'b0;
      	        quadrant_3_4_d1 <= 1'b0;
   	        end
         else 
            begin
               quadrant_2_3_d1 <= quadrant_2_3;
      	        quadrant_3_4_d1 <= quadrant_3_4;
            end
     end
      
      
endmodule