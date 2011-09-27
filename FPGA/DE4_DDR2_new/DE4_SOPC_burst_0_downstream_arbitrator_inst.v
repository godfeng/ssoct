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
// Created on Sat Sep 17 16:58:33 2011

DE4_SOPC_burst_0_downstream_arbitrator DE4_SOPC_burst_0_downstream_arbitrator_inst
(
	.DE4_SOPC_burst_0_downstream_address(DE4_SOPC_burst_0_downstream_address_sig) ,	// input [29:0] DE4_SOPC_burst_0_downstream_address_sig
	.DE4_SOPC_burst_0_downstream_burstcount(DE4_SOPC_burst_0_downstream_burstcount_sig) ,	// input [2:0] DE4_SOPC_burst_0_downstream_burstcount_sig
	.DE4_SOPC_burst_0_downstream_byteenable(DE4_SOPC_burst_0_downstream_byteenable_sig) ,	// input [31:0] DE4_SOPC_burst_0_downstream_byteenable_sig
	.DE4_SOPC_burst_0_downstream_granted_ddr2_s1(DE4_SOPC_burst_0_downstream_granted_ddr2_s1_sig) ,	// input  DE4_SOPC_burst_0_downstream_granted_ddr2_s1_sig
	.DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1(DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1_sig) ,	// input  DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1_sig
	.DE4_SOPC_burst_0_downstream_read(DE4_SOPC_burst_0_downstream_read_sig) ,	// input  DE4_SOPC_burst_0_downstream_read_sig
	.DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1(DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1_sig) ,	// input  DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1_sig
	.DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1_shift_register(DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1_shift_register_sig) ,	// input  DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1_shift_register_sig
	.DE4_SOPC_burst_0_downstream_requests_ddr2_s1(DE4_SOPC_burst_0_downstream_requests_ddr2_s1_sig) ,	// input  DE4_SOPC_burst_0_downstream_requests_ddr2_s1_sig
	.DE4_SOPC_burst_0_downstream_write(DE4_SOPC_burst_0_downstream_write_sig) ,	// input  DE4_SOPC_burst_0_downstream_write_sig
	.DE4_SOPC_burst_0_downstream_writedata(DE4_SOPC_burst_0_downstream_writedata_sig) ,	// input [255:0] DE4_SOPC_burst_0_downstream_writedata_sig
	.clk(clk_sig) ,	// input  clk_sig
	.d1_ddr2_s1_end_xfer(d1_ddr2_s1_end_xfer_sig) ,	// input  d1_ddr2_s1_end_xfer_sig
	.ddr2_s1_readdata_from_sa(ddr2_s1_readdata_from_sa_sig) ,	// input [255:0] ddr2_s1_readdata_from_sa_sig
	.ddr2_s1_waitrequest_n_from_sa(ddr2_s1_waitrequest_n_from_sa_sig) ,	// input  ddr2_s1_waitrequest_n_from_sa_sig
	.reset_n(reset_n_sig) ,	// input  reset_n_sig
	.DE4_SOPC_burst_0_downstream_address_to_slave(DE4_SOPC_burst_0_downstream_address_to_slave_sig) ,	// output [29:0] DE4_SOPC_burst_0_downstream_address_to_slave_sig
	.DE4_SOPC_burst_0_downstream_latency_counter(DE4_SOPC_burst_0_downstream_latency_counter_sig) ,	// output  DE4_SOPC_burst_0_downstream_latency_counter_sig
	.DE4_SOPC_burst_0_downstream_readdata(DE4_SOPC_burst_0_downstream_readdata_sig) ,	// output [255:0] DE4_SOPC_burst_0_downstream_readdata_sig
	.DE4_SOPC_burst_0_downstream_readdatavalid(DE4_SOPC_burst_0_downstream_readdatavalid_sig) ,	// output  DE4_SOPC_burst_0_downstream_readdatavalid_sig
	.DE4_SOPC_burst_0_downstream_reset_n(DE4_SOPC_burst_0_downstream_reset_n_sig) ,	// output  DE4_SOPC_burst_0_downstream_reset_n_sig
	.DE4_SOPC_burst_0_downstream_waitrequest(DE4_SOPC_burst_0_downstream_waitrequest_sig) 	// output  DE4_SOPC_burst_0_downstream_waitrequest_sig
);
