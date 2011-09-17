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

sgdma_rx_m_write_arbitrator sgdma_rx_m_write_arbitrator_inst
(
	.clk(clk_sig) ,	// input  clk_sig
	.d1_onchip_memory_s1_end_xfer(d1_onchip_memory_s1_end_xfer_sig) ,	// input  d1_onchip_memory_s1_end_xfer_sig
	.reset_n(reset_n_sig) ,	// input  reset_n_sig
	.sgdma_rx_m_write_address(sgdma_rx_m_write_address_sig) ,	// input [31:0] sgdma_rx_m_write_address_sig
	.sgdma_rx_m_write_byteenable(sgdma_rx_m_write_byteenable_sig) ,	// input [3:0] sgdma_rx_m_write_byteenable_sig
	.sgdma_rx_m_write_granted_onchip_memory_s1(sgdma_rx_m_write_granted_onchip_memory_s1_sig) ,	// input  sgdma_rx_m_write_granted_onchip_memory_s1_sig
	.sgdma_rx_m_write_qualified_request_onchip_memory_s1(sgdma_rx_m_write_qualified_request_onchip_memory_s1_sig) ,	// input  sgdma_rx_m_write_qualified_request_onchip_memory_s1_sig
	.sgdma_rx_m_write_requests_onchip_memory_s1(sgdma_rx_m_write_requests_onchip_memory_s1_sig) ,	// input  sgdma_rx_m_write_requests_onchip_memory_s1_sig
	.sgdma_rx_m_write_write(sgdma_rx_m_write_write_sig) ,	// input  sgdma_rx_m_write_write_sig
	.sgdma_rx_m_write_writedata(sgdma_rx_m_write_writedata_sig) ,	// input [31:0] sgdma_rx_m_write_writedata_sig
	.sgdma_rx_m_write_address_to_slave(sgdma_rx_m_write_address_to_slave_sig) ,	// output [31:0] sgdma_rx_m_write_address_to_slave_sig
	.sgdma_rx_m_write_waitrequest(sgdma_rx_m_write_waitrequest_sig) 	// output  sgdma_rx_m_write_waitrequest_sig
);

