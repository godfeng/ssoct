// OCT acquisition and data transfer via TCP/IP
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
//   V1.0  |EricChen  |10/06/30      |
// ============================================================================

`include "my_incl.v"			// Verilog include file
`define NET0					// Ethernet PHY 0
//`define NET1
//`define NET2
//`define NET3


//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module DE4_Ethernet(

	//////// CLOCK //////////
	GCLKIN,
	GCLKOUT_FPGA,
	OSC_50_BANK2,
	OSC_50_BANK3,
	OSC_50_BANK4,
	OSC_50_BANK5,
	OSC_50_BANK6,
	OSC_50_BANK7,
	PLL_CLKIN_p,

	//////// External PLL //////////
	MAX_I2C_SCLK,
	MAX_I2C_SDAT,

	//////// LED x 8 //////////
	LED,

	//////// BUTTON x 4, EXT_IO and CPU_RESET_n //////////
	BUTTON,
	CPU_RESET_n,
	EXT_IO,

	//////// DIP SWITCH x 8 //////////
	SW,

	//////// SLIDE SWITCH x 4 //////////
	SLIDE_SW,

	//////// SEG7 //////////
	SEG0_D,
	SEG0_DP,
	SEG1_D,
	SEG1_DP,

	//////// Temperature //////////
	TEMP_INT_n,
	TEMP_SMCLK,
	TEMP_SMDAT,

	//////// Current //////////
	CSENSE_ADC_FO,
	CSENSE_CS_n,
	CSENSE_SCK,
	CSENSE_SDI,
	CSENSE_SDO,

	//////// Fan //////////
	FAN_CTRL,

	//////// EEPROM //////////
	EEP_SCL,
	EEP_SDA,

	//////// SDCARD //////////
	SD_CLK,
	SD_CMD,
	SD_DAT,
	SD_WP_n,

	//////// RS232 //////////
	UART_CTS,
	UART_RTS,
	UART_RXD,
	UART_TXD,

	//////// Ethernet x 4 //////////
	ETH_INT_n,
	ETH_MDC,
	ETH_MDIO,
	ETH_RST_n,
	ETH_RX_p,
	ETH_TX_p,

	//////// Flash and SRAM Address/Data Share Bus //////////
	FSM_A,
	FSM_D,

	//////// Flash Control //////////
	FLASH_ADV_n,
	FLASH_CE_n,
	FLASH_CLK,
	FLASH_OE_n,
	FLASH_RESET_n,
	FLASH_RYBY_n,
	FLASH_WE_n,

	//////// SSRAM Control //////////
	SSRAM_ADV,
	SSRAM_BWA_n,
	SSRAM_BWB_n,
	SSRAM_CE_n,
	SSRAM_CKE_n,
	SSRAM_CLK,
	SSRAM_OE_n,
	SSRAM_WE_n, 
	
	//////////// HSMC-B, HSMC-B connect to DCC //////////
	// Data Conversion Card
	AD_SCLK,
	AD_SDIO,
	ADA_D,
	ADA_DCO,
	ADA_OE,
	ADA_OR,
	ADA_SPI_CS,
	ADB_D,
	ADB_DCO,
	ADB_OE,
	ADB_OR,
	ADB_SPI_CS,
	AIC_BCLK,
	AIC_DIN,
	AIC_DOUT,
	AIC_LRCIN,
	AIC_LRCOUT,
	AIC_SPI_CS,
	AIC_XCLK,
	CLKIN1,
	CLKOUT0,
	DA,
	DB,
	FPGA_CLK_A_N,
	FPGA_CLK_A_P,
	FPGA_CLK_B_N,
	FPGA_CLK_B_P,
	J1_152,
	XT_IN_N,
	XT_IN_P,

	//////////// HSMC I2C //////////
	HSMC_SCL,
	HSMC_SDA 
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
input		          		OSC_50_BANK2;
input		          		OSC_50_BANK3;
input		          		OSC_50_BANK4;
input		          		OSC_50_BANK5;
input		          		OSC_50_BANK6;
input		          		OSC_50_BANK7;
input		          		PLL_CLKIN_p;

