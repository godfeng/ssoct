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


`define NET0
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
	SSRAM_WE_n 
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


//=======================================================
//  REG/WIRE declarations
//=======================================================

wire						global_reset_n;
wire						enet_reset_n;

//// Ethernet
wire						enet_mdc;
wire						enet_mdio_in;
wire						enet_mdio_oen;
wire						enet_mdio_out;
wire						enet_refclk_125MHz;

wire						lvds_rxp;
wire						lvds_txp;


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
assign clk1_set_wr = 4'd4; //100 MHZ
assign clk2_set_wr = 4'd4; //100 MHZ
assign clk3_set_wr = 4'd4; //100 MHZ

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


//// Fan Control
assign	FAN_CTRL	= 1'bz;	// don't control


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

DE4_SOPC	SOPC_INST (
				// 1) global signals:
				.ext_clk(OSC_50_BANK6),
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
				.out_port_from_the_led_pio({dummy_LED,LED[6:0]})
                );

///////////////////////////////////////////////////////////////////////////////
assign	LED[7] = count[21];
reg	[31:0]		count;
always @ (negedge global_reset_n or posedge OSC_50_BANK3)
begin
	if (!global_reset_n) begin
		count	<= 0;
	end
	else begin
		count	<= count + 1;
	end
end

///////////////////////////////////////////////////////////////////////////////

endmodule
