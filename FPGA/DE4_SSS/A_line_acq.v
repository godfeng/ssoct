module A_line_acq(
	clk_system,
	clk50MHz,
	ADC_data_out_clk,
	trigger50kHz,
	ADC_chanA,
	global_reset,
	sample_pos,
	read_RAM_address,
	DAC_output,
	o_sine,
	A_line_out,
	LED7,
	FANpin,
	acq_busy);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter	NSAMPLES		= 11'd1170;			// Number of samples per A-line

//=======================================================
//  PORT declarations
//=======================================================
input						clk_system;
input						clk50MHz;
input						global_reset;
input						ADC_data_out_clk;
input						trigger50kHz;
input		[13:0]			ADC_chanA;
output		[10:0]			sample_pos;
output		[10:0]			read_RAM_address;
output		[13:0]			DAC_output;
output		[13:0]			o_sine;
// A-line of 1170 Elements, each 14 bits wide
output  	[13:0] 			A_line_out; 
output						LED7;
output						FANpin;
output						acq_busy;
//output						acq_done;

//=======================================================
//  REG/WIRE declarations
//=======================================================
wire						global_reset_n;
wire						sys_clk;
// ADC registers
reg			[13:0]			per_a2da_d;
//reg			[13:0]			a2da_data;
// A-line of 1170 Elements, each 14 bits wide
reg  		[13:0]			A_line; 
wire						sweepTrigger;
// Position of the ADC sample in the A-line
wire		[10:0]			sample_position;
// Position of the A-line sample in the RAM
wire		[10:0]			RAM_addr;
reg			[13:0]			DAC_output;
reg			[13:0]			o_sine;
wire		[13:0]			raw_sine;
wire		[7:0]			clk_div_out_sig;

//=======================================================
//  Structural coding
//=======================================================	
assign		global_reset_n	= global_reset;
assign		sys_clk			= clk_system;
assign		A_line_out		= A_line;
assign		sample_pos		= sample_position;
assign		read_RAM_address= RAM_addr;
assign		sweepTrigger	= trigger50kHz;


//--- Channel A
always @(negedge global_reset_n or posedge ADC_data_out_clk)
begin
	if (!global_reset_n) begin
		per_a2da_d	<= 14'd0;
	end
	else begin
		per_a2da_d	<= ADC_chanA;
	end
end


always @(negedge global_reset_n or posedge sys_clk)
begin
	if (!global_reset_n) begin
		//a2da_data	<= 14'd0;
		A_line		<= 14'd0;
		o_sine		<= 14'd0;
	end
	else begin
		A_line		<= per_a2da_d;
		// Indexing samples in the A-line array
		//A_line[sample_position] <= a2da_data;
		//A_line <= a2da_data;
		// Map acquisition to DAC B
		//DAC_output 	<= A_line[sample_position];
		DAC_output 	<= A_line;
		// Invert sign bit (MSB) to have offset binary
		o_sine		<= {~raw_sine[13],raw_sine[12:0]};

//		if (sample_position != 0) begin
//			acq_busy	<= 1'b1;
//		end
//		else begin
//			acq_busy	<= 1'b0;
//			end
//		if (sample_position == 11'b0 && sweepTrigger) begin
//			acq_done	<= 1'b1;
//		end
//		else begin
//			acq_done	<= 1'b0;
//			end
	end
end

// Synchronization of sampling with sweep trigger
sample_addressing_custom sample_addressing_custom_inst
(
	.clock(ADC_data_out_clk) ,	// input  clock_sig
	.sclr(~sweepTrigger) ,		// input  sclr_sig
	.q(sample_position) 		// output [10:0] q_sig
);

// Acquisition started acq_busy;
assign acq_busy	= (sample_pos != 0) ? 1'b1 : 1'b0;

// Acquisition done acq_done;
//assign acq_done		= (~acq_busy && sweepTrigger) ? 1'b1 : 1'b0;

sample_addressing_custom sample_addressing_custom_inst2
(
	.clock(ADC_data_out_clk) ,	// input  clock_sig
	.sclr(acq_busy) ,		// input  sclr_sig
	.q(RAM_addr) 		// output [10:0] q_sig
);


///////////////////////////////////////////////////////////////////////////////
// Optional modules
///////////////////////////////////////////////////////////////////////////////

// 400 kHz sinus at DAC channel A
sin400k_st sin400k_st_inst
(
	.clk(sys_clk) ,				// input  clk_sig 312.5 MHz clock
	.reset_n(global_reset_n) ,	// input  reset_n_sig
	.clken(1'b1) ,				// input  clken_sig
	.phi_inc_i(32'd5497558) ,	// input [anglePrec-1:0] phi_inc_i_sig 32'd5497558 for 400 kHz sinus
	.fsin_o(raw_sine) ,			// output [magnitudePrec-1:0] fsin_o_sig
	.out_valid() 				// output  out_valid_sig
);

// Fan Control
FAN_PWM FAN_PWM_inst
(
	.clk(clk50MHz) ,			// input  clk_sig
	.PWM_input(4'hC) ,			// input [3:0] PWM_input_sig
	.clk_div_out(clk_div_out_sig) ,	// output [7:0] clk_div_out_sig
	.FAN(FANpin) 				// output  FAN_sig
);

// Heartbeat with glowing LED
LED_glow LED_glow_inst
(
	.clk(clk_div_out_sig[2]) ,	// input  clk_sig
	.LED(LED7) 					// output  LED_sig
);
endmodule