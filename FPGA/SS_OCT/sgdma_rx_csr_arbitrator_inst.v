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

sgdma_rx_csr_arbitrator sgdma_rx_csr_arbitrator_inst
(
	.clk(clk_sig) ,	// input  clk_sig
	.cpu_data_master_address_to_slave(cpu_data_master_address_to_slave_sig) ,	// input [30:0] cpu_data_master_address_to_slave_sig
	.cpu_data_master_latency_counter(cpu_data_master_latency_counter_sig) ,	// input [1:0] cpu_data_master_latency_counter_sig
	.cpu_data_master_read(cpu_data_master_read_sig) ,	// input  cpu_data_master_read_sig
	.cpu_data_master_read_data_valid_peripheral_clock_crossing_s1_shift_register(cpu_data_master_read_data_valid_peripheral_clock_crossing_s1_shift_register_sig) ,	// input  cpu_data_master_read_data_valid_peripheral_clock_crossing_s1_shift_register_sig
	.cpu_data_master_write(cpu_data_master_write_sig) ,	// input  cpu_data_master_write_sig
	.cpu_data_master_writedata(cpu_data_master_writedata_sig) ,	// input [31:0] cpu_data_master_writedata_sig
	.reset_n(reset_n_sig) ,	// input  reset_n_sig
	.sgdma_rx_csr_irq(sgdma_rx_csr_irq_sig) ,	// input  sgdma_rx_csr_irq_sig
	.sgdma_rx_csr_readdata(sgdma_rx_csr_readdata_sig) ,	// input [31:0] sgdma_rx_csr_readdata_sig
	.cpu_data_master_granted_sgdma_rx_csr(cpu_data_master_granted_sgdma_rx_csr_sig) ,	// output  cpu_data_master_granted_sgdma_rx_csr_sig
	.cpu_data_master_qualified_request_sgdma_rx_csr(cpu_data_master_qualified_request_sgdma_rx_csr_sig) ,	// output  cpu_data_master_qualified_request_sgdma_rx_csr_sig
	.cpu_data_master_read_data_valid_sgdma_rx_csr(cpu_data_master_read_data_valid_sgdma_rx_csr_sig) ,	// output  cpu_data_master_read_data_valid_sgdma_rx_csr_sig
	.cpu_data_master_requests_sgdma_rx_csr(cpu_data_master_requests_sgdma_rx_csr_sig) ,	// output  cpu_data_master_requests_sgdma_rx_csr_sig
	.d1_sgdma_rx_csr_end_xfer(d1_sgdma_rx_csr_end_xfer_sig) ,	// output  d1_sgdma_rx_csr_end_xfer_sig
	.sgdma_rx_csr_address(sgdma_rx_csr_address_sig) ,	// output [3:0] sgdma_rx_csr_address_sig
	.sgdma_rx_csr_chipselect(sgdma_rx_csr_chipselect_sig) ,	// output  sgdma_rx_csr_chipselect_sig
	.sgdma_rx_csr_irq_from_sa(sgdma_rx_csr_irq_from_sa_sig) ,	// output  sgdma_rx_csr_irq_from_sa_sig
	.sgdma_rx_csr_read(sgdma_rx_csr_read_sig) ,	// output  sgdma_rx_csr_read_sig
	.sgdma_rx_csr_readdata_from_sa(sgdma_rx_csr_readdata_from_sa_sig) ,	// output [31:0] sgdma_rx_csr_readdata_from_sa_sig
	.sgdma_rx_csr_reset_n(sgdma_rx_csr_reset_n_sig) ,	// output  sgdma_rx_csr_reset_n_sig
	.sgdma_rx_csr_write(sgdma_rx_csr_write_sig) ,	// output  sgdma_rx_csr_write_sig
	.sgdma_rx_csr_writedata(sgdma_rx_csr_writedata_sig) 	// output [31:0] sgdma_rx_csr_writedata_sig
);