//////////// External PLL //////////
output		          		MAX_I2C_SCLK;
inout		          		MAX_I2C_SDAT;

//////////// LED x 8 //////////
output		     [7:0]		LED;

//////////// BUTTON x 4, EXT_IO and CPU_RESET_n //////////
input		     [3:0]		BUTTON;
input		          		CPU_RESET_n;
inout		          		EXT_IO;

//////////// DIP SWITCH x 8 //////////
input		     [7:0]		SW;

//////////// SLIDE SWITCH x 4 //////////
input		     [3:0]		SLIDE_SW;

//////////// SEG7 //////////
output		     [6:0]		SEG0_D;
output		          		SEG0_DP;
output		     [6:0]		SEG1_D;
output		          		SEG1_DP;

//////////// Temperature //////////
input		          		TEMP_INT_n;
output		          		TEMP_SMCLK;
inout		          		TEMP_SMDAT;

//////////// Current //////////
output		          		CSENSE_ADC_FO;
output		     [1:0]		CSENSE_CS_n;
output		          		CSENSE_SCK;
output		          		CSENSE_SDI;
input		          		CSENSE_SDO;

//////////// Fan //////////
output		          		FAN_CTRL;

//////////// EEPROM //////////
output		          		EEP_SCL;
inout		          		EEP_SDA;

//////////// SDCARD //////////
output		          		SD_CLK;
inout		          		SD_CMD;
inout		     [3:0]		SD_DAT;
input		          		SD_WP_n;

//////////// RS232 //////////
output		          		UART_CTS;
input		          		UART_RTS;
input		          		UART_RXD;
output		          		UART_TXD;

//////////// Ethernet x 4 //////////
input		     [3:0]		ETH_INT_n;
output		     [3:0]		ETH_MDC;
inout		     [3:0]		ETH_MDIO;
output		          		ETH_RST_n;
//input		     [3:0]		ETH_RX_p;
//output		     [3:0]		ETH_TX_p;

//////////// Flash and SRAM Address/Data Share Bus //////////
output		    [25:0]		FSM_A;
inout		    [15:0]		FSM_D;

//////////// Flash Control //////////
output		          		FLASH_ADV_n;
output		          		FLASH_CE_n;
output		          		FLASH_CLK;
output		          		FLASH_OE_n;
output		          		FLASH_RESET_n;
input		          		FLASH_RYBY_n;
output		          		FLASH_WE_n;

//////////// SSRAM Control //////////
output		          		SSRAM_ADV;
output		          		SSRAM_BWA_n;
output		          		SSRAM_BWB_n;
output		          		SSRAM_CE_n;
output		          		SSRAM_CKE_n;
output		          		SSRAM_CLK;
output		          		SSRAM_OE_n;
output		          		SSRAM_WE_n;

//////////// HSMC-B, HSMC-B connect to DCC //////////
// Data Conversion Card
inout		          		AD_SCLK;
inout		          		AD_SDIO;
input		    [13:0]		ADA_D;
input		          		ADA_DCO;
output		          		ADA_OE;
input		          		ADA_OR;
output		          		ADA_SPI_CS;
input		    [13:0]		ADB_D;
input		          		ADB_DCO;
output		          		ADB_OE;
input		          		ADB_OR;
output		          		ADB_SPI_CS;
inout		          		AIC_BCLK;
output		          		AIC_DIN;
input		          		AIC_DOUT;
inout		          		AIC_LRCIN;
inout		          		AIC_LRCOUT;
output		          		AIC_SPI_CS;
output		          		AIC_XCLK;
input		          		CLKIN1;
output		          		CLKOUT0;
output		    [13:0]		DA;
output		    [13:0]		DB;
inout		          		FPGA_CLK_A_N;
inout		          		FPGA_CLK_A_P;
inout		          		FPGA_CLK_B_N;
inout		          		FPGA_CLK_B_P;
inout		          		J1_152;
input		          		XT_IN_N;
input		          		XT_IN_P;

