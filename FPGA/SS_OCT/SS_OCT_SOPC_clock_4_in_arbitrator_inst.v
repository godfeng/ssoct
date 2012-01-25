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

SS_OCT_SOPC_clock_4_in_arbitrator SS_OCT_SOPC_clock_4_in_arbitrator_inst
(
	.SS_OCT_SOPC_clock_4_in_endofpacket(SS_OCT_SOPC_clock_4_in_endofpacket_sig) ,	// input  SS_OCT_SOPC_clock_4_in_endofpacket_sig
	.SS_OCT_SOPC_clock_4_in_readdata(SS_OCT_SOPC_clock_4_in_readdata_sig) ,	// input [7:0] SS_OCT_SOPC_clock_4_in_readdata_sig
	.SS_OCT_SOPC_clock_4_in_waitrequest(SS_OCT_SOPC_clock_4_in_waitrequest_sig) ,	// input  SS_OCT_SOPC_clock_4_in_waitrequest_sig
	.clk(clk_sig) ,	// input  clk_sig
	.peripheral_clock_crossing_m1_address_to_slave(peripheral_clock_crossing_m1_address_to_slave_sig) ,	// input [9:0] peripheral_clock_crossing_m1_address_to_slave_sig
	.peripheral_clock_crossing_m1_byteenable(peripheral_clock_crossing_m1_byteenable_sig) ,	// input [3:0] peripheral_clock_crossing_m1_byteenable_sig
	.peripheral_clock_crossing_m1_latency_counter(peripheral_clock_crossing_m1_latency_counter_sig) ,	// input  peripheral_clock_crossing_m1_latency_counter_sig
	.peripheral_clock_crossing_m1_nativeaddress(peripheral_clock_crossing_m1_nativeaddress_sig) ,	// input [7:0] peripheral_clock_crossing_m1_nativeaddress_sig
	.peripheral_clock_crossing_m1_read(peripheral_clock_crossing_m1_read_sig) ,	// input  peripheral_clock_crossing_m1_read_sig
	.peripheral_clock_crossing_m1_write(peripheral_clock_crossing_m1_write_sig) ,	// input  peripheral_clock_crossing_m1_write_sig
	.peripheral_clock_crossing_m1_writedata(peripheral_clock_crossing_m1_writedata_sig) ,	// input [31:0] peripheral_clock_crossing_m1_writedata_sig
	.reset_n(reset_n_sig) ,	// input  reset_n_sig
	.SS_OCT_SOPC_clock_4_in_address(SS_OCT_SOPC_clock_4_in_address_sig) ,	// output [1:0] SS_OCT_SOPC_clock_4_in_address_sig
	.SS_OCT_SOPC_clock_4_in_endofpacket_from_sa(SS_OCT_SOPC_clock_4_in_endofpacket_from_sa_sig) ,	// output  SS_OCT_SOPC_clock_4_in_endofpacket_from_sa_sig
	.SS_OCT_SOPC_clock_4_in_nativeaddress(SS_OCT_SOPC_clock_4_in_nativeaddress_sig) ,	// output [1:0] SS_OCT_SOPC_clock_4_in_nativeaddress_sig
	.SS_OCT_SOPC_clock_4_in_read(SS_OCT_SOPC_clock_4_in_read_sig) ,	// output  SS_OCT_SOPC_clock_4_in_read_sig
	.SS_OCT_SOPC_clock_4_in_readdata_from_sa(SS_OCT_SOPC_clock_4_in_readdata_from_sa_sig) ,	// output [7:0] SS_OCT_SOPC_clock_4_in_readdata_from_sa_sig
	.SS_OCT_SOPC_clock_4_in_reset_n(SS_OCT_SOPC_clock_4_in_reset_n_sig) ,	// output  SS_OCT_SOPC_clock_4_in_reset_n_sig
	.SS_OCT_SOPC_clock_4_in_waitrequest_from_sa(SS_OCT_SOPC_clock_4_in_waitrequest_from_sa_sig) ,	// output  SS_OCT_SOPC_clock_4_in_waitrequest_from_sa_sig
	.SS_OCT_SOPC_clock_4_in_write(SS_OCT_SOPC_clock_4_in_write_sig) ,	// output  SS_OCT_SOPC_clock_4_in_write_sig
	.SS_OCT_SOPC_clock_4_in_writedata(SS_OCT_SOPC_clock_4_in_writedata_sig) ,	// output [7:0] SS_OCT_SOPC_clock_4_in_writedata_sig
	.d1_SS_OCT_SOPC_clock_4_in_end_xfer(d1_SS_OCT_SOPC_clock_4_in_end_xfer_sig) ,	// output  d1_SS_OCT_SOPC_clock_4_in_end_xfer_sig
	.peripheral_clock_crossing_m1_granted_SS_OCT_SOPC_clock_4_in(peripheral_clock_crossing_m1_granted_SS_OCT_SOPC_clock_4_in_sig) ,	// output  peripheral_clock_crossing_m1_granted_SS_OCT_SOPC_clock_4_in_sig
	.peripheral_clock_crossing_m1_qualified_request_SS_OCT_SOPC_clock_4_in(peripheral_clock_crossing_m1_qualified_request_SS_OCT_SOPC_clock_4_in_sig) ,	// output  peripheral_clock_crossing_m1_qualified_request_SS_OCT_SOPC_clock_4_in_sig
	.peripheral_clock_crossing_m1_read_data_valid_SS_OCT_SOPC_clock_4_in(peripheral_clock_crossing_m1_read_data_valid_SS_OCT_SOPC_clock_4_in_sig) ,	// output  peripheral_clock_crossing_m1_read_data_valid_SS_OCT_SOPC_clock_4_in_sig
	.peripheral_clock_crossing_m1_requests_SS_OCT_SOPC_clock_4_in(peripheral_clock_crossing_m1_requests_SS_OCT_SOPC_clock_4_in_sig) 	// output  peripheral_clock_crossing_m1_requests_SS_OCT_SOPC_clock_4_in_sig
);

