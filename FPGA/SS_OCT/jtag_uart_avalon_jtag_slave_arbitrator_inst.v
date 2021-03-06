// Copyright (C) 1991-2010 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.


// Generated by Quartus II 64-Bit Version 9.1 (Build Build 350 03/24/2010)
// Created on Tue Jan 24 17:36:51 2012

jtag_uart_avalon_jtag_slave_arbitrator jtag_uart_avalon_jtag_slave_arbitrator_inst
(
	.SS_OCT_SOPC_clock_1_out_address_to_slave(SS_OCT_SOPC_clock_1_out_address_to_slave_sig) ,	// input [2:0] SS_OCT_SOPC_clock_1_out_address_to_slave_sig
	.SS_OCT_SOPC_clock_1_out_nativeaddress(SS_OCT_SOPC_clock_1_out_nativeaddress_sig) ,	// input  SS_OCT_SOPC_clock_1_out_nativeaddress_sig
	.SS_OCT_SOPC_clock_1_out_read(SS_OCT_SOPC_clock_1_out_read_sig) ,	// input  SS_OCT_SOPC_clock_1_out_read_sig
	.SS_OCT_SOPC_clock_1_out_write(SS_OCT_SOPC_clock_1_out_write_sig) ,	// input  SS_OCT_SOPC_clock_1_out_write_sig
	.SS_OCT_SOPC_clock_1_out_writedata(SS_OCT_SOPC_clock_1_out_writedata_sig) ,	// input [31:0] SS_OCT_SOPC_clock_1_out_writedata_sig
	.clk(clk_sig) ,	// input  clk_sig
	.jtag_uart_avalon_jtag_slave_dataavailable(jtag_uart_avalon_jtag_slave_dataavailable_sig) ,	// input  jtag_uart_avalon_jtag_slave_dataavailable_sig
	.jtag_uart_avalon_jtag_slave_irq(jtag_uart_avalon_jtag_slave_irq_sig) ,	// input  jtag_uart_avalon_jtag_slave_irq_sig
	.jtag_uart_avalon_jtag_slave_readdata(jtag_uart_avalon_jtag_slave_readdata_sig) ,	// input [31:0] jtag_uart_avalon_jtag_slave_readdata_sig
	.jtag_uart_avalon_jtag_slave_readyfordata(jtag_uart_avalon_jtag_slave_readyfordata_sig) ,	// input  jtag_uart_avalon_jtag_slave_readyfordata_sig
	.jtag_uart_avalon_jtag_slave_waitrequest(jtag_uart_avalon_jtag_slave_waitrequest_sig) ,	// input  jtag_uart_avalon_jtag_slave_waitrequest_sig
	.reset_n(reset_n_sig) ,	// input  reset_n_sig
	.SS_OCT_SOPC_clock_1_out_granted_jtag_uart_avalon_jtag_slave(SS_OCT_SOPC_clock_1_out_granted_jtag_uart_avalon_jtag_slave_sig) ,	// output  SS_OCT_SOPC_clock_1_out_granted_jtag_uart_avalon_jtag_slave_sig
	.SS_OCT_SOPC_clock_1_out_qualified_request_jtag_uart_avalon_jtag_slave(SS_OCT_SOPC_clock_1_out_qualified_request_jtag_uart_avalon_jtag_slave_sig) ,	// output  SS_OCT_SOPC_clock_1_out_qualified_request_jtag_uart_avalon_jtag_slave_sig
	.SS_OCT_SOPC_clock_1_out_read_data_valid_jtag_uart_avalon_jtag_slave(SS_OCT_SOPC_clock_1_out_read_data_valid_jtag_uart_avalon_jtag_slave_sig) ,	// output  SS_OCT_SOPC_clock_1_out_read_data_valid_jtag_uart_avalon_jtag_slave_sig
	.SS_OCT_SOPC_clock_1_out_requests_jtag_uart_avalon_jtag_slave(SS_OCT_SOPC_clock_1_out_requests_jtag_uart_avalon_jtag_slave_sig) ,	// output  SS_OCT_SOPC_clock_1_out_requests_jtag_uart_avalon_jtag_slave_sig
	.d1_jtag_uart_avalon_jtag_slave_end_xfer(d1_jtag_uart_avalon_jtag_slave_end_xfer_sig) ,	// output  d1_jtag_uart_avalon_jtag_slave_end_xfer_sig
	.jtag_uart_avalon_jtag_slave_address(jtag_uart_avalon_jtag_slave_address_sig) ,	// output  jtag_uart_avalon_jtag_slave_address_sig
	.jtag_uart_avalon_jtag_slave_chipselect(jtag_uart_avalon_jtag_slave_chipselect_sig) ,	// output  jtag_uart_avalon_jtag_slave_chipselect_sig
	.jtag_uart_avalon_jtag_slave_dataavailable_from_sa(jtag_uart_avalon_jtag_slave_dataavailable_from_sa_sig) ,	// output  jtag_uart_avalon_jtag_slave_dataavailable_from_sa_sig
	.jtag_uart_avalon_jtag_slave_irq_from_sa(jtag_uart_avalon_jtag_slave_irq_from_sa_sig) ,	// output  jtag_uart_avalon_jtag_slave_irq_from_sa_sig
	.jtag_uart_avalon_jtag_slave_read_n(jtag_uart_avalon_jtag_slave_read_n_sig) ,	// output  jtag_uart_avalon_jtag_slave_read_n_sig
	.jtag_uart_avalon_jtag_slave_readdata_from_sa(jtag_uart_avalon_jtag_slave_readdata_from_sa_sig) ,	// output [31:0] jtag_uart_avalon_jtag_slave_readdata_from_sa_sig
	.jtag_uart_avalon_jtag_slave_readyfordata_from_sa(jtag_uart_avalon_jtag_slave_readyfordata_from_sa_sig) ,	// output  jtag_uart_avalon_jtag_slave_readyfordata_from_sa_sig
	.jtag_uart_avalon_jtag_slave_reset_n(jtag_uart_avalon_jtag_slave_reset_n_sig) ,	// output  jtag_uart_avalon_jtag_slave_reset_n_sig
	.jtag_uart_avalon_jtag_slave_waitrequest_from_sa(jtag_uart_avalon_jtag_slave_waitrequest_from_sa_sig) ,	// output  jtag_uart_avalon_jtag_slave_waitrequest_from_sa_sig
	.jtag_uart_avalon_jtag_slave_write_n(jtag_uart_avalon_jtag_slave_write_n_sig) ,	// output  jtag_uart_avalon_jtag_slave_write_n_sig
	.jtag_uart_avalon_jtag_slave_writedata(jtag_uart_avalon_jtag_slave_writedata_sig) 	// output [31:0] jtag_uart_avalon_jtag_slave_writedata_sig
);

