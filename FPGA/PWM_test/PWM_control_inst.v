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
// Created on Wed May 11 15:26:53 2011

PWM_control PWM_control_inst
(
	.clk(clk_sig) ,	// input  clk_sig
	.reset_n(reset_n_sig) ,	// input  reset_n_sig
	.sel(sel_sig) ,	// input [1:0] sel_sig
	.PWM(PWM_sig) 	// output  PWM_sig
);

defparam PWM_control_inst.OFF = 'b00000000000000000000000000000000;
defparam PWM_control_inst.LOW = 'b00000000000000000000111111111111;
defparam PWM_control_inst.MID = 'b00000000000000000111111111111111;
defparam PWM_control_inst.HI = 'b00000000000000001111111111111111;