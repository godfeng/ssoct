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

clock_crossing_0_s1_arbitrator clock_crossing_0_s1_arbitrator_inst
(
	.clk(clk_sig) ,	// input  clk_sig
	.clock_crossing_0_s1_endofpacket(clock_crossing_0_s1_endofpacket_sig) ,	// input  clock_crossing_0_s1_endofpacket_sig
	.clock_crossing_0_s1_readdata(clock_crossing_0_s1_readdata_sig) ,	// input [255:0] clock_crossing_0_s1_readdata_sig
	.clock_crossing_0_s1_readdatavalid(clock_crossing_0_s1_readdatavalid_sig) ,	// input  clock_crossing_0_s1_readdatavalid_sig
	.clock_crossing_0_s1_waitrequest(clock_crossing_0_s1_waitrequest_sig) ,	// input  clock_crossing_0_s1_waitrequest_sig
	.master_read_avalon_master_address_to_slave(master_read_avalon_master_address_to_slave_sig) ,	// input [29:0] master_read_avalon_master_address_to_slave_sig
	.master_read_avalon_master_burstcount(master_read_avalon_master_burstcount_sig) ,	// input [3:0] master_read_avalon_master_burstcount_sig
	.master_read_avalon_master_read(master_read_avalon_master_read_sig) ,	// input  master_read_avalon_master_read_sig
	.master_read_latency_counter(master_read_latency_counter_sig) ,	// input  master_read_latency_counter_sig
	.master_write_avalon_master_address_to_slave(master_write_avalon_master_address_to_slave_sig) ,	// input [29:0] master_write_avalon_master_address_to_slave_sig
	.master_write_avalon_master_burstcount(master_write_avalon_master_burstcount_sig) ,	// input [3:0] master_write_avalon_master_burstcount_sig
	.master_write_avalon_master_byteenable(master_write_avalon_master_byteenable_sig) ,	// input [31:0] master_write_avalon_master_byteenable_sig
	.master_write_avalon_master_write(master_write_avalon_master_write_sig) ,	// input  master_write_avalon_master_write_sig
	.master_write_avalon_master_writedata(master_write_avalon_master_writedata_sig) ,	// input [255:0] master_write_avalon_master_writedata_sig
	.reset_n(reset_n_sig) ,	// input  reset_n_sig
	.clock_crossing_0_s1_address(clock_crossing_0_s1_address_sig) ,	// output [24:0] clock_crossing_0_s1_address_sig
	.clock_crossing_0_s1_burstcount(clock_crossing_0_s1_burstcount_sig) ,	// output [3:0] clock_crossing_0_s1_burstcount_sig
	.clock_crossing_0_s1_byteenable(clock_crossing_0_s1_byteenable_sig) ,	// output [31:0] clock_crossing_0_s1_byteenable_sig
	.clock_crossing_0_s1_endofpacket_from_sa(clock_crossing_0_s1_endofpacket_from_sa_sig) ,	// output  clock_crossing_0_s1_endofpacket_from_sa_sig
	.clock_crossing_0_s1_nativeaddress(clock_crossing_0_s1_nativeaddress_sig) ,	// output [24:0] clock_crossing_0_s1_nativeaddress_sig
	.clock_crossing_0_s1_read(clock_crossing_0_s1_read_sig) ,	// output  clock_crossing_0_s1_read_sig
	.clock_crossing_0_s1_readdata_from_sa(clock_crossing_0_s1_readdata_from_sa_sig) ,	// output [255:0] clock_crossing_0_s1_readdata_from_sa_sig
	.clock_crossing_0_s1_reset_n(clock_crossing_0_s1_reset_n_sig) ,	// output  clock_crossing_0_s1_reset_n_sig
	.clock_crossing_0_s1_waitrequest_from_sa(clock_crossing_0_s1_waitrequest_from_sa_sig) ,	// output  clock_crossing_0_s1_waitrequest_from_sa_sig
	.clock_crossing_0_s1_write(clock_crossing_0_s1_write_sig) ,	// output  clock_crossing_0_s1_write_sig
	.clock_crossing_0_s1_writedata(clock_crossing_0_s1_writedata_sig) ,	// output [255:0] clock_crossing_0_s1_writedata_sig
	.d1_clock_crossing_0_s1_end_xfer(d1_clock_crossing_0_s1_end_xfer_sig) ,	// output  d1_clock_crossing_0_s1_end_xfer_sig
	.master_read_granted_clock_crossing_0_s1(master_read_granted_clock_crossing_0_s1_sig) ,	// output  master_read_granted_clock_crossing_0_s1_sig
	.master_read_qualified_request_clock_crossing_0_s1(master_read_qualified_request_clock_crossing_0_s1_sig) ,	// output  master_read_qualified_request_clock_crossing_0_s1_sig
	.master_read_read_data_valid_clock_crossing_0_s1(master_read_read_data_valid_clock_crossing_0_s1_sig) ,	// output  master_read_read_data_valid_clock_crossing_0_s1_sig
	.master_read_read_data_valid_clock_crossing_0_s1_shift_register(master_read_read_data_valid_clock_crossing_0_s1_shift_register_sig) ,	// output  master_read_read_data_valid_clock_crossing_0_s1_shift_register_sig
	.master_read_requests_clock_crossing_0_s1(master_read_requests_clock_crossing_0_s1_sig) ,	// output  master_read_requests_clock_crossing_0_s1_sig
	.master_write_granted_clock_crossing_0_s1(master_write_granted_clock_crossing_0_s1_sig) ,	// output  master_write_granted_clock_crossing_0_s1_sig
	.master_write_qualified_request_clock_crossing_0_s1(master_write_qualified_request_clock_crossing_0_s1_sig) ,	// output  master_write_qualified_request_clock_crossing_0_s1_sig
	.master_write_requests_clock_crossing_0_s1(master_write_requests_clock_crossing_0_s1_sig) 	// output  master_write_requests_clock_crossing_0_s1_sig
);

