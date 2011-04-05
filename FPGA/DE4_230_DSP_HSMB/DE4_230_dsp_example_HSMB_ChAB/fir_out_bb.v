// megafunction wizard: %In-System Sources and Probes%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altsource_probe 

// ============================================================
// File Name: fir_out.v
// Megafunction Name(s):
// 			altsource_probe
//
// Simulation Library Files(s):
// 			altera_mf
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 9.1 Build 350 03/24/2010 SP 2 SJ Full Version
// ************************************************************

//Copyright (C) 1991-2010 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.

module fir_out (
	probe,
	source);

	input	[13:0]  probe;
	output	[0:0]  source;

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix IV"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: ENABLE_METASTABILITY STRING "NO"
// Retrieval info: CONSTANT: INSTANCE_ID STRING "fir0"
// Retrieval info: CONSTANT: PROBE_WIDTH NUMERIC "14"
// Retrieval info: CONSTANT: SLD_AUTO_INSTANCE_INDEX STRING "YES"
// Retrieval info: CONSTANT: SLD_INSTANCE_INDEX NUMERIC "0"
// Retrieval info: CONSTANT: SOURCE_INITIAL_VALUE STRING " 0"
// Retrieval info: CONSTANT: SOURCE_WIDTH NUMERIC "1"
// Retrieval info: USED_PORT: probe 0 0 14 0 INPUT NODEFVAL "probe[13..0]"
// Retrieval info: USED_PORT: source 0 0 1 0 OUTPUT NODEFVAL "source[0..0]"
// Retrieval info: CONNECT: @probe 0 0 14 0 probe 0 0 14 0
// Retrieval info: CONNECT: source 0 0 1 0 @source 0 0 1 0
// Retrieval info: GEN_FILE: TYPE_NORMAL fir_out.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL fir_out.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL fir_out.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL fir_out.bsf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL fir_out_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL fir_out_bb.v TRUE
// Retrieval info: LIB_FILE: altera_mf
