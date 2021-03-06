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
// Created on Fri Sep 16 16:42:16 2011

RAMtoDDR2 RAMtoDDR2_inst
(
	.RSTn(RSTn_sig) ,	// input  RSTn_sig
	.CLK50MHZ(CLK50MHZ_sig) ,	// input  CLK50MHZ_sig
	.control_go(control_go_sig) ,	// output  control_go_sig
	.control_write_base(control_write_base_sig) ,	// output [address_width-1:0] control_write_base_sig
	.control_write_length(control_write_length_sig) ,	// output [address_width-1:0] control_write_length_sig
	.control_done(control_done_sig) ,	// input  control_done_sig
	.user_buffer_data(user_buffer_data_sig) ,	// output [255:0] user_buffer_data_sig
	.user_buffer_full(user_buffer_full_sig) ,	// input  user_buffer_full_sig
	.user_write_buffer(user_write_buffer_sig) ,	// output  user_write_buffer_sig
	.RAM_dataOut(RAM_dataOut_sig) ,	// input [255:0] RAM_dataOut_sig
	.RAM_readAddress(RAM_readAddress_sig) ,	// output [6:0] RAM_readAddress_sig
	.acq_done(acq_done_sig) ,	// input  acq_done_sig
	.stateLED(stateLED_sig) 	// output [6:0] stateLED_sig
);

defparam RAMtoDDR2_inst.ADDRESS_WIDTH = 30;
defparam RAMtoDDR2_inst.ADDRESS_TOTAL = 1073741824;
defparam RAMtoDDR2_inst.BYTES_PER_TRANSFER = 32;
defparam RAMtoDDR2_inst.NBYTES_PER_ALINE = 2368;
