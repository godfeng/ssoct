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

tse_mac_receive_arbitrator tse_mac_receive_arbitrator_inst
(
	.clk(clk_sig) ,	// input  clk_sig
	.reset_n(reset_n_sig) ,	// input  reset_n_sig
	.sgdma_rx_in_ready_from_sa(sgdma_rx_in_ready_from_sa_sig) ,	// input  sgdma_rx_in_ready_from_sa_sig
	.tse_mac_receive_data(tse_mac_receive_data_sig) ,	// input [31:0] tse_mac_receive_data_sig
	.tse_mac_receive_empty(tse_mac_receive_empty_sig) ,	// input [1:0] tse_mac_receive_empty_sig
	.tse_mac_receive_endofpacket(tse_mac_receive_endofpacket_sig) ,	// input  tse_mac_receive_endofpacket_sig
	.tse_mac_receive_error(tse_mac_receive_error_sig) ,	// input [5:0] tse_mac_receive_error_sig
	.tse_mac_receive_startofpacket(tse_mac_receive_startofpacket_sig) ,	// input  tse_mac_receive_startofpacket_sig
	.tse_mac_receive_valid(tse_mac_receive_valid_sig) ,	// input  tse_mac_receive_valid_sig
	.tse_mac_receive_ready(tse_mac_receive_ready_sig) 	// output  tse_mac_receive_ready_sig
);

