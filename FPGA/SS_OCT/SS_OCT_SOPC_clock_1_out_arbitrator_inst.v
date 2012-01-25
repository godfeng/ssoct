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

SS_OCT_SOPC_clock_1_out_arbitrator SS_OCT_SOPC_clock_1_out_arbitrator_inst
(
	.SS_OCT_SOPC_clock_1_out_address(SS_OCT_SOPC_clock_1_out_address_sig) ,	// input [2:0] SS_OCT_SOPC_clock_1_out_address_sig
	.SS_OCT_SOPC_clock_1_out_byteenable(SS_OCT_SOPC_clock_1_out_byteenable_sig) ,	// input [3:0] SS_OCT_SOPC_clock_1_out_byteenable_sig
	.SS_OCT_SOPC_clock_1_out_granted_jtag_uart_avalon_jtag_slave(SS_OCT_SOPC_clock_1_out_granted_jtag_uart_avalon_jtag_slave_sig) ,	// input  SS_OCT_SOPC_clock_1_out_granted_jtag_uart_avalon_jtag_slave_sig
	.SS_OCT_SOPC_clock_1_out_qualified_request_jtag_uart_avalon_jtag_slave(SS_OCT_SOPC_clock_1_out_qualified_request_jtag_uart_avalon_jtag_slave_sig) ,	// input  SS_OCT_SOPC_clock_1_out_qualified_request_jtag_uart_avalon_jtag_slave_sig
	.SS_OCT_SOPC_clock_1_out_read(SS_OCT_SOPC_clock_1_out_read_sig) ,	// input  SS_OCT_SOPC_clock_1_out_read_sig
	.SS_OCT_SOPC_clock_1_out_read_data_valid_jtag_uart_avalon_jtag_slave(SS_OCT_SOPC_clock_1_out_read_data_valid_jtag_uart_avalon_jtag_slave_sig) ,	// input  SS_OCT_SOPC_clock_1_out_read_data_valid_jtag_uart_avalon_jtag_slave_sig
	.SS_OCT_SOPC_clock_1_out_requests_jtag_uart_avalon_jtag_slave(SS_OCT_SOPC_clock_1_out_requests_jtag_uart_avalon_jtag_slave_sig) ,	// input  SS_OCT_SOPC_clock_1_out_requests_jtag_uart_avalon_jtag_slave_sig
	.SS_OCT_SOPC_clock_1_out_write(SS_OCT_SOPC_clock_1_out_write_sig) ,	// input  SS_OCT_SOPC_clock_1_out_write_sig
	.SS_OCT_SOPC_clock_1_out_writedata(SS_OCT_SOPC_clock_1_out_writedata_sig) ,	// input [31:0] SS_OCT_SOPC_clock_1_out_writedata_sig
	.clk(clk_sig) ,	// input  clk_sig
	.d1_jtag_uart_avalon_jtag_slave_end_xfer(d1_jtag_uart_avalon_jtag_slave_end_xfer_sig) ,	// input  d1_jtag_uart_avalon_jtag_slave_end_xfer_sig
	.jtag_uart_avalon_jtag_slave_readdata_from_sa(jtag_uart_avalon_jtag_slave_readdata_from_sa_sig) ,	// input [31:0] jtag_uart_avalon_jtag_slave_readdata_from_sa_sig
	.jtag_uart_avalon_jtag_slave_waitrequest_from_sa(jtag_uart_avalon_jtag_slave_waitrequest_from_sa_sig) ,	// input  jtag_uart_avalon_jtag_slave_waitrequest_from_sa_sig
	.reset_n(reset_n_sig) ,	// input  reset_n_sig
	.SS_OCT_SOPC_clock_1_out_address_to_slave(SS_OCT_SOPC_clock_1_out_address_to_slave_sig) ,	// output [2:0] SS_OCT_SOPC_clock_1_out_address_to_slave_sig
	.SS_OCT_SOPC_clock_1_out_readdata(SS_OCT_SOPC_clock_1_out_readdata_sig) ,	// output [31:0] SS_OCT_SOPC_clock_1_out_readdata_sig
	.SS_OCT_SOPC_clock_1_out_reset_n(SS_OCT_SOPC_clock_1_out_reset_n_sig) ,	// output  SS_OCT_SOPC_clock_1_out_reset_n_sig
	.SS_OCT_SOPC_clock_1_out_waitrequest(SS_OCT_SOPC_clock_1_out_waitrequest_sig) 	// output  SS_OCT_SOPC_clock_1_out_waitrequest_sig
);

