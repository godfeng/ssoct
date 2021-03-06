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

seven_seg_pio_s1_arbitrator seven_seg_pio_s1_arbitrator_inst
(
	.SS_OCT_SOPC_clock_7_out_address_to_slave(SS_OCT_SOPC_clock_7_out_address_to_slave_sig) ,	// input [2:0] SS_OCT_SOPC_clock_7_out_address_to_slave_sig
	.SS_OCT_SOPC_clock_7_out_nativeaddress(SS_OCT_SOPC_clock_7_out_nativeaddress_sig) ,	// input [1:0] SS_OCT_SOPC_clock_7_out_nativeaddress_sig
	.SS_OCT_SOPC_clock_7_out_read(SS_OCT_SOPC_clock_7_out_read_sig) ,	// input  SS_OCT_SOPC_clock_7_out_read_sig
	.SS_OCT_SOPC_clock_7_out_write(SS_OCT_SOPC_clock_7_out_write_sig) ,	// input  SS_OCT_SOPC_clock_7_out_write_sig
	.SS_OCT_SOPC_clock_7_out_writedata(SS_OCT_SOPC_clock_7_out_writedata_sig) ,	// input [15:0] SS_OCT_SOPC_clock_7_out_writedata_sig
	.clk(clk_sig) ,	// input  clk_sig
	.reset_n(reset_n_sig) ,	// input  reset_n_sig
	.seven_seg_pio_s1_readdata(seven_seg_pio_s1_readdata_sig) ,	// input [15:0] seven_seg_pio_s1_readdata_sig
	.SS_OCT_SOPC_clock_7_out_granted_seven_seg_pio_s1(SS_OCT_SOPC_clock_7_out_granted_seven_seg_pio_s1_sig) ,	// output  SS_OCT_SOPC_clock_7_out_granted_seven_seg_pio_s1_sig
	.SS_OCT_SOPC_clock_7_out_qualified_request_seven_seg_pio_s1(SS_OCT_SOPC_clock_7_out_qualified_request_seven_seg_pio_s1_sig) ,	// output  SS_OCT_SOPC_clock_7_out_qualified_request_seven_seg_pio_s1_sig
	.SS_OCT_SOPC_clock_7_out_read_data_valid_seven_seg_pio_s1(SS_OCT_SOPC_clock_7_out_read_data_valid_seven_seg_pio_s1_sig) ,	// output  SS_OCT_SOPC_clock_7_out_read_data_valid_seven_seg_pio_s1_sig
	.SS_OCT_SOPC_clock_7_out_requests_seven_seg_pio_s1(SS_OCT_SOPC_clock_7_out_requests_seven_seg_pio_s1_sig) ,	// output  SS_OCT_SOPC_clock_7_out_requests_seven_seg_pio_s1_sig
	.d1_seven_seg_pio_s1_end_xfer(d1_seven_seg_pio_s1_end_xfer_sig) ,	// output  d1_seven_seg_pio_s1_end_xfer_sig
	.seven_seg_pio_s1_address(seven_seg_pio_s1_address_sig) ,	// output [1:0] seven_seg_pio_s1_address_sig
	.seven_seg_pio_s1_chipselect(seven_seg_pio_s1_chipselect_sig) ,	// output  seven_seg_pio_s1_chipselect_sig
	.seven_seg_pio_s1_readdata_from_sa(seven_seg_pio_s1_readdata_from_sa_sig) ,	// output [15:0] seven_seg_pio_s1_readdata_from_sa_sig
	.seven_seg_pio_s1_reset_n(seven_seg_pio_s1_reset_n_sig) ,	// output  seven_seg_pio_s1_reset_n_sig
	.seven_seg_pio_s1_write_n(seven_seg_pio_s1_write_n_sig) ,	// output  seven_seg_pio_s1_write_n_sig
	.seven_seg_pio_s1_writedata(seven_seg_pio_s1_writedata_sig) 	// output [15:0] seven_seg_pio_s1_writedata_sig
);

