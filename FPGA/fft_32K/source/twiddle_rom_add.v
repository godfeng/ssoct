module twiddle_rom_add(
   //inputs
	clk_fft,
	clk_data_out,
	reset,
	master_source_ena,
	master_source_sop,
	//outputs
	rom_add,
	rom_add_sin,
	count,
	tf_sp,
	quadrant_3_4,
	quadrant_2_3,
	cr,
	ci
	);
	
	// GLOBAL PARAMETER DECLARATION
    parameter data_width = 16;    //The number of bits in the input data for both real and imag parts
    parameter twiddle_width = 16;
    parameter transform_length = 32768;
	 parameter coshex_init_file = "fft_32K_coshex.hex";
	 parameter sinhex_init_file = "fft_32K_sinhex.hex";
	 parameter log2_transform_length = 15;
 
	input  clk_fft;
	input  clk_data_out;
	input  reset;
	input  master_source_ena;
	input  master_source_sop;
	
	output [log2_transform_length-3:0] rom_add;
	output [log2_transform_length-3:0] rom_add_sin;
	output [log2_transform_length-1:0] count;
   output tf_sp;
   output quadrant_3_4;
   output quadrant_2_3;
	output [twiddle_width-1:0] cr;
	output [twiddle_width-1:0] ci;
   
    reg tf_sp_d1;
    reg tf_sp_d2;
    reg cnt_dir_d1;
    reg cnt_dir_d2;
    reg [log2_transform_length-1:0] count_reg;
    
    reg cnt_en_d1;
    
    wire cnt_dir;
    wire reset_cnt;
    wire [1:0] quadrant_wire;
    wire cnt_en;
   
    assign cnt_en = (master_source_ena == 1'b1) || (count>0);
    assign quadrant_wire = count[log2_transform_length-1:log2_transform_length-2];
    assign cnt_dir = (quadrant_wire == 2'b00 || quadrant_wire == 2'b01) ? 1'b1 : 1'b0;
    assign reset_cnt = (rom_add == 0 && cnt_dir == 1'b0) ? 1'b1 : 1'b0;
    assign tf_sp = tf_sp_d2;
    assign quadrant_3_4 = count_reg[0];
    assign quadrant_2_3 = cnt_dir_d2;
   
    lpm_counter	counter_rom (
				.clk_en (cnt_en),
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

    	
	lpm_counter	counter_cos_rom (
				.clk_en (cnt_en),
				.aclr (reset),
				.clock (clk_fft),
				.updown (cnt_dir),
				.q (rom_add)
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
				.sset ()
				// synopsys translate_on
				);
	defparam
		counter_cos_rom.lpm_width = log2_transform_length - 2,
		counter_cos_rom.lpm_type = "LPM_COUNTER",
		counter_cos_rom.lpm_direction = "UNUSED";
		
		lpm_counter	counter_sin_rom (
				.clk_en (cnt_en_d1),
				.aclr (reset),
				.clock (clk_fft),
				.updown (cnt_dir),
				.q (rom_add_sin)
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
				.sset ()
				// synopsys translate_on
				);
	defparam
		counter_sin_rom.lpm_width = log2_transform_length - 2,
		counter_sin_rom.lpm_type = "LPM_COUNTER",
		counter_sin_rom.lpm_direction = "UNUSED";
		
		
	altsyncram	coshex (
				.clocken0 (1'b1),
				.clock0 (clk_data_out),
				.address_a (rom_add),
				.q_a (cr)
				// synopsys translate_off
				,
				.aclr0 (),
				.aclr1 (),
				.address_b (),
				.addressstall_a (),
				.addressstall_b (),
				.byteena_a (),
				.byteena_b (),
				.clock1 (),
				.clocken1 (),
				.data_a (),
				.data_b (),
				.q_b (),
				.rden_b (),
				.wren_a (),
				.wren_b ()
				// synopsys translate_on
				);
	defparam
		coshex.intended_device_family = "Stratix II",
		coshex.width_a = twiddle_width,
		coshex.widthad_a = log2_transform_length - 2,
		coshex.numwords_a = transform_length/4,
		coshex.operation_mode = "ROM",
		coshex.outdata_reg_a = "CLOCK0",
		coshex.outdata_aclr_a = "NONE",
		coshex.width_byteena_a = 1,
		coshex.clock_enable_input_a = "NORMAL",
		coshex.clock_enable_output_a = "NORMAL",
		`ifdef NO_PLI
			coshex.init_file = "fft_32K_coshex.rif"
		`else
			coshex.init_file = coshex_init_file
		`endif
		,
		coshex.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		coshex.lpm_type = "altsyncram";
	
	
	altsyncram	sinhex (
				.clocken0 (1'b1),
				.clock0 (clk_data_out),
				.address_a (rom_add_sin),
				.q_a (ci)
				// synopsys translate_off
				,
				.aclr0 (),
				.aclr1 (),
				.address_b (),
				.addressstall_a (),
				.addressstall_b (),
				.byteena_a (),
				.byteena_b (),
				.clock1 (),
				.clocken1 (),
				.data_a (),
				.data_b (),
				.q_b (),
				.rden_b (),
				.wren_a (),
				.wren_b ()
				// synopsys translate_on
				);
	defparam
		sinhex.intended_device_family = "Stratix II",
		sinhex.width_a = twiddle_width,
		sinhex.widthad_a = log2_transform_length - 2,
		sinhex.numwords_a = transform_length/4,
		sinhex.operation_mode = "ROM",
		sinhex.outdata_reg_a = "CLOCK0",
		sinhex.outdata_aclr_a = "NONE",
		sinhex.width_byteena_a = 1,
		sinhex.clock_enable_input_a = "NORMAL",
		sinhex.clock_enable_output_a = "NORMAL",
		`ifdef NO_PLI
			sinhex.init_file = "fft_32K_sinhex.rif"
		`else
			sinhex.init_file = sinhex_init_file
		`endif
		,
		sinhex.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		sinhex.lpm_type = "altsyncram";
	
	always @ (posedge clk_data_out)
     begin                                                                                        
       if(reset == 1'b1)
         begin
           tf_sp_d1 <= 1'b0;
           tf_sp_d2 <= 1'b0;
           cnt_dir_d1 <= 1'b0;
           cnt_dir_d2 <= 1'b0;
           count_reg <= 0;
	      end
       else                                                                                     
         begin
           tf_sp_d1 <= reset_cnt;
           tf_sp_d2 <= tf_sp_d1;
           cnt_dir_d1 <= cnt_dir;
           cnt_dir_d2 <= cnt_dir_d1;
           count_reg <= count;
         end
     end 

	always @ (posedge clk_fft)
	  begin
		if (reset == 1'b1)
		   cnt_en_d1 <= 0;
		else
		   cnt_en_d1 <= cnt_en;
		end
		
     

	  
   
   
   
 endmodule