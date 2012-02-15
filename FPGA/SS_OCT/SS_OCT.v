// Swept Source Optical Coherence Tomography acquisition system
// using Nios II Ethernet acceleration
// 
//==============================================================================
// Copyright (C) 2011 LIOM Laboratoire d'Imagerie Optique et Mol�culaire
//                    �cole Polytechnique de Montr�al
// Edgar Guevara, Maxime Abran
// 2012/01/24
//==============================================================================
//  This code is generated by Terasic System Builder
//==============================================================================
`include "my_incl.v"			// Verilog include file

module SS_OCT(

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

	//////// LED x 8 //////////
	LED,

	//////// BUTTON x 4 //////////
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
	HSMC_SDA,

	//////////// GPIO_0, GPIO_0 connect to GPIO Default //////////
	GPIO,

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

//==============================================================================
//  PARAMETER declarations
//==============================================================================


//==============================================================================
//  PORT declarations
//==============================================================================

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

//////////// LED x 8 //////////
output		     [7:0]		LED;

//////////// BUTTON x 4 //////////
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
//output			[3:0]		ETH_TX_p;

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
	
//////////// GPIO_0, GPIO[6:0] connect to NI-USB 6351  //////////
inout		    [35:0]		GPIO;

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

//==============================================================================
//  REG/WIRE declarations
//==============================================================================

//// Global signals
wire 						reset_n;			// reset_n from board
wire						global_reset_n;		// delayed reset signal
wire						enet_reset_n;		// reset signal for ethernet
wire						clk156MHz;			// clock from ext_PLL @ 156.25 MHz
wire						clk50MHz;			// clock from board oscillator bank 3 @ 50 MHz
wire						clk150MHz;			// clock from internal PLL @ 150 MHz (actually 125 MHz)
wire						clockVar;			// output of the PLL fed by ADA_DCO

//// External PLL
wire						MAX_I2C_SCLK;		// SPI
wire						MAX_I2C_SDAT;		// SPI

//// Master template
wire						control_done_read;
wire			[31:0]		user_buffer_data_read;
wire						user_data_available;
wire			[29:0]		address_last_complete_read;
wire						control_go_read;
wire			[29:0]		control_read_base;
wire			[29:0]		control_read_length;
wire						user_read_buffer;
wire						reading_done;
wire			[31:0]		debug_read;
wire			[2:0]		error_data;
	
wire						control_done_write;
wire			[255:0]		user_buffer_data_write;
wire						user_buffer_full;
wire			[29:0]		address_last_complete_write;
wire						control_go_write;
wire			[29:0]		control_write_base;
wire			[29:0]		control_write_length;
wire						user_write_buffer;
wire						writing_done;
wire			[31:0]		debug_write;
wire						error_full;

// DDR2 200 MHz clock out
wire						ddr2_phy_clk_out;

//// Ethernet
wire						enet_mdc;
wire						enet_mdio_in;
wire						enet_mdio_oen;
wire						enet_mdio_out;
wire						enet_refclk_125MHz;

wire						lvds_rxp;
wire						lvds_txp;

wire						led_an_from_the_tse_mac;
wire						led_char_err_from_the_tse_mac;
wire						led_col_from_the_tse_mac;
wire						led_crs_from_the_tse_mac;
wire						led_disp_err_from_the_tse_mac;
wire						led_link_from_the_tse_mac;

// FLASH address bus
wire	[25:0]     			flash_address_bus;

// Receive reset signal from LabView P0.4 to GPIO[4]
wire						labviewReset;

// Map 50 kHz A-line sweep signal to GPIO[0], connected to LAbView PFI0
wire						sweepTrigger;

// 50 kHz A-line trigger enabled by LabView
wire						trigger50kHz;

// Receive signal from LabView P0.6 to record data to DDR2 in GPIO[6]
wire						enableRecording;

// Receive signal from LabView P0.5 to assert Volume recorded in GPIO[5]
wire						volRecordingDone;

// Transmit signal to LabView PFI1 when a whole volume is transferred via TCP/IP in GPIO[1]
wire						volTransferDone;

// Position of the ADC sample in the RAM
wire		[ 6:0]			read_RAM_address;
wire		[10:0]			write_RAM_address;

// Data output from internal RAM
wire		[255:0]			RAMdata;

// MSB to write dual buffer RAM
wire						dualMSB_write;
// MSB to read dual buffer RAM
wire						dualMSB_read;

// Acquiring 1170 samples
wire						acq_busy;
// Acquisition of one A-line done
wire						acq_done;

// PWM for Fan and LED
wire		[7:0]			clk_div_out_sig;

// sinus wave signal
wire		[13:0]			raw_sine;
// output to DAC B
reg			[13:0]			o_sine;

//LED diagnostics from state machine RAMtoDDR2
wire		[6:0]			stateLED;

//==============================================================================
//  External PLL Configuration =================================================
//==============================================================================

//  Signal declarations
wire 		[3:0] 			clk1_set_wr, clk2_set_wr, clk3_set_wr;
wire         				conf_ready;
wire         				counter_max;
wire  		[7:0]  			counter_inc;
reg   		[7:0]  			auto_set_counter;
reg          				conf_wr;

//  Structural coding
assign clk1_set_wr 			= 4'd1; 			//Disable 4'd1
assign clk2_set_wr 			= 4'd1; 			//Disable 4'd1
assign clk3_set_wr 			= 4'd1; 			//156.25 MHZ 4'd7

assign counter_max 			= &auto_set_counter;
assign counter_inc 			= auto_set_counter + 1'b1;

always @(posedge clk50MHz or negedge reset_n)
	if(!reset_n)
	begin
		auto_set_counter <= 0;
		conf_wr <= 0;
	end 
	else if (counter_max)
		conf_wr <= 1;
	else
		auto_set_counter <= counter_inc;


ext_pll_ctrl ext_pll_ctrl_Inst (
	.osc_50(clk50MHz), 							//50MHZ
	.rstn(reset_n),

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
	.conf_wr(conf_wr), 							// 1T 50MHz 
	.conf_rd(), 								// 1T 50MHz

	// status 
	.conf_ready(conf_ready),

	// 2-wire interface 
	.max_sclk(MAX_I2C_SCLK),
	.max_sdat(MAX_I2C_SDAT)
	);

//==============================================================================
//  End of External PLL Configuration ==========================================
//==============================================================================

//==============================================================================
//  Structural coding
//==============================================================================

//// Global signals (Reset from LabView and CPU)
assign reset_n 				= CPU_RESET_n & ~labviewReset;

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
assign	FLASH_ADV_n			= 1'b0;				// not used
assign	FLASH_CLK			= 1'b0;				// not used
assign 	FLASH_RESET_n 		= 1'b1;				// Disable Flash Reset
												// FLASH_WP_n????
												// Assign MSB to FLASH address bus
assign FSM_A[25:1] 			= flash_address_bus[25:1];	
//// SSRAM

//==============================================================================
// assign for ADC control signal
//==============================================================================
assign	AD_SCLK				= 1'b0;				// (DFS)Data Format Select = binary (0)
assign	AD_SDIO				= 1'b1;				// (DCS)Duty Cycle Stabilizer OFF (0)
assign	ADA_OE				= 1'b0;				// enable ADA output (active LOW)
assign	ADA_SPI_CS			= 1'b1;				// disable serial port interface A (1)
assign	ADB_OE				= 1'b1;				// enable ADB output (active LOW)
assign	ADB_SPI_CS			= 1'b1;				// disable serial port interface B (1)

//==============================================================================
// assign for DAC sinus output
//==============================================================================
// sinus wave to DA
assign	DB					= o_sine;			// Output sinus wave to DAC B

//==============================================================================
// GPIO OUTPUTS
//==============================================================================
// Assign 50 kHz Sweep Trigger (from swept source)
assign	sweepTrigger		= GCLKIN;
// Map 50 kHz A-line sweep signal to GPIO[0], connected to LAbView PFI0
assign	GPIO[0]				= sweepTrigger;
// Transmit signal to LabView PFI1 when a whole volume is transferred via TCP/IP in GPIO[1]
assign	GPIO[1]				= volTransferDone;
// Display volume transfer done signal from NIOS
assign	SEG1_DP				= ~volTransferDone;

//==============================================================================
// GPIO INPUTS
//==============================================================================
// Receive signal from LabView P0.6 to record data to DDR2 in GPIO[6]
assign	enableRecording		= GPIO[6];
// Display enable signal from LabView
assign	SEG0_DP				= ~enableRecording;
// Receive signal from LabView P0.5 to assert Volume recorded in GPIO[5]
assign	volRecordingDone	= GPIO[5];
// Receive reset signal from LabView P0.4 to GPIO[4]
assign	labviewReset		= GPIO[4];

// Acquisition is triggered only when LabView asserts the enable
assign 	trigger50kHz		= enableRecording & sweepTrigger;

// LED diagnostics (active LOW)
assign	LED[6:0]			= ~stateLED;

// Turn off 7-segment displays (active LOW)
assign	SEG0_D				= 7'h7F;
assign	SEG1_D				= 7'h7F;

// Assign 156.25 MHz external clock PLL_CLKIN_p to clk156MHz
assign	clk156MHz			= PLL_CLKIN_p;

// Assign clk150MHz (actually 125 MHz) to differential outputs to HSMC-B board
assign	FPGA_CLK_B_P		=  clk150MHz;
assign	FPGA_CLK_B_N		= ~clk150MHz;

// Assign OSC_50_BANK3 to clk50MHz
assign	clk50MHz			= OSC_50_BANK3;

// Assign ADA_DCO to wire clockVar
assign	clockVar			=  ADA_DCO;

// Synchronization of sampling with sweep trigger
sample_addressing_custom sample_addressing_custom_inst (
	.clock( clockVar ) ,						// input  clock_sig (ADA_DCO)
	.sclr( ~trigger50kHz ) ,					// input  ~trigger50kHz
	.sample_position( write_RAM_address ) ,		// output [10:0] write_RAM_address
	.acq_busy( acq_busy ) ,						// output acq_busy
	.acq_done( acq_done ) ,						// output acq_done
	.dualMSB_write( dualMSB_write ) ,			// output dualMSB_write
	.dualMSB_read( dualMSB_read )				// output dualMSB_read
	);

// 4096 words (16-bit data bus) RAM
RAM	RAM_inst (
	.wraddress ({ dualMSB_write, write_RAM_address }),// input [11:0] Sample position (0-1169)
	.wrclock ( clockVar ),						// input Write clock (ADA_DCO)
	.wren ( acq_busy ),							// input acq_busy
	.data ( {4'b0, write_RAM_address} ),		// input [15:0] 16-bit data (Original connection: {2'b0, ADA_D})
	.rdaddress({dualMSB_read,read_RAM_address}),// input [7:0] Read address ({dualMSB_read,read_RAM_address}) from NIOS
	.rdclock ( clk150MHz ),						// input Read clock (clk150MHz) (actually 125 MHz)
	.q ( RAMdata )								// output [255:0] data read by NIOS
	);

// Write contents of internal RAM to DDR2
RAMtoDDR2 RAMtoDDR2_inst
(
	.RSTn(global_reset_n) ,						// input  global_reset_n
	.CLK50MHZ(clk50MHz) ,						// input  clk50MHz
	.control_go(control_go_write) ,				// output  control_go_write
	.control_write_base(control_write_base) ,	// output [address_width-1:0] control_write_base
	.control_write_length(control_write_length),// output [address_width-1:0] control_write_length
	.control_done(control_done_write) ,			// input  control_done_write
	.user_buffer_data(user_buffer_data_write) ,	// output [255:0] user_buffer_data_write
	.user_buffer_full(user_buffer_full) ,		// input  user_buffer_full
	.user_write_buffer(user_write_buffer) ,		// output  user_write_buffer
	.RAM_dataOut(RAMdata) ,						// input [255:0] RAMdata
	.RAM_readAddress(read_RAM_address) ,		// output [6:0] read_RAM_address
	.acq_done(acq_done) ,						// input  acq_done
	.stateLED(stateLED)							// output stateLED (Debug states)
);

// Ethernet clock PLL
pll_125 pll_125_ins (
	.inclk0(clk50MHz),							// Dedicated clock clk50MHz
	.c0(enet_refclk_125MHz)
	);

// Yields a reset signal 20 ms after cpu reset
PowerOn_RST PowerOn_RST_inst
(
	.clk(clk50MHz) ,							// input  clk50MHz
	.RSTnCPU(reset_n) ,							// input  reset_n
	.RSTn(global_reset_n) 						// output  global_reset_n
);

// Generate ethernet reset signal
gen_reset_n	net_gen_reset_n(
	.tx_clk(clk50MHz),
	.reset_n_in(global_reset_n),
	.reset_n_out(enet_reset_n)
	);
				
// SOPC system with master read and write DDR2 handling
SS_OCT_SOPC SS_OCT_SOPC_inst(
	// Global signals:
	.clk_50(clk50MHz),														// input  	clk50MHz
	.reset_n(global_reset_n),												// input  	global_reset_n

`ifndef USE_DDR2_DIMM2
  // The DDR2 DIMM1
   .aux_scan_clk_from_the_ddr2(),
   .aux_scan_clk_reset_n_from_the_ddr2(),
   .dll_reference_clk_from_the_ddr2(),
   .dqs_delay_ctrl_export_from_the_ddr2(),
   .global_reset_n_to_the_ddr2( reset_n ),									// input  	reset_n
   .local_init_done_from_the_ddr2(),
   .local_refresh_ack_from_the_ddr2(),
   .local_wdata_req_from_the_ddr2(),
   .mem_addr_from_the_ddr2(M1_DDR2_addr),									// output 	[13:0] M1_DDR2_addr
   .mem_ba_from_the_ddr2(M1_DDR2_ba),										// output 	[2:0] M1_DDR2_ba
   .mem_cas_n_from_the_ddr2(M1_DDR2_cas_n),									// output  	M1_DDR2_cas_n
   .mem_cke_from_the_ddr2(M1_DDR2_cke),										// output  	M1_DDR2_cke
   .mem_clk_n_to_and_from_the_ddr2(M1_DDR2_clk_n),							// inout 	[1:0] M1_DDR2_clk_n
   .mem_clk_to_and_from_the_ddr2(M1_DDR2_clk),								// inout 	[1:0] M1_DDR2_clk
   .mem_cs_n_from_the_ddr2(M1_DDR2_cs_n),									// output  	M1_DDR2_cs_n
   .mem_dm_from_the_ddr2(M1_DDR2_dm),										// output 	[7:0] M1_DDR2_dm
   .mem_dq_to_and_from_the_ddr2(M1_DDR2_dq),								// inout 	[63:0] M1_DDR2_dq
   .mem_dqs_to_and_from_the_ddr2(M1_DDR2_dqs),								// inout 	[7:0] M1_DDR2_dqs
   .mem_dqsn_to_and_from_the_ddr2(M1_DDR2_dqsn),							// inout 	[7:0] M1_DDR2_dqsn
   .mem_odt_from_the_ddr2(M1_DDR2_odt),										// output  	M1_DDR2_odt
   .mem_ras_n_from_the_ddr2(M1_DDR2_ras_n),									// output  	M1_DDR2_ras_n
   .mem_we_n_from_the_ddr2(M1_DDR2_we_n),									// output  	M1_DDR2_we_n
   .oct_ctl_rs_value_to_the_ddr2(),
   .oct_ctl_rt_value_to_the_ddr2(),
   .reset_phy_clk_n_from_the_ddr2(),
   
`else              
	// The DDR2 DIMM2
	.aux_scan_clk_from_the_ddr2(),
	.aux_scan_clk_reset_n_from_the_ddr2(),
	.dll_reference_clk_from_the_ddr2(),
	.dqs_delay_ctrl_export_from_the_ddr2(),
	.global_reset_n_to_the_ddr2( reset_n ),
	.local_init_done_from_the_ddr2(),
	.local_refresh_ack_from_the_ddr2(),
	.local_wdata_req_from_the_ddr2(),
	.mem_addr_from_the_ddr2(M2_DDR2_addr),
	.mem_ba_from_the_ddr2(M2_DDR2_ba),
	.mem_cas_n_from_the_ddr2(M2_DDR2_cas_n),
	.mem_cke_from_the_ddr2(M2_DDR2_cke),
	.mem_clk_n_to_and_from_the_ddr2(M2_DDR2_clk_n),
	.mem_clk_to_and_from_the_ddr2(M2_DDR2_clk),
	.mem_cs_n_from_the_ddr2(M2_DDR2_cs_n),
	.mem_dm_from_the_ddr2(M2_DDR2_dm),
	.mem_dq_to_and_from_the_ddr2(M2_DDR2_dq),
	.mem_dqs_to_and_from_the_ddr2(M2_DDR2_dqs),
	.mem_dqsn_to_and_from_the_ddr2(M2_DDR2_dqsn),
	.mem_odt_from_the_ddr2(M2_DDR2_odt),
	.mem_ras_n_from_the_ddr2(M2_DDR2_ras_n),
	.mem_we_n_from_the_ddr2(M2_DDR2_we_n),
	.oct_ctl_rs_value_to_the_ddr2(),
	.oct_ctl_rt_value_to_the_ddr2(),
	.reset_phy_clk_n_from_the_ddr2(),

`endif                   
	
	// DDR2 clock out
	.ddr2_phy_clk_out (ddr2_phy_clk_out),									// output  	ddr2_phy_clk_out
	
	// Master Read template
	.control_done_from_the_master_read(control_done_read) ,					// output 	control_done_read
	.control_early_done_from_the_master_read() ,							// output  
	.control_fixed_location_to_the_master_read(0) ,							// input  
	.control_go_to_the_master_read(control_go_read) ,						// input 	control_go_read
	.control_read_base_to_the_master_read(control_read_base) ,				// input 	[29:0] control_read_base
	.control_read_length_to_the_master_read(control_read_length) ,			// input 	[29:0] control_read_length
	.user_buffer_output_data_from_the_master_read(user_buffer_data_read) ,	// output 	[255:0] user_buffer_data_read
	.user_data_available_from_the_master_read(user_data_available) ,		// output 	user_data_available
	.user_read_buffer_to_the_master_read(user_read_buffer) ,				// input 	user_read_buffer 
	
	// Master Write template
	.control_done_from_the_master_write(control_done_write) ,				// output 	control_done_write
	.control_fixed_location_to_the_master_write(0) ,						// input 	0
	.control_go_to_the_master_write(control_go_write) ,						// input 	control_go_write
	.control_write_base_to_the_master_write(control_write_base) ,			// input 	[29:0] control_write_base
	.control_write_length_to_the_master_write(control_write_length) ,		// input 	[29:0] control_write_length
	.user_buffer_full_from_the_master_write(user_buffer_full) ,				// output 	user_buffer_full 
	.user_buffer_input_data_to_the_master_write(user_buffer_data_write) ,	// input 	[255:0] {224'b0, user_buffer_data_write}
	.user_write_buffer_to_the_master_write(user_write_buffer) ,				// input 	user_write_buffer
	
	// Flash Tristate Bridge Avalon Slave
	.flash_tristate_bridge_address(flash_address_bus) ,						// output 	[25:0] flash_address_bus
	.flash_tristate_bridge_data(FSM_D) ,									// inout 	[15:0] FSM_D
	.flash_tristate_bridge_readn(FLASH_OE_n) ,								// output  	FLASH_OE_n
	.flash_tristate_bridge_writen(FLASH_WE_n) ,								// output  	FLASH_WE_n
	.select_n_to_the_ext_flash(FLASH_CE_n) ,								// output  	FLASH_CE_n

	// Triple Speed Ethernet MAC
	.led_an_from_the_tse_mac(led_an_from_the_tse_mac) ,						// output  	led_an_from_the_tse_mac
	.led_char_err_from_the_tse_mac(led_char_err_from_the_tse_mac) ,			// output  	led_char_err_from_the_tse_mac
	.led_col_from_the_tse_mac(led_col_from_the_tse_mac) ,					// output  	led_col_from_the_tse_mac
	.led_crs_from_the_tse_mac(led_crs_from_the_tse_mac) ,					// output  	led_crs_from_the_tse_mac
	.led_disp_err_from_the_tse_mac(led_disp_err_from_the_tse_mac) ,			// output  	led_disp_err_from_the_tse_mac
	.led_link_from_the_tse_mac(led_link_from_the_tse_mac) ,					// output  	led_link_from_the_tse_mac
	.mdc_from_the_tse_mac(enet_mdc) ,										// output	enet_mdc
	.mdio_in_to_the_tse_mac(enet_mdio_in) ,									// input  	enet_mdio_in
	.mdio_oen_from_the_tse_mac(enet_mdio_oen) ,								// output  	enet_mdio_oen
	.mdio_out_from_the_tse_mac(enet_mdio_out) ,								// output  	enet_mdio_out
	.ref_clk_to_the_tse_mac(enet_refclk_125MHz) ,							// input  	enet_refclk_125MHz
	.rxp_to_the_tse_mac(lvds_rxp) ,											// input  	lvds_rxp
	.txp_from_the_tse_mac(lvds_txp) ,										// output  	lvds_txp
	
	// PIO pin to assert signal when a volume is transfered via TCP/IP
	.out_port_from_the_vol_transfer_done_pio(volTransferDone) ,				// output  	volTransferDone
	// PIO pin to receive signal when data recording to DDR2 is done
	.in_port_to_the_vol_recording_done_pio(volRecordingDone) ,				// input 	volRecordingDone
	
	// the_pb_pio
	.in_port_to_the_pb_pio(BUTTON),

	// the_sw_pio
	.in_port_to_the_sw_pio(SW),

	// the_seven_seg_pio
	.out_port_from_the_seven_seg_pio(),
	//.out_port_from_the_seven_seg_pio({SEG1_DP,SEG1_D[6:0],SEG0_DP,SEG0_D[6:0]}),

	// the_led_pio
	.out_port_from_the_led_pio()
	//.out_port_from_the_seven_seg_pio({SEG1_DP,SEG1_D[6:0],SEG0_DP,SEG0_D[6:0]}),
	);

//==============================================================================
// Optional modules
//==============================================================================

// External clock to sample the ADC
pll_150 pll_150_inst
(
	.inclk0(clk50MHz) ,							// input  clk50MHz
	.c0(clk150MHz) 								// output clk150MHz (actually 125 MHz)
);

// PLL dephasing ADA_DCO
//pll_DCO pll_DCO_inst
//(
//	.inclk0(ADA_DCO) ,							// input  ADA_DCO
//	.c0(clockVar) 								// output  clockVar
//);

// Fan Control
FAN_PWM FAN_PWM_inst (
	.clk( clk50MHz ) ,							// input  clk50MHz
	.PWM_input( 4'hC ) ,						// input [3:0] PWM = 4'hC
	.clk_div_out( clk_div_out_sig ) ,			// output [7:0] clk_div_out_sig
	.FAN( FAN_CTRL ) 							// output FAN_CTRL
	);

// Heartbeat with glowing LED
LED_glow LED_glow_inst (
	.clk( clk_div_out_sig[1] ) ,				// input  clk_div_out_sig[1]
	.LED( LED[7] ) 								// output LED_sig
	);

// Generate sinus wave in DAC B to test acquisition
sin400k_st sin400k_st_inst (
	.clk( clk50MHz ) ,							// input  clk50MHz 50 MHz clock
	.reset_n( global_reset_n ) ,				// input  global_reset_n
	.clken( 1'b1 ) ,							// input  1'b1
	.phi_inc_i( 32'd34359738 ) ,				// input [anglePrec-1:0] @50 MHz -> 
												// d34359738 for 400 kHz sinus,
	.fsin_o( raw_sine ) ,						// output [magnitudePrec-1:0] raw_sine
	.out_valid() 								// output  N.C.
	);

// Synchronize DAC B output (sinus wave) with system clock
always @(negedge global_reset_n or posedge clk50MHz)
begin
	if (!global_reset_n) begin
		o_sine		<= 14'd0;
	end
	else begin
		// Invert sign bit (MSB) to have offset binary
		o_sine		<= {~raw_sine[13],raw_sine[12:0]};
	end
end

endmodule 										// end of top module SS_OCT
//==============================================================================
// [EOF] SS_OCT.v