// ============================================================================
// Copyright (c) 2010 by Terasic Technologies Inc. 
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// ============================================================================
// Major Functions/Design Description:
//
//   Please refer to DE4_UserManual.pdf in DE4 system CD.
//
// ============================================================================
// Revision History:
// ============================================================================
//   Ver.: |Author:   |Mod. Date:    |Changes Made:
//   V1.0  |Richard   |10/06/30      |
// ============================================================================


//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================
//`define USE_DDR2_DIMM2

module DE4_DDR2(

	//////// CLOCK //////////
	GCLKIN,
	GCLKOUT_FPGA,
	MAX_CONF_D,
	MAX_PLL_D,
	OSC_50_Bank2,
	OSC_50_Bank3,
	OSC_50_Bank4,
	OSC_50_Bank5,
	OSC_50_Bank6,
	OSC_50_Bank7,
	PLL_CLKIN_p,

	//////// LED x 8 //////////
	LED,

	//////// BUTTON x 4 //////////
	BUTTON,
	CPU_RESET_n,
	EXT_IO,

`ifndef USE_DDR2_DIMM2
	//////// DDR2 SODIMM //////////
	M1_DDR2_addr,
	M1_DDR2_ba,
	M1_DDR2_cas_n,
	M1_DDR2_cke,
	M1_DDR2_clk,
	M1_DDR2_clk_n,
	M1_DDR2_cs_n,
	M1_DDR2_dm,
	M1_DDR2_dq,
	M1_DDR2_dqs,
	M1_DDR2_dqsn,
	M1_DDR2_odt,
	M1_DDR2_ras_n,
	M1_DDR2_SA,
	M1_DDR2_SCL,
	M1_DDR2_SDA,
	M1_DDR2_we_n

`else
	//////// DDR2 SODIMM //////////

	M2_DDR2_addr,
	M2_DDR2_ba,
	M2_DDR2_cas_n,
	M2_DDR2_cke,
	M2_DDR2_clk,
	M2_DDR2_clk_n,
	M2_DDR2_cs_n,
	M2_DDR2_dm,
	M2_DDR2_dq,
	M2_DDR2_dqs,
	M2_DDR2_dqsn,
	M2_DDR2_odt,
	M2_DDR2_ras_n,
	M2_DDR2_SA,
	M2_DDR2_SCL,
	M2_DDR2_SDA,
	M2_DDR2_we_n 
`endif	//USE_DDR2_DIMM2
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input		          		GCLKIN;
output		          		GCLKOUT_FPGA;
inout		     [2:0]		MAX_CONF_D;
output		     [2:0]		MAX_PLL_D;
input		          		OSC_50_Bank2;
input		          		OSC_50_Bank3;
input		          		OSC_50_Bank4;
input		          		OSC_50_Bank5;
input		          		OSC_50_Bank6;
input		          		OSC_50_Bank7;
input		          		PLL_CLKIN_p;

//////////// LED x 8 //////////
output		     [7:0]		LED;

//////////// BUTTON x 4 //////////
input		     [3:0]		BUTTON;
input		          		CPU_RESET_n;
inout		          		EXT_IO;

`ifndef USE_DDR2_DIMM2
//////////// DDR2 SODIMM //////////
output		    [15:0]		M1_DDR2_addr;
output		     [2:0]		M1_DDR2_ba;
output		          		M1_DDR2_cas_n;
output		     [1:0]		M1_DDR2_cke;
inout		     [1:0]		M1_DDR2_clk;
inout		     [1:0]		M1_DDR2_clk_n;
output		     [1:0]		M1_DDR2_cs_n;
output		     [7:0]		M1_DDR2_dm;
inout		    [63:0]		M1_DDR2_dq;
inout		     [7:0]		M1_DDR2_dqs;
inout		     [7:0]		M1_DDR2_dqsn;
output		     [1:0]		M1_DDR2_odt;
output		          		M1_DDR2_ras_n;
output		     [1:0]		M1_DDR2_SA;
output		          		M1_DDR2_SCL;
inout		          		M1_DDR2_SDA;
output		          		M1_DDR2_we_n;

`else
//////////// DDR2 SODIMM //////////
output		    [15:0]		M2_DDR2_addr;
output		     [2:0]		M2_DDR2_ba;
output		          		M2_DDR2_cas_n;
output		     [1:0]		M2_DDR2_cke;
inout		     [1:0]		M2_DDR2_clk;
inout		     [1:0]		M2_DDR2_clk_n;
output		     [1:0]		M2_DDR2_cs_n;
output		     [7:0]		M2_DDR2_dm;
inout		    [63:0]		M2_DDR2_dq;
inout		     [7:0]		M2_DDR2_dqs;
inout		     [7:0]		M2_DDR2_dqsn;
output		     [1:0]		M2_DDR2_odt;
output		          		M2_DDR2_ras_n;
output		     [1:0]		M2_DDR2_SA;
output		          		M2_DDR2_SCL;
inout		          		M2_DDR2_SDA;
output		          		M2_DDR2_we_n;

`endif //`ifndef USE_DDR2_DIMM2

//=======================================================
//  REG/WIRE declarations
//=======================================================

wire			[7:0]		clk_div_out_sig;

//// Master template
wire						control_done_read;
reg				[31:0]		user_buffer_data_read;
wire						user_data_available;
reg				[29:0]		address_last_complete_read;
wire						control_go_read;
reg				[29:0]		control_read_base;
reg				[29:0]		control_read_length;
wire						user_read_buffer;
wire						reading_done;
reg				[31:0]		debug_read;
reg				[2:0]		error_data;
	
wire						control_done_write;
reg				[31:0]		user_buffer_data_write;
wire						user_buffer_full;
reg				[29:0]		address_last_complete_write;
wire						control_go_write;
reg				[29:0]		control_write_base;
reg				[29:0]		control_write_length;
wire						user_write_buffer;
wire						writing_done;
reg				[31:0]		debug_write;
wire						error_full;

//=======================================================
//  Structural coding
//=======================================================

wire 						reset_n;
assign 	reset_n 			= CPU_RESET_n;

// Additional logic
assign	LED[0]				= writing_done & control_done_write;
assign	LED[1]				= reading_done & control_done_read;
//assign	LED[2]				= user_data_available | user_buffer_full;
//assign	LED[3]				= error_full;
assign	LED[2]				= 0;
assign	LED[3]				= 1;
assign	LED[6:4]			= error_data;

DE4_SOPC DE4_SOPC_inst(
	// global signals:
	.reset_n(reset_n) ,										// input
	.clk_50(OSC_50_Bank3), 									// input
	
	// the ddr2
	.ddr2_aux_full_rate_clk_out() ,							// output
	.ddr2_aux_half_rate_clk_out() ,							// output
	.ddr2_phy_clk_out() ,									// output
	
	.aux_scan_clk_from_the_ddr2() ,							// output
	.aux_scan_clk_reset_n_from_the_ddr2() ,					// output
	.dll_reference_clk_from_the_ddr2() ,					// output
	.dqs_delay_ctrl_export_from_the_ddr2() ,				// output [5:0]
	
	.global_reset_n_to_the_ddr2(rstn) ,						// input
	
	.local_init_done_from_the_ddr2() ,						// output
	.local_refresh_ack_from_the_ddr2() ,					// output
	.local_wdata_req_from_the_ddr2() ,						// output
	
	.mem_addr_from_the_ddr2(M1_DDR2_addr) ,					// output [13:0]
	.mem_ba_from_the_ddr2(M1_DDR2_ba) ,						// output [2:0]
	.mem_cas_n_from_the_ddr2(M1_DDR2_cas_n) ,				// output
	.mem_cke_from_the_ddr2(M1_DDR2_cke) ,					// output
	.mem_clk_n_to_and_from_the_ddr2(M1_DDR2_clk_n) ,		// inout [1:0]
	.mem_clk_to_and_from_the_ddr2(M1_DDR2_clk) ,			// inout [1:0]
	.mem_cs_n_from_the_ddr2(M1_DDR2_cs_n) ,					// output
	.mem_dm_from_the_ddr2(M1_DDR2_dm) ,						// output [7:0]
	.mem_dq_to_and_from_the_ddr2(M1_DDR2_dq) ,				// inout [63:0]
	.mem_dqs_to_and_from_the_ddr2(M1_DDR2_dqs) ,			// inout [7:0]
	.mem_dqsn_to_and_from_the_ddr2(M1_DDR2_dqsn) ,			// inout [7:0]
	.mem_odt_from_the_ddr2(M1_DDR2_odt) ,					// output
	.mem_ras_n_from_the_ddr2(M1_DDR2_ras_n) ,				// output
	.mem_we_n_from_the_ddr2(M1_DDR2_we_n) ,					// output
	
	.oct_ctl_rs_value_to_the_ddr2() ,						// input [13:0]
	.oct_ctl_rt_value_to_the_ddr2() ,						// input [13:0]
	.reset_phy_clk_n_from_the_ddr2() ,						// output

	// ddr2 psd i2c WHERE DO I CONNECT THEM???????
//	.out_port_from_the_ddr2_i2c_scl(M1_DDR2_SCL),
//	.out_port_from_the_ddr2_i2c_sa(M1_DDR2_SA),
//	.bidir_port_to_and_from_the_ddr2_i2c_sda(M1_DDR2_SDA),
	
	// the Master Read
	.control_done_from_the_master_read(control_done_read) ,				// output
	.control_early_done_from_the_master_read() ,						// output (NC)
	.control_fixed_location_to_the_master_read(1'b0) ,					// input
	.control_go_to_the_master_read(control_go_read) ,					// input
	.control_read_base_to_the_master_read(control_read_base) ,			// input [29:0]
	.control_read_length_to_the_master_read(control_read_length) ,		// input [29:0]
	.user_buffer_output_data_from_the_master_read(user_buffer_data_read),// output [31:0]
	.user_data_available_from_the_master_read(user_data_available) ,	// output
	.user_read_buffer_to_the_master_read(user_read_buffer) ,			// input
	
	// the Master Write
	.control_done_from_the_master_write(control_done_write) ,			// output
	.control_fixed_location_to_the_master_write(1'b0) ,					// input
	.control_go_to_the_master_write(control_go_write) ,					// input
	.control_write_base_to_the_master_write(control_write_base) ,		// input [29:0]
	.control_write_length_to_the_master_write(control_write_length) ,	// input [29:0]
	.user_buffer_full_from_the_master_write(user_buffer_full) ,			// output
	.user_buffer_input_data_to_the_master_write(user_buffer_data_write),// input [31:0]
	.user_write_buffer_to_the_master_write(user_write_buffer) 			// input
);


TestRead TestRead_inst
(
	// global signals
	.RSTn(rstn) ,											// input
	.CLK48MHZ(clk50MHz) ,									// input
	
	// test read
	.control_go(control_go_read) ,							// output
	.control_read_base(control_read_base) ,					// output [23:0]
	.control_read_length(control_read_length) ,				// output [23:0]
	.control_done(control_done_read) ,						// input
	.user_buffer_data(user_buffer_data_read) ,				// input [31:0]
	.user_read_buffer(user_read_buffer) ,					// output
	.user_data_available(user_data_available) ,				// input
	.addressLastCompleteWrite(address_last_complete_write) ,// input [23:0]
	.addressLastCompleteRead(address_last_complete_read) ,	// output [23:0]
	.readingDone(reading_done) ,							// output
	
	// display error
	.debugOut(debug_read) ,									// output [31:0]
	.errorData(error_data) 									// output [2:0]
);

TestWrite TestWrite_inst
(
	// global signals
	.RSTn(rstn) ,											// input  
	.CLK48MHZ(clk50MHz) ,									// input  
	
	// test write signals
	.control_go(control_go_write) ,							// output
	.control_write_base(control_write_base) ,				// output [23:0]
	.control_write_length(control_write_length) ,			// output [23:0]
	.control_done(control_done_write) ,						// input
	.user_buffer_data(user_buffer_data_write) ,				// output [31:0]
	.user_buffer_full(user_buffer_full) ,					// input
	.user_write_buffer(user_write_buffer) ,					// output
	.addressLastCompleteWrite(address_last_complete_write) ,// output [23:0]
	.addressLastCompleteRead(address_last_complete_read) ,	// input [23:0]
	.writingDone(writing_done) ,							// output
	
	// display error
	.debugOut(debug_write) ,								// output [31:0]
	.errorFull(error_full) 									// output
);


///////////////////////////////////////////////////////////////////////////////
// Optional modules
///////////////////////////////////////////////////////////////////////////////

// Fan PWM control (makes less noise)
FAN_PWM FAN_PWM_inst
(
	.clk(OSC_50_Bank3) ,									// input  clk_sig
	.PWM_input(4'hC) ,										// input [3:0] PWM_input_sig
	.clk_div_out(clk_div_out_sig) ,							// output [7:0] clk_div_out_sig
	.FAN(FAN_sig) 											// output  FAN_sig
);

// LED blinking
LED_glow LED_glow_inst
(
	.clk(clk_div_out_sig[1]) ,								// input  clk_sig
	.LED(LED[7]) 											// output  LED_sig
);

endmodule