//////////// HSMC I2C //////////
output		          		HSMC_SCL;
inout		          		HSMC_SDA;

//=======================================================
//  REG/WIRE declarations
//=======================================================

wire						global_reset_n;
wire						enet_reset_n;
wire						sys_clk;

//// Ethernet
wire						enet_mdc;
wire						enet_mdio_in;
wire						enet_mdio_oen;
wire						enet_mdio_out;
wire						enet_refclk_125MHz;

wire						lvds_rxp;
wire						lvds_txp;

// A-line of 1170 Elements, each 14 bits wide
reg  		[13:0]			A_line_array	[0:`NSAMPLES-1];
wire		[13:0]			A_line; 
// 50 kHz A-line trigger
wire						sweepTrigger;
// Position of the ADC sample in the A-line
wire		[10:0]			sample_position;

// Position of the ADC sample in the RAM
wire		[10:0]			read_RAM_address;

// Data from RAM
wire		[13:0]			RAMdata;

// Acquiring 1170 samples
wire						acq_busy;

// Reading RAM 
wire						read_RAM_busy;

//=======================================================
//  External PLL Configuration ==========================
//=======================================================

//  Signal declarations
wire [ 3: 0] clk1_set_wr, clk2_set_wr, clk3_set_wr;
wire         rstn;
wire         conf_ready;
wire         counter_max;
wire  [7:0]  counter_inc;
reg   [7:0]  auto_set_counter;
reg          conf_wr;

//  Structural coding
assign clk1_set_wr = 4'd1; //Disable
assign clk2_set_wr = 4'd1; //Disable
assign clk3_set_wr = 4'd7; //156.25 MHZ

assign rstn = CPU_RESET_n;
assign counter_max = &auto_set_counter;
assign counter_inc = auto_set_counter + 1'b1;

always @(posedge OSC_50_BANK2 or negedge rstn)
	if(!rstn)
	begin
		auto_set_counter <= 0;
		conf_wr <= 0;
	end 
	else if (counter_max)
		conf_wr <= 1;
	else
		auto_set_counter <= counter_inc;


ext_pll_ctrl ext_pll_ctrl_Inst(
	.osc_50(OSC_50_BANK2), //50MHZ
	.rstn(rstn),

	// device 1 (HSMA_REFCLK)
	.clk1_set_wr(clk1_set_wr),
	.clk1_set_rd(),

	// device 2 (HSMB_REFCLK)
	.clk2_set_wr(clk2_set_wr),
	.clk2_set_rd(),

	// device 3 (PLL_CLKIN/SATA_REFCLK)
	.clk3_set_wr(clk3_set_wr),
	.clk3_set_rd(),

	// setting trigger
	.conf_wr(conf_wr), // 1T 50MHz 
	.conf_rd(), // 1T 50MHz

	// status 
	.conf_ready(conf_ready),

	// 2-wire interface 
	.max_sclk(MAX_I2C_SCLK),
	.max_sdat(MAX_I2C_SDAT)

);


//=======================================================
//  Structural coding
//=======================================================

//// Ethernet
assign	ETH_RST_n			= enet_reset_n;

`ifdef NET0
input		     [0:0]		ETH_RX_p;
output		     [0:0]		ETH_TX_p;
assign	lvds_rxp			= ETH_RX_p[0];
assign	ETH_TX_p[0]			= lvds_txp;
assign	enet_mdio_in		= ETH_MDIO[0];
assign	ETH_MDIO[0]			= !enet_mdio_oen ? enet_mdio_out : 1'bz;
assign	ETH_MDC[0]			= enet_mdc;

`elsif NET1
input		     [1:1]		ETH_RX_p;
output		     [1:1]		ETH_TX_p;
assign	lvds_rxp			= ETH_RX_p[1];
assign	ETH_TX_p[1]			= lvds_txp;
assign	enet_mdio_in		= ETH_MDIO[1];
assign	ETH_MDIO[1]			= !enet_mdio_oen ? enet_mdio_out : 1'bz;
assign	ETH_MDC[1]			= enet_mdc;

`elsif NET2
input		     [2:2]		ETH_RX_p;
output		     [2:2]		ETH_TX_p;
assign	lvds_rxp			= ETH_RX_p[2];
assign	ETH_TX_p[2]			= lvds_txp;
assign	enet_mdio_in		= ETH_MDIO[2];
assign	ETH_MDIO[2]			= !enet_mdio_oen ? enet_mdio_out : 1'bz;
assign	ETH_MDC[2]			= enet_mdc;

`elsif NET3
input		     [3:3]		ETH_RX_p;
output		     [3:3]		ETH_TX_p;
assign	lvds_rxp			= ETH_RX_p[3];
assign	ETH_TX_p[3]			= lvds_txp;
assign	enet_mdio_in		= ETH_MDIO[3];
assign	ETH_MDIO[3]			= !enet_mdio_oen ? enet_mdio_out : 1'bz;
assign	ETH_MDC[3]			= enet_mdc;

`endif


//// FLASH and SSRAM share bus
assign	FLASH_ADV_n		= 1'b0;					// not used
assign	FLASH_CLK		= 1'b0;					// not used
assign	FLASH_RESET_n	= global_reset_n;
//// SSRAM




// === Ethernet clock PLL
pll_125 pll_125_ins (
				.inclk0(OSC_50_BANK3),
				.c0(enet_refclk_125MHz)
				);

gen_reset_n	system_gen_reset_n (
				.tx_clk(OSC_50_BANK3),
				.reset_n_in(CPU_RESET_n),
				.reset_n_out(global_reset_n)
				);

gen_reset_n	net_gen_reset_n(
				.tx_clk(OSC_50_BANK3),
				.reset_n_in(global_reset_n),
				.reset_n_out(enet_reset_n)
				);

// SOPC module
DE4_SOPC	SOPC_INST (
				// 1) global signals:
				.ext_clk(OSC_50_BANK6),		// OSC_50_BANK6
				.pll_peripheral_clk(),
				.pll_sys_clk(),
				.reset_n(global_reset_n),

				// the_flash_tristate_bridge_avalon_slave
				.flash_tristate_bridge_address(FSM_A[24:0]),
				.flash_tristate_bridge_data(FSM_D),
				.flash_tristate_bridge_readn(FLASH_OE_n),
				.flash_tristate_bridge_writen(FLASH_WE_n),
				.select_n_to_the_ext_flash(FLASH_CE_n),

				// the_tse_mac
				.led_an_from_the_tse_mac(led_an_from_the_tse_mac),
				.led_char_err_from_the_tse_mac(led_char_err_from_the_tse_mac),
				.led_col_from_the_tse_mac(led_col_from_the_tse_mac),
				.led_crs_from_the_tse_mac(led_crs_from_the_tse_mac),
				.led_disp_err_from_the_tse_mac(led_disp_err_from_the_tse_mac),
				.led_link_from_the_tse_mac(led_link_from_the_tse_mac),
				.mdc_from_the_tse_mac(enet_mdc),
				.mdio_in_to_the_tse_mac(enet_mdio_in),
				.mdio_oen_from_the_tse_mac(enet_mdio_oen),
				.mdio_out_from_the_tse_mac(enet_mdio_out),
				.ref_clk_to_the_tse_mac(enet_refclk_125MHz),
				.rxp_to_the_tse_mac(lvds_rxp),
				.txp_from_the_tse_mac(lvds_txp),

				// the_pb_pio
				.in_port_to_the_pb_pio(BUTTON),

				// the_sw_pio
				.in_port_to_the_sw_pio(SW),

				// the_seven_seg_pio
				.out_port_from_the_seven_seg_pio({SEG1_DP,SEG1_D[6:0],SEG0_DP,SEG0_D[6:0]}),

				// the_led_pio
				.out_port_from_the_led_pio({dummy_LED,LED[6:0]}),
				
				// Busy acquiring data
				.in_port_to_the_acq_busy_pio(acq_busy) ,	// input  in_port_to_the_acq_busy_pio_sig
				
				// Busy reading from RAM
				.out_port_from_the_read_RAM_busy_pio(read_RAM_busy) ,	// output  out_port_from_the_read_RAM_busy__pio_sig
				
				// data from the ADC
				.in_port_to_the_ADC_data_pio(RAMdata),	// input [15:0] in_port_to_the_ADC_data_pio_sig
				
				.out_port_from_the_read_RAM_address(read_RAM_address) ,	// output [10:0] out_port_from_the_read_RAM_address_sig
				);

///////////////////////////////////////////////////////////////////////////////

assign	FPGA_CLK_A_P	=  sys_clk;
assign	FPGA_CLK_A_N	= ~sys_clk;

// assign for ADC control signal
assign	AD_SCLK			= 1'b0;				// (DFS)Data Format Select = binary (0)
assign	AD_SDIO			= 1'b1;				// (DCS)Duty Cycle Stabilizer ON
assign	ADA_OE			= 1'b0;				// enable ADA output (active LOW)
assign	ADA_SPI_CS		= 1'b1;				// disable serial port interface A
assign	ADB_OE			= 1'b0;				// enable ADB output (active LOW)
assign	ADB_SPI_CS		= 1'b1;				// disable serial port interface B

// Assign 50 kHz Sweep Trigger
assign	sweepTrigger	= GCLKIN;

// Assign 156.25 MHz clock PLL_CLKIN_p to sys_clk
assign	sys_clk			= PLL_CLKIN_p;

//always @(negedge global_reset_n or posedge sys_clk)
//begin
//if (!global_reset_n) begin
//		A_line_array[sample_position]		<= 14'd0;
//	end
//	else begin
//		A_line_array[sample_position] 		<= A_line;
//	end
//end

// A_line acquisition block
A_line_acq A_line_acq_inst
(
	.clk_system(sys_clk) ,					// input  clk_system_sig (156.25 MHz)
	.clk50MHz(OSC_50_BANK2) ,				// input  clk50MHz_sig (internal oscillator)
	.ADC_data_out_clk(ADA_DCO) ,			// input  ADC_data_out_clk_sig
	.trigger50kHz(sweepTrigger) ,			// input  trigger50kHz_sig
	.ADC_chanA(ADA_D) ,						// input [13:0] ADC_chanA_sig
	.global_reset(global_reset_n) ,			// input  global_reset_sig
	.sample_pos(sample_position) ,			// output [10:0] sample_pos_sig
	.read_RAM_address() ,					// output [10:0] read_RAM_address_sig
	.DAC_output(DB) ,						// output [13:0] DAC_output_sig
	.o_sine(DA) ,							// output [13:0] o_sine_sig
	.A_line_out(A_line) ,					// output [13:0] A_line_acq_sig
	.LED7(LED[7]) ,							// output  LED7_sig
	.FANpin(FAN_CTRL) ,						// output  FANpin_sig
	.acq_busy(acq_busy) ,					// output  acq_busy_sig
);

// 2048 words (16-bit) RAM
RAM	RAM_inst (
	.data ( {2'b0, ADA_D} ),
	.rdaddress ( read_RAM_address ),
	.rdclock ( sys_clk ),
	.wraddress ( sample_position ),
	.wrclock ( ADA_DCO ),
	.wren ( acq_busy & ~read_RAM_busy),		// acq_busy
	.q ( RAMdata )
	);
	
endmodule
