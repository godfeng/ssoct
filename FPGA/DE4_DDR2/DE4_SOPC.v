//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2011 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module burstcount_fifo_for_DE4_SOPC_burst_0_upstream_module (
                                                              // inputs:
                                                               clear_fifo,
                                                               clk,
                                                               data_in,
                                                               read,
                                                               reset_n,
                                                               sync_reset,
                                                               write,

                                                              // outputs:
                                                               data_out,
                                                               empty,
                                                               fifo_contains_ones_n,
                                                               full
                                                            )
;

  output  [  1: 0] data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input   [  1: 0] data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire    [  1: 0] data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  reg              full_32;
  reg              full_33;
  wire             full_34;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  6: 0] how_many_ones;
  wire    [  6: 0] one_count_minus_one;
  wire    [  6: 0] one_count_plus_one;
  wire             p0_full_0;
  wire    [  1: 0] p0_stage_0;
  wire             p10_full_10;
  wire    [  1: 0] p10_stage_10;
  wire             p11_full_11;
  wire    [  1: 0] p11_stage_11;
  wire             p12_full_12;
  wire    [  1: 0] p12_stage_12;
  wire             p13_full_13;
  wire    [  1: 0] p13_stage_13;
  wire             p14_full_14;
  wire    [  1: 0] p14_stage_14;
  wire             p15_full_15;
  wire    [  1: 0] p15_stage_15;
  wire             p16_full_16;
  wire    [  1: 0] p16_stage_16;
  wire             p17_full_17;
  wire    [  1: 0] p17_stage_17;
  wire             p18_full_18;
  wire    [  1: 0] p18_stage_18;
  wire             p19_full_19;
  wire    [  1: 0] p19_stage_19;
  wire             p1_full_1;
  wire    [  1: 0] p1_stage_1;
  wire             p20_full_20;
  wire    [  1: 0] p20_stage_20;
  wire             p21_full_21;
  wire    [  1: 0] p21_stage_21;
  wire             p22_full_22;
  wire    [  1: 0] p22_stage_22;
  wire             p23_full_23;
  wire    [  1: 0] p23_stage_23;
  wire             p24_full_24;
  wire    [  1: 0] p24_stage_24;
  wire             p25_full_25;
  wire    [  1: 0] p25_stage_25;
  wire             p26_full_26;
  wire    [  1: 0] p26_stage_26;
  wire             p27_full_27;
  wire    [  1: 0] p27_stage_27;
  wire             p28_full_28;
  wire    [  1: 0] p28_stage_28;
  wire             p29_full_29;
  wire    [  1: 0] p29_stage_29;
  wire             p2_full_2;
  wire    [  1: 0] p2_stage_2;
  wire             p30_full_30;
  wire    [  1: 0] p30_stage_30;
  wire             p31_full_31;
  wire    [  1: 0] p31_stage_31;
  wire             p32_full_32;
  wire    [  1: 0] p32_stage_32;
  wire             p33_full_33;
  wire    [  1: 0] p33_stage_33;
  wire             p3_full_3;
  wire    [  1: 0] p3_stage_3;
  wire             p4_full_4;
  wire    [  1: 0] p4_stage_4;
  wire             p5_full_5;
  wire    [  1: 0] p5_stage_5;
  wire             p6_full_6;
  wire    [  1: 0] p6_stage_6;
  wire             p7_full_7;
  wire    [  1: 0] p7_stage_7;
  wire             p8_full_8;
  wire    [  1: 0] p8_stage_8;
  wire             p9_full_9;
  wire    [  1: 0] p9_stage_9;
  reg     [  1: 0] stage_0;
  reg     [  1: 0] stage_1;
  reg     [  1: 0] stage_10;
  reg     [  1: 0] stage_11;
  reg     [  1: 0] stage_12;
  reg     [  1: 0] stage_13;
  reg     [  1: 0] stage_14;
  reg     [  1: 0] stage_15;
  reg     [  1: 0] stage_16;
  reg     [  1: 0] stage_17;
  reg     [  1: 0] stage_18;
  reg     [  1: 0] stage_19;
  reg     [  1: 0] stage_2;
  reg     [  1: 0] stage_20;
  reg     [  1: 0] stage_21;
  reg     [  1: 0] stage_22;
  reg     [  1: 0] stage_23;
  reg     [  1: 0] stage_24;
  reg     [  1: 0] stage_25;
  reg     [  1: 0] stage_26;
  reg     [  1: 0] stage_27;
  reg     [  1: 0] stage_28;
  reg     [  1: 0] stage_29;
  reg     [  1: 0] stage_3;
  reg     [  1: 0] stage_30;
  reg     [  1: 0] stage_31;
  reg     [  1: 0] stage_32;
  reg     [  1: 0] stage_33;
  reg     [  1: 0] stage_4;
  reg     [  1: 0] stage_5;
  reg     [  1: 0] stage_6;
  reg     [  1: 0] stage_7;
  reg     [  1: 0] stage_8;
  reg     [  1: 0] stage_9;
  wire    [  6: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_33;
  assign empty = !full_0;
  assign full_34 = 0;
  //data_33, which is an e_mux
  assign p33_stage_33 = ((full_34 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_33 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_33))
          if (sync_reset & full_33 & !((full_34 == 0) & read & write))
              stage_33 <= 0;
          else 
            stage_33 <= p33_stage_33;
    end


  //control_33, which is an e_mux
  assign p33_full_33 = ((read & !write) == 0)? full_32 :
    0;

  //control_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_33 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_33 <= 0;
          else 
            full_33 <= p33_full_33;
    end


  //data_32, which is an e_mux
  assign p32_stage_32 = ((full_33 & ~clear_fifo) == 0)? data_in :
    stage_33;

  //data_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_32 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_32))
          if (sync_reset & full_32 & !((full_33 == 0) & read & write))
              stage_32 <= 0;
          else 
            stage_32 <= p32_stage_32;
    end


  //control_32, which is an e_mux
  assign p32_full_32 = ((read & !write) == 0)? full_31 :
    full_33;

  //control_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_32 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_32 <= 0;
          else 
            full_32 <= p32_full_32;
    end


  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    stage_32;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    full_32;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_clock_crossing_m1_to_DE4_SOPC_burst_0_upstream_module (
                                                                            // inputs:
                                                                             clear_fifo,
                                                                             clk,
                                                                             data_in,
                                                                             read,
                                                                             reset_n,
                                                                             sync_reset,
                                                                             write,

                                                                            // outputs:
                                                                             data_out,
                                                                             empty,
                                                                             fifo_contains_ones_n,
                                                                             full
                                                                          )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  reg              full_32;
  reg              full_33;
  wire             full_34;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  6: 0] how_many_ones;
  wire    [  6: 0] one_count_minus_one;
  wire    [  6: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p10_full_10;
  wire             p10_stage_10;
  wire             p11_full_11;
  wire             p11_stage_11;
  wire             p12_full_12;
  wire             p12_stage_12;
  wire             p13_full_13;
  wire             p13_stage_13;
  wire             p14_full_14;
  wire             p14_stage_14;
  wire             p15_full_15;
  wire             p15_stage_15;
  wire             p16_full_16;
  wire             p16_stage_16;
  wire             p17_full_17;
  wire             p17_stage_17;
  wire             p18_full_18;
  wire             p18_stage_18;
  wire             p19_full_19;
  wire             p19_stage_19;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p20_full_20;
  wire             p20_stage_20;
  wire             p21_full_21;
  wire             p21_stage_21;
  wire             p22_full_22;
  wire             p22_stage_22;
  wire             p23_full_23;
  wire             p23_stage_23;
  wire             p24_full_24;
  wire             p24_stage_24;
  wire             p25_full_25;
  wire             p25_stage_25;
  wire             p26_full_26;
  wire             p26_stage_26;
  wire             p27_full_27;
  wire             p27_stage_27;
  wire             p28_full_28;
  wire             p28_stage_28;
  wire             p29_full_29;
  wire             p29_stage_29;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p30_full_30;
  wire             p30_stage_30;
  wire             p31_full_31;
  wire             p31_stage_31;
  wire             p32_full_32;
  wire             p32_stage_32;
  wire             p33_full_33;
  wire             p33_stage_33;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_10;
  reg              stage_11;
  reg              stage_12;
  reg              stage_13;
  reg              stage_14;
  reg              stage_15;
  reg              stage_16;
  reg              stage_17;
  reg              stage_18;
  reg              stage_19;
  reg              stage_2;
  reg              stage_20;
  reg              stage_21;
  reg              stage_22;
  reg              stage_23;
  reg              stage_24;
  reg              stage_25;
  reg              stage_26;
  reg              stage_27;
  reg              stage_28;
  reg              stage_29;
  reg              stage_3;
  reg              stage_30;
  reg              stage_31;
  reg              stage_32;
  reg              stage_33;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  reg              stage_7;
  reg              stage_8;
  reg              stage_9;
  wire    [  6: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_33;
  assign empty = !full_0;
  assign full_34 = 0;
  //data_33, which is an e_mux
  assign p33_stage_33 = ((full_34 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_33 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_33))
          if (sync_reset & full_33 & !((full_34 == 0) & read & write))
              stage_33 <= 0;
          else 
            stage_33 <= p33_stage_33;
    end


  //control_33, which is an e_mux
  assign p33_full_33 = ((read & !write) == 0)? full_32 :
    0;

  //control_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_33 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_33 <= 0;
          else 
            full_33 <= p33_full_33;
    end


  //data_32, which is an e_mux
  assign p32_stage_32 = ((full_33 & ~clear_fifo) == 0)? data_in :
    stage_33;

  //data_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_32 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_32))
          if (sync_reset & full_32 & !((full_33 == 0) & read & write))
              stage_32 <= 0;
          else 
            stage_32 <= p32_stage_32;
    end


  //control_32, which is an e_mux
  assign p32_full_32 = ((read & !write) == 0)? full_31 :
    full_33;

  //control_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_32 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_32 <= 0;
          else 
            full_32 <= p32_full_32;
    end


  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    stage_32;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    full_32;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE4_SOPC_burst_0_upstream_arbitrator (
                                              // inputs:
                                               DE4_SOPC_burst_0_upstream_readdata,
                                               DE4_SOPC_burst_0_upstream_readdatavalid,
                                               DE4_SOPC_burst_0_upstream_waitrequest,
                                               clk,
                                               clock_crossing_m1_address_to_slave,
                                               clock_crossing_m1_burstcount,
                                               clock_crossing_m1_byteenable,
                                               clock_crossing_m1_latency_counter,
                                               clock_crossing_m1_read,
                                               clock_crossing_m1_write,
                                               clock_crossing_m1_writedata,
                                               reset_n,

                                              // outputs:
                                               DE4_SOPC_burst_0_upstream_address,
                                               DE4_SOPC_burst_0_upstream_burstcount,
                                               DE4_SOPC_burst_0_upstream_byteaddress,
                                               DE4_SOPC_burst_0_upstream_byteenable,
                                               DE4_SOPC_burst_0_upstream_debugaccess,
                                               DE4_SOPC_burst_0_upstream_read,
                                               DE4_SOPC_burst_0_upstream_readdata_from_sa,
                                               DE4_SOPC_burst_0_upstream_waitrequest_from_sa,
                                               DE4_SOPC_burst_0_upstream_write,
                                               DE4_SOPC_burst_0_upstream_writedata,
                                               clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream,
                                               clock_crossing_m1_qualified_request_DE4_SOPC_burst_0_upstream,
                                               clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream,
                                               clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream_shift_register,
                                               clock_crossing_m1_requests_DE4_SOPC_burst_0_upstream,
                                               d1_DE4_SOPC_burst_0_upstream_end_xfer
                                            )
;

  output  [ 29: 0] DE4_SOPC_burst_0_upstream_address;
  output  [  1: 0] DE4_SOPC_burst_0_upstream_burstcount;
  output  [ 34: 0] DE4_SOPC_burst_0_upstream_byteaddress;
  output  [ 31: 0] DE4_SOPC_burst_0_upstream_byteenable;
  output           DE4_SOPC_burst_0_upstream_debugaccess;
  output           DE4_SOPC_burst_0_upstream_read;
  output  [255: 0] DE4_SOPC_burst_0_upstream_readdata_from_sa;
  output           DE4_SOPC_burst_0_upstream_waitrequest_from_sa;
  output           DE4_SOPC_burst_0_upstream_write;
  output  [255: 0] DE4_SOPC_burst_0_upstream_writedata;
  output           clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream;
  output           clock_crossing_m1_qualified_request_DE4_SOPC_burst_0_upstream;
  output           clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream;
  output           clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream_shift_register;
  output           clock_crossing_m1_requests_DE4_SOPC_burst_0_upstream;
  output           d1_DE4_SOPC_burst_0_upstream_end_xfer;
  input   [255: 0] DE4_SOPC_burst_0_upstream_readdata;
  input            DE4_SOPC_burst_0_upstream_readdatavalid;
  input            DE4_SOPC_burst_0_upstream_waitrequest;
  input            clk;
  input   [ 29: 0] clock_crossing_m1_address_to_slave;
  input   [  1: 0] clock_crossing_m1_burstcount;
  input   [  3: 0] clock_crossing_m1_byteenable;
  input            clock_crossing_m1_latency_counter;
  input            clock_crossing_m1_read;
  input            clock_crossing_m1_write;
  input   [ 31: 0] clock_crossing_m1_writedata;
  input            reset_n;

  wire    [ 29: 0] DE4_SOPC_burst_0_upstream_address;
  wire             DE4_SOPC_burst_0_upstream_allgrants;
  wire             DE4_SOPC_burst_0_upstream_allow_new_arb_cycle;
  wire             DE4_SOPC_burst_0_upstream_any_bursting_master_saved_grant;
  wire             DE4_SOPC_burst_0_upstream_any_continuerequest;
  wire             DE4_SOPC_burst_0_upstream_arb_counter_enable;
  reg     [  1: 0] DE4_SOPC_burst_0_upstream_arb_share_counter;
  wire    [  1: 0] DE4_SOPC_burst_0_upstream_arb_share_counter_next_value;
  wire    [  1: 0] DE4_SOPC_burst_0_upstream_arb_share_set_values;
  reg              DE4_SOPC_burst_0_upstream_bbt_burstcounter;
  wire             DE4_SOPC_burst_0_upstream_beginbursttransfer_internal;
  wire             DE4_SOPC_burst_0_upstream_begins_xfer;
  wire    [  1: 0] DE4_SOPC_burst_0_upstream_burstcount;
  wire             DE4_SOPC_burst_0_upstream_burstcount_fifo_empty;
  wire    [ 34: 0] DE4_SOPC_burst_0_upstream_byteaddress;
  wire    [ 31: 0] DE4_SOPC_burst_0_upstream_byteenable;
  reg     [  1: 0] DE4_SOPC_burst_0_upstream_current_burst;
  wire    [  1: 0] DE4_SOPC_burst_0_upstream_current_burst_minus_one;
  wire             DE4_SOPC_burst_0_upstream_debugaccess;
  wire             DE4_SOPC_burst_0_upstream_end_xfer;
  wire             DE4_SOPC_burst_0_upstream_firsttransfer;
  wire             DE4_SOPC_burst_0_upstream_grant_vector;
  wire             DE4_SOPC_burst_0_upstream_in_a_read_cycle;
  wire             DE4_SOPC_burst_0_upstream_in_a_write_cycle;
  reg              DE4_SOPC_burst_0_upstream_load_fifo;
  wire             DE4_SOPC_burst_0_upstream_master_qreq_vector;
  wire             DE4_SOPC_burst_0_upstream_move_on_to_next_transaction;
  wire             DE4_SOPC_burst_0_upstream_next_bbt_burstcount;
  wire    [  1: 0] DE4_SOPC_burst_0_upstream_next_burst_count;
  wire             DE4_SOPC_burst_0_upstream_non_bursting_master_requests;
  wire             DE4_SOPC_burst_0_upstream_read;
  wire    [255: 0] DE4_SOPC_burst_0_upstream_readdata_from_sa;
  wire             DE4_SOPC_burst_0_upstream_readdatavalid_from_sa;
  reg              DE4_SOPC_burst_0_upstream_reg_firsttransfer;
  wire    [  1: 0] DE4_SOPC_burst_0_upstream_selected_burstcount;
  reg              DE4_SOPC_burst_0_upstream_slavearbiterlockenable;
  wire             DE4_SOPC_burst_0_upstream_slavearbiterlockenable2;
  wire             DE4_SOPC_burst_0_upstream_this_cycle_is_the_last_burst;
  wire    [  1: 0] DE4_SOPC_burst_0_upstream_transaction_burst_count;
  wire             DE4_SOPC_burst_0_upstream_unreg_firsttransfer;
  wire             DE4_SOPC_burst_0_upstream_waitrequest_from_sa;
  wire             DE4_SOPC_burst_0_upstream_waits_for_read;
  wire             DE4_SOPC_burst_0_upstream_waits_for_write;
  wire             DE4_SOPC_burst_0_upstream_write;
  wire    [255: 0] DE4_SOPC_burst_0_upstream_writedata;
  wire             clock_crossing_m1_arbiterlock;
  wire             clock_crossing_m1_arbiterlock2;
  wire    [  2: 0] clock_crossing_m1_be_mux_control_DE4_SOPC_burst_0_upstream;
  reg     [  2: 0] clock_crossing_m1_be_mux_control_DE4_SOPC_burst_0_upstream_reg;
  wire    [ 31: 0] clock_crossing_m1_byteenable_DE4_SOPC_burst_0_upstream;
  wire             clock_crossing_m1_continuerequest;
  wire             clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream;
  wire             clock_crossing_m1_qualified_request_DE4_SOPC_burst_0_upstream;
  wire             clock_crossing_m1_rdv_fifo_empty_DE4_SOPC_burst_0_upstream;
  wire             clock_crossing_m1_rdv_fifo_output_from_DE4_SOPC_burst_0_upstream;
  wire             clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream;
  wire             clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream_shift_register;
  wire             clock_crossing_m1_requests_DE4_SOPC_burst_0_upstream;
  wire             clock_crossing_m1_saved_grant_DE4_SOPC_burst_0_upstream;
  wire    [255: 0] clock_crossing_m1_writedata_replicated;
  reg              d1_DE4_SOPC_burst_0_upstream_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_DE4_SOPC_burst_0_upstream;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p0_DE4_SOPC_burst_0_upstream_load_fifo;
  wire             wait_for_DE4_SOPC_burst_0_upstream_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~DE4_SOPC_burst_0_upstream_end_xfer;
    end


  assign DE4_SOPC_burst_0_upstream_begins_xfer = ~d1_reasons_to_wait & ((clock_crossing_m1_qualified_request_DE4_SOPC_burst_0_upstream));
  //assign DE4_SOPC_burst_0_upstream_readdata_from_sa = DE4_SOPC_burst_0_upstream_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE4_SOPC_burst_0_upstream_readdata_from_sa = DE4_SOPC_burst_0_upstream_readdata;

  assign clock_crossing_m1_requests_DE4_SOPC_burst_0_upstream = (1) & (clock_crossing_m1_read | clock_crossing_m1_write);
  //assign DE4_SOPC_burst_0_upstream_waitrequest_from_sa = DE4_SOPC_burst_0_upstream_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE4_SOPC_burst_0_upstream_waitrequest_from_sa = DE4_SOPC_burst_0_upstream_waitrequest;

  //assign DE4_SOPC_burst_0_upstream_readdatavalid_from_sa = DE4_SOPC_burst_0_upstream_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE4_SOPC_burst_0_upstream_readdatavalid_from_sa = DE4_SOPC_burst_0_upstream_readdatavalid;

  //DE4_SOPC_burst_0_upstream_arb_share_counter set values, which is an e_mux
  assign DE4_SOPC_burst_0_upstream_arb_share_set_values = (clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream)? (((clock_crossing_m1_write) ? clock_crossing_m1_burstcount : 1)) :
    1;

  //DE4_SOPC_burst_0_upstream_non_bursting_master_requests mux, which is an e_mux
  assign DE4_SOPC_burst_0_upstream_non_bursting_master_requests = 0;

  //DE4_SOPC_burst_0_upstream_any_bursting_master_saved_grant mux, which is an e_mux
  assign DE4_SOPC_burst_0_upstream_any_bursting_master_saved_grant = clock_crossing_m1_saved_grant_DE4_SOPC_burst_0_upstream;

  //DE4_SOPC_burst_0_upstream_arb_share_counter_next_value assignment, which is an e_assign
  assign DE4_SOPC_burst_0_upstream_arb_share_counter_next_value = DE4_SOPC_burst_0_upstream_firsttransfer ? (DE4_SOPC_burst_0_upstream_arb_share_set_values - 1) : |DE4_SOPC_burst_0_upstream_arb_share_counter ? (DE4_SOPC_burst_0_upstream_arb_share_counter - 1) : 0;

  //DE4_SOPC_burst_0_upstream_allgrants all slave grants, which is an e_mux
  assign DE4_SOPC_burst_0_upstream_allgrants = |DE4_SOPC_burst_0_upstream_grant_vector;

  //DE4_SOPC_burst_0_upstream_end_xfer assignment, which is an e_assign
  assign DE4_SOPC_burst_0_upstream_end_xfer = ~(DE4_SOPC_burst_0_upstream_waits_for_read | DE4_SOPC_burst_0_upstream_waits_for_write);

  //end_xfer_arb_share_counter_term_DE4_SOPC_burst_0_upstream arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_DE4_SOPC_burst_0_upstream = DE4_SOPC_burst_0_upstream_end_xfer & (~DE4_SOPC_burst_0_upstream_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //DE4_SOPC_burst_0_upstream_arb_share_counter arbitration counter enable, which is an e_assign
  assign DE4_SOPC_burst_0_upstream_arb_counter_enable = (end_xfer_arb_share_counter_term_DE4_SOPC_burst_0_upstream & DE4_SOPC_burst_0_upstream_allgrants) | (end_xfer_arb_share_counter_term_DE4_SOPC_burst_0_upstream & ~DE4_SOPC_burst_0_upstream_non_bursting_master_requests);

  //DE4_SOPC_burst_0_upstream_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE4_SOPC_burst_0_upstream_arb_share_counter <= 0;
      else if (DE4_SOPC_burst_0_upstream_arb_counter_enable)
          DE4_SOPC_burst_0_upstream_arb_share_counter <= DE4_SOPC_burst_0_upstream_arb_share_counter_next_value;
    end


  //DE4_SOPC_burst_0_upstream_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE4_SOPC_burst_0_upstream_slavearbiterlockenable <= 0;
      else if ((|DE4_SOPC_burst_0_upstream_master_qreq_vector & end_xfer_arb_share_counter_term_DE4_SOPC_burst_0_upstream) | (end_xfer_arb_share_counter_term_DE4_SOPC_burst_0_upstream & ~DE4_SOPC_burst_0_upstream_non_bursting_master_requests))
          DE4_SOPC_burst_0_upstream_slavearbiterlockenable <= |DE4_SOPC_burst_0_upstream_arb_share_counter_next_value;
    end


  //clock_crossing/m1 DE4_SOPC_burst_0/upstream arbiterlock, which is an e_assign
  assign clock_crossing_m1_arbiterlock = DE4_SOPC_burst_0_upstream_slavearbiterlockenable & clock_crossing_m1_continuerequest;

  //DE4_SOPC_burst_0_upstream_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign DE4_SOPC_burst_0_upstream_slavearbiterlockenable2 = |DE4_SOPC_burst_0_upstream_arb_share_counter_next_value;

  //clock_crossing/m1 DE4_SOPC_burst_0/upstream arbiterlock2, which is an e_assign
  assign clock_crossing_m1_arbiterlock2 = DE4_SOPC_burst_0_upstream_slavearbiterlockenable2 & clock_crossing_m1_continuerequest;

  //DE4_SOPC_burst_0_upstream_any_continuerequest at least one master continues requesting, which is an e_assign
  assign DE4_SOPC_burst_0_upstream_any_continuerequest = 1;

  //clock_crossing_m1_continuerequest continued request, which is an e_assign
  assign clock_crossing_m1_continuerequest = 1;

  assign clock_crossing_m1_qualified_request_DE4_SOPC_burst_0_upstream = clock_crossing_m1_requests_DE4_SOPC_burst_0_upstream & ~((clock_crossing_m1_read & ((clock_crossing_m1_latency_counter != 0) | (1 < clock_crossing_m1_latency_counter))));
  //unique name for DE4_SOPC_burst_0_upstream_move_on_to_next_transaction, which is an e_assign
  assign DE4_SOPC_burst_0_upstream_move_on_to_next_transaction = DE4_SOPC_burst_0_upstream_this_cycle_is_the_last_burst & DE4_SOPC_burst_0_upstream_load_fifo;

  //the currently selected burstcount for DE4_SOPC_burst_0_upstream, which is an e_mux
  assign DE4_SOPC_burst_0_upstream_selected_burstcount = (clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream)? clock_crossing_m1_burstcount :
    1;

  //burstcount_fifo_for_DE4_SOPC_burst_0_upstream, which is an e_fifo_with_registered_outputs
  burstcount_fifo_for_DE4_SOPC_burst_0_upstream_module burstcount_fifo_for_DE4_SOPC_burst_0_upstream
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (DE4_SOPC_burst_0_upstream_selected_burstcount),
      .data_out             (DE4_SOPC_burst_0_upstream_transaction_burst_count),
      .empty                (DE4_SOPC_burst_0_upstream_burstcount_fifo_empty),
      .fifo_contains_ones_n (),
      .full                 (),
      .read                 (DE4_SOPC_burst_0_upstream_this_cycle_is_the_last_burst),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~DE4_SOPC_burst_0_upstream_waits_for_read & DE4_SOPC_burst_0_upstream_load_fifo & ~(DE4_SOPC_burst_0_upstream_this_cycle_is_the_last_burst & DE4_SOPC_burst_0_upstream_burstcount_fifo_empty))
    );

  //DE4_SOPC_burst_0_upstream current burst minus one, which is an e_assign
  assign DE4_SOPC_burst_0_upstream_current_burst_minus_one = DE4_SOPC_burst_0_upstream_current_burst - 1;

  //what to load in current_burst, for DE4_SOPC_burst_0_upstream, which is an e_mux
  assign DE4_SOPC_burst_0_upstream_next_burst_count = (((in_a_read_cycle & ~DE4_SOPC_burst_0_upstream_waits_for_read) & ~DE4_SOPC_burst_0_upstream_load_fifo))? DE4_SOPC_burst_0_upstream_selected_burstcount :
    ((in_a_read_cycle & ~DE4_SOPC_burst_0_upstream_waits_for_read & DE4_SOPC_burst_0_upstream_this_cycle_is_the_last_burst & DE4_SOPC_burst_0_upstream_burstcount_fifo_empty))? DE4_SOPC_burst_0_upstream_selected_burstcount :
    (DE4_SOPC_burst_0_upstream_this_cycle_is_the_last_burst)? DE4_SOPC_burst_0_upstream_transaction_burst_count :
    DE4_SOPC_burst_0_upstream_current_burst_minus_one;

  //the current burst count for DE4_SOPC_burst_0_upstream, to be decremented, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE4_SOPC_burst_0_upstream_current_burst <= 0;
      else if (DE4_SOPC_burst_0_upstream_readdatavalid_from_sa | (~DE4_SOPC_burst_0_upstream_load_fifo & (in_a_read_cycle & ~DE4_SOPC_burst_0_upstream_waits_for_read)))
          DE4_SOPC_burst_0_upstream_current_burst <= DE4_SOPC_burst_0_upstream_next_burst_count;
    end


  //a 1 or burstcount fifo empty, to initialize the counter, which is an e_mux
  assign p0_DE4_SOPC_burst_0_upstream_load_fifo = (~DE4_SOPC_burst_0_upstream_load_fifo)? 1 :
    (((in_a_read_cycle & ~DE4_SOPC_burst_0_upstream_waits_for_read) & DE4_SOPC_burst_0_upstream_load_fifo))? 1 :
    ~DE4_SOPC_burst_0_upstream_burstcount_fifo_empty;

  //whether to load directly to the counter or to the fifo, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE4_SOPC_burst_0_upstream_load_fifo <= 0;
      else if ((in_a_read_cycle & ~DE4_SOPC_burst_0_upstream_waits_for_read) & ~DE4_SOPC_burst_0_upstream_load_fifo | DE4_SOPC_burst_0_upstream_this_cycle_is_the_last_burst)
          DE4_SOPC_burst_0_upstream_load_fifo <= p0_DE4_SOPC_burst_0_upstream_load_fifo;
    end


  //the last cycle in the burst for DE4_SOPC_burst_0_upstream, which is an e_assign
  assign DE4_SOPC_burst_0_upstream_this_cycle_is_the_last_burst = ~(|DE4_SOPC_burst_0_upstream_current_burst_minus_one) & DE4_SOPC_burst_0_upstream_readdatavalid_from_sa;

  //rdv_fifo_for_clock_crossing_m1_to_DE4_SOPC_burst_0_upstream, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_clock_crossing_m1_to_DE4_SOPC_burst_0_upstream_module rdv_fifo_for_clock_crossing_m1_to_DE4_SOPC_burst_0_upstream
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream),
      .data_out             (clock_crossing_m1_rdv_fifo_output_from_DE4_SOPC_burst_0_upstream),
      .empty                (),
      .fifo_contains_ones_n (clock_crossing_m1_rdv_fifo_empty_DE4_SOPC_burst_0_upstream),
      .full                 (),
      .read                 (DE4_SOPC_burst_0_upstream_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~DE4_SOPC_burst_0_upstream_waits_for_read)
    );

  assign clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream_shift_register = ~clock_crossing_m1_rdv_fifo_empty_DE4_SOPC_burst_0_upstream;
  //local readdatavalid clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream, which is an e_mux
  assign clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream = DE4_SOPC_burst_0_upstream_readdatavalid_from_sa;

  //replicate narrow data for wide slave
  assign clock_crossing_m1_writedata_replicated = {clock_crossing_m1_writedata,
    clock_crossing_m1_writedata,
    clock_crossing_m1_writedata,
    clock_crossing_m1_writedata,
    clock_crossing_m1_writedata,
    clock_crossing_m1_writedata,
    clock_crossing_m1_writedata,
    clock_crossing_m1_writedata};

  //DE4_SOPC_burst_0_upstream_writedata mux, which is an e_mux
  assign DE4_SOPC_burst_0_upstream_writedata = clock_crossing_m1_writedata_replicated;

  //byteaddress mux for DE4_SOPC_burst_0/upstream, which is an e_mux
  assign DE4_SOPC_burst_0_upstream_byteaddress = clock_crossing_m1_address_to_slave;

  //master is always granted when requested
  assign clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream = clock_crossing_m1_qualified_request_DE4_SOPC_burst_0_upstream;

  //clock_crossing/m1 saved-grant DE4_SOPC_burst_0/upstream, which is an e_assign
  assign clock_crossing_m1_saved_grant_DE4_SOPC_burst_0_upstream = clock_crossing_m1_requests_DE4_SOPC_burst_0_upstream;

  //allow new arb cycle for DE4_SOPC_burst_0/upstream, which is an e_assign
  assign DE4_SOPC_burst_0_upstream_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign DE4_SOPC_burst_0_upstream_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign DE4_SOPC_burst_0_upstream_master_qreq_vector = 1;

  //DE4_SOPC_burst_0_upstream_firsttransfer first transaction, which is an e_assign
  assign DE4_SOPC_burst_0_upstream_firsttransfer = DE4_SOPC_burst_0_upstream_begins_xfer ? DE4_SOPC_burst_0_upstream_unreg_firsttransfer : DE4_SOPC_burst_0_upstream_reg_firsttransfer;

  //DE4_SOPC_burst_0_upstream_unreg_firsttransfer first transaction, which is an e_assign
  assign DE4_SOPC_burst_0_upstream_unreg_firsttransfer = ~(DE4_SOPC_burst_0_upstream_slavearbiterlockenable & DE4_SOPC_burst_0_upstream_any_continuerequest);

  //DE4_SOPC_burst_0_upstream_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE4_SOPC_burst_0_upstream_reg_firsttransfer <= 1'b1;
      else if (DE4_SOPC_burst_0_upstream_begins_xfer)
          DE4_SOPC_burst_0_upstream_reg_firsttransfer <= DE4_SOPC_burst_0_upstream_unreg_firsttransfer;
    end


  //DE4_SOPC_burst_0_upstream_next_bbt_burstcount next_bbt_burstcount, which is an e_mux
  assign DE4_SOPC_burst_0_upstream_next_bbt_burstcount = ((((DE4_SOPC_burst_0_upstream_write) && (DE4_SOPC_burst_0_upstream_bbt_burstcounter == 0))))? (DE4_SOPC_burst_0_upstream_burstcount - 1) :
    ((((DE4_SOPC_burst_0_upstream_read) && (DE4_SOPC_burst_0_upstream_bbt_burstcounter == 0))))? 0 :
    (DE4_SOPC_burst_0_upstream_bbt_burstcounter - 1);

  //DE4_SOPC_burst_0_upstream_bbt_burstcounter bbt_burstcounter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE4_SOPC_burst_0_upstream_bbt_burstcounter <= 0;
      else if (DE4_SOPC_burst_0_upstream_begins_xfer)
          DE4_SOPC_burst_0_upstream_bbt_burstcounter <= DE4_SOPC_burst_0_upstream_next_bbt_burstcount;
    end


  //DE4_SOPC_burst_0_upstream_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign DE4_SOPC_burst_0_upstream_beginbursttransfer_internal = DE4_SOPC_burst_0_upstream_begins_xfer & (DE4_SOPC_burst_0_upstream_bbt_burstcounter == 0);

  //DE4_SOPC_burst_0_upstream_read assignment, which is an e_mux
  assign DE4_SOPC_burst_0_upstream_read = clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream & clock_crossing_m1_read;

  //DE4_SOPC_burst_0_upstream_write assignment, which is an e_mux
  assign DE4_SOPC_burst_0_upstream_write = clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream & clock_crossing_m1_write;

  //DE4_SOPC_burst_0_upstream_address mux, which is an e_mux
  assign DE4_SOPC_burst_0_upstream_address = clock_crossing_m1_address_to_slave;

  //d1_DE4_SOPC_burst_0_upstream_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_DE4_SOPC_burst_0_upstream_end_xfer <= 1;
      else 
        d1_DE4_SOPC_burst_0_upstream_end_xfer <= DE4_SOPC_burst_0_upstream_end_xfer;
    end


  //DE4_SOPC_burst_0_upstream_waits_for_read in a cycle, which is an e_mux
  assign DE4_SOPC_burst_0_upstream_waits_for_read = DE4_SOPC_burst_0_upstream_in_a_read_cycle & DE4_SOPC_burst_0_upstream_waitrequest_from_sa;

  //DE4_SOPC_burst_0_upstream_in_a_read_cycle assignment, which is an e_assign
  assign DE4_SOPC_burst_0_upstream_in_a_read_cycle = clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream & clock_crossing_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = DE4_SOPC_burst_0_upstream_in_a_read_cycle;

  //DE4_SOPC_burst_0_upstream_waits_for_write in a cycle, which is an e_mux
  assign DE4_SOPC_burst_0_upstream_waits_for_write = DE4_SOPC_burst_0_upstream_in_a_write_cycle & DE4_SOPC_burst_0_upstream_waitrequest_from_sa;

  //DE4_SOPC_burst_0_upstream_in_a_write_cycle assignment, which is an e_assign
  assign DE4_SOPC_burst_0_upstream_in_a_write_cycle = clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream & clock_crossing_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = DE4_SOPC_burst_0_upstream_in_a_write_cycle;

  assign wait_for_DE4_SOPC_burst_0_upstream_counter = 0;
  //DE4_SOPC_burst_0_upstream_byteenable byte enable port mux, which is an e_mux
  assign DE4_SOPC_burst_0_upstream_byteenable = (clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream)? clock_crossing_m1_byteenable_DE4_SOPC_burst_0_upstream :
    -1;

  //be mux control reg for clock_crossing/m1 and DE4_SOPC_burst_0/upstream, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_m1_be_mux_control_DE4_SOPC_burst_0_upstream_reg <= 0;
      else 
        clock_crossing_m1_be_mux_control_DE4_SOPC_burst_0_upstream_reg <= DE4_SOPC_burst_0_upstream_beginbursttransfer_internal & ~DE4_SOPC_burst_0_upstream_waitrequest_from_sa ? (clock_crossing_m1_address_to_slave[4 : 2] + 1) : DE4_SOPC_burst_0_upstream_beginbursttransfer_internal & DE4_SOPC_burst_0_upstream_waitrequest_from_sa ? clock_crossing_m1_address_to_slave[4 : 2] : ~DE4_SOPC_burst_0_upstream_waitrequest_from_sa ? (clock_crossing_m1_be_mux_control_DE4_SOPC_burst_0_upstream_reg + 1) :  clock_crossing_m1_be_mux_control_DE4_SOPC_burst_0_upstream_reg;
    end


  //be mux control for clock_crossing/m1 and DE4_SOPC_burst_0/upstream, which is an e_assign
  assign clock_crossing_m1_be_mux_control_DE4_SOPC_burst_0_upstream = DE4_SOPC_burst_0_upstream_beginbursttransfer_internal ? clock_crossing_m1_address_to_slave[4 : 2] : clock_crossing_m1_be_mux_control_DE4_SOPC_burst_0_upstream_reg;

  //byte_enable_mux for clock_crossing/m1 and DE4_SOPC_burst_0/upstream, which is an e_mux
  assign clock_crossing_m1_byteenable_DE4_SOPC_burst_0_upstream = (clock_crossing_m1_be_mux_control_DE4_SOPC_burst_0_upstream == 0)? clock_crossing_m1_byteenable :
    (clock_crossing_m1_be_mux_control_DE4_SOPC_burst_0_upstream == 1)? {clock_crossing_m1_byteenable, {4'b0}} :
    (clock_crossing_m1_be_mux_control_DE4_SOPC_burst_0_upstream == 2)? {clock_crossing_m1_byteenable, {8'b0}} :
    (clock_crossing_m1_be_mux_control_DE4_SOPC_burst_0_upstream == 3)? {clock_crossing_m1_byteenable, {12'b0}} :
    (clock_crossing_m1_be_mux_control_DE4_SOPC_burst_0_upstream == 4)? {clock_crossing_m1_byteenable, {16'b0}} :
    (clock_crossing_m1_be_mux_control_DE4_SOPC_burst_0_upstream == 5)? {clock_crossing_m1_byteenable, {20'b0}} :
    (clock_crossing_m1_be_mux_control_DE4_SOPC_burst_0_upstream == 6)? {clock_crossing_m1_byteenable, {24'b0}} :
    {clock_crossing_m1_byteenable, {28'b0}};

  //burstcount mux, which is an e_mux
  assign DE4_SOPC_burst_0_upstream_burstcount = (clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream)? clock_crossing_m1_burstcount :
    1;

  //debugaccess mux, which is an e_mux
  assign DE4_SOPC_burst_0_upstream_debugaccess = 0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE4_SOPC_burst_0/upstream enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //clock_crossing/m1 non-zero burstcount assertion, which is an e_process
  always @(posedge clk)
    begin
      if (clock_crossing_m1_requests_DE4_SOPC_burst_0_upstream && (clock_crossing_m1_burstcount == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: clock_crossing/m1 drove 0 on its 'burstcount' port while accessing slave DE4_SOPC_burst_0/upstream", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE4_SOPC_burst_0_downstream_arbitrator (
                                                // inputs:
                                                 DE4_SOPC_burst_0_downstream_address,
                                                 DE4_SOPC_burst_0_downstream_burstcount,
                                                 DE4_SOPC_burst_0_downstream_byteenable,
                                                 DE4_SOPC_burst_0_downstream_granted_ddr2_s1,
                                                 DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1,
                                                 DE4_SOPC_burst_0_downstream_read,
                                                 DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1,
                                                 DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1_shift_register,
                                                 DE4_SOPC_burst_0_downstream_requests_ddr2_s1,
                                                 DE4_SOPC_burst_0_downstream_write,
                                                 DE4_SOPC_burst_0_downstream_writedata,
                                                 clk,
                                                 d1_ddr2_s1_end_xfer,
                                                 ddr2_s1_readdata_from_sa,
                                                 ddr2_s1_waitrequest_n_from_sa,
                                                 reset_n,

                                                // outputs:
                                                 DE4_SOPC_burst_0_downstream_address_to_slave,
                                                 DE4_SOPC_burst_0_downstream_latency_counter,
                                                 DE4_SOPC_burst_0_downstream_readdata,
                                                 DE4_SOPC_burst_0_downstream_readdatavalid,
                                                 DE4_SOPC_burst_0_downstream_reset_n,
                                                 DE4_SOPC_burst_0_downstream_waitrequest
                                              )
;

  output  [ 29: 0] DE4_SOPC_burst_0_downstream_address_to_slave;
  output           DE4_SOPC_burst_0_downstream_latency_counter;
  output  [255: 0] DE4_SOPC_burst_0_downstream_readdata;
  output           DE4_SOPC_burst_0_downstream_readdatavalid;
  output           DE4_SOPC_burst_0_downstream_reset_n;
  output           DE4_SOPC_burst_0_downstream_waitrequest;
  input   [ 29: 0] DE4_SOPC_burst_0_downstream_address;
  input   [  2: 0] DE4_SOPC_burst_0_downstream_burstcount;
  input   [ 31: 0] DE4_SOPC_burst_0_downstream_byteenable;
  input            DE4_SOPC_burst_0_downstream_granted_ddr2_s1;
  input            DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1;
  input            DE4_SOPC_burst_0_downstream_read;
  input            DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1;
  input            DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1_shift_register;
  input            DE4_SOPC_burst_0_downstream_requests_ddr2_s1;
  input            DE4_SOPC_burst_0_downstream_write;
  input   [255: 0] DE4_SOPC_burst_0_downstream_writedata;
  input            clk;
  input            d1_ddr2_s1_end_xfer;
  input   [255: 0] ddr2_s1_readdata_from_sa;
  input            ddr2_s1_waitrequest_n_from_sa;
  input            reset_n;

  reg     [ 29: 0] DE4_SOPC_burst_0_downstream_address_last_time;
  wire    [ 29: 0] DE4_SOPC_burst_0_downstream_address_to_slave;
  reg     [  2: 0] DE4_SOPC_burst_0_downstream_burstcount_last_time;
  reg     [ 31: 0] DE4_SOPC_burst_0_downstream_byteenable_last_time;
  wire             DE4_SOPC_burst_0_downstream_latency_counter;
  reg              DE4_SOPC_burst_0_downstream_read_last_time;
  wire    [255: 0] DE4_SOPC_burst_0_downstream_readdata;
  wire             DE4_SOPC_burst_0_downstream_readdatavalid;
  wire             DE4_SOPC_burst_0_downstream_reset_n;
  wire             DE4_SOPC_burst_0_downstream_run;
  wire             DE4_SOPC_burst_0_downstream_waitrequest;
  reg              DE4_SOPC_burst_0_downstream_write_last_time;
  reg     [255: 0] DE4_SOPC_burst_0_downstream_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             pre_flush_DE4_SOPC_burst_0_downstream_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1 | ~DE4_SOPC_burst_0_downstream_requests_ddr2_s1) & ((~DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1 | ~(DE4_SOPC_burst_0_downstream_read | DE4_SOPC_burst_0_downstream_write) | (1 & ddr2_s1_waitrequest_n_from_sa & (DE4_SOPC_burst_0_downstream_read | DE4_SOPC_burst_0_downstream_write)))) & ((~DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1 | ~(DE4_SOPC_burst_0_downstream_read | DE4_SOPC_burst_0_downstream_write) | (1 & ddr2_s1_waitrequest_n_from_sa & (DE4_SOPC_burst_0_downstream_read | DE4_SOPC_burst_0_downstream_write))));

  //cascaded wait assignment, which is an e_assign
  assign DE4_SOPC_burst_0_downstream_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign DE4_SOPC_burst_0_downstream_address_to_slave = DE4_SOPC_burst_0_downstream_address;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_DE4_SOPC_burst_0_downstream_readdatavalid = DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign DE4_SOPC_burst_0_downstream_readdatavalid = 0 |
    pre_flush_DE4_SOPC_burst_0_downstream_readdatavalid;

  //DE4_SOPC_burst_0/downstream readdata mux, which is an e_mux
  assign DE4_SOPC_burst_0_downstream_readdata = ddr2_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign DE4_SOPC_burst_0_downstream_waitrequest = ~DE4_SOPC_burst_0_downstream_run;

  //latent max counter, which is an e_assign
  assign DE4_SOPC_burst_0_downstream_latency_counter = 0;

  //DE4_SOPC_burst_0_downstream_reset_n assignment, which is an e_assign
  assign DE4_SOPC_burst_0_downstream_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE4_SOPC_burst_0_downstream_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE4_SOPC_burst_0_downstream_address_last_time <= 0;
      else 
        DE4_SOPC_burst_0_downstream_address_last_time <= DE4_SOPC_burst_0_downstream_address;
    end


  //DE4_SOPC_burst_0/downstream waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= DE4_SOPC_burst_0_downstream_waitrequest & (DE4_SOPC_burst_0_downstream_read | DE4_SOPC_burst_0_downstream_write);
    end


  //DE4_SOPC_burst_0_downstream_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE4_SOPC_burst_0_downstream_address != DE4_SOPC_burst_0_downstream_address_last_time))
        begin
          $write("%0d ns: DE4_SOPC_burst_0_downstream_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE4_SOPC_burst_0_downstream_burstcount check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE4_SOPC_burst_0_downstream_burstcount_last_time <= 0;
      else 
        DE4_SOPC_burst_0_downstream_burstcount_last_time <= DE4_SOPC_burst_0_downstream_burstcount;
    end


  //DE4_SOPC_burst_0_downstream_burstcount matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE4_SOPC_burst_0_downstream_burstcount != DE4_SOPC_burst_0_downstream_burstcount_last_time))
        begin
          $write("%0d ns: DE4_SOPC_burst_0_downstream_burstcount did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE4_SOPC_burst_0_downstream_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE4_SOPC_burst_0_downstream_byteenable_last_time <= 0;
      else 
        DE4_SOPC_burst_0_downstream_byteenable_last_time <= DE4_SOPC_burst_0_downstream_byteenable;
    end


  //DE4_SOPC_burst_0_downstream_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE4_SOPC_burst_0_downstream_byteenable != DE4_SOPC_burst_0_downstream_byteenable_last_time))
        begin
          $write("%0d ns: DE4_SOPC_burst_0_downstream_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE4_SOPC_burst_0_downstream_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE4_SOPC_burst_0_downstream_read_last_time <= 0;
      else 
        DE4_SOPC_burst_0_downstream_read_last_time <= DE4_SOPC_burst_0_downstream_read;
    end


  //DE4_SOPC_burst_0_downstream_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE4_SOPC_burst_0_downstream_read != DE4_SOPC_burst_0_downstream_read_last_time))
        begin
          $write("%0d ns: DE4_SOPC_burst_0_downstream_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE4_SOPC_burst_0_downstream_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE4_SOPC_burst_0_downstream_write_last_time <= 0;
      else 
        DE4_SOPC_burst_0_downstream_write_last_time <= DE4_SOPC_burst_0_downstream_write;
    end


  //DE4_SOPC_burst_0_downstream_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE4_SOPC_burst_0_downstream_write != DE4_SOPC_burst_0_downstream_write_last_time))
        begin
          $write("%0d ns: DE4_SOPC_burst_0_downstream_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE4_SOPC_burst_0_downstream_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE4_SOPC_burst_0_downstream_writedata_last_time <= 0;
      else 
        DE4_SOPC_burst_0_downstream_writedata_last_time <= DE4_SOPC_burst_0_downstream_writedata;
    end


  //DE4_SOPC_burst_0_downstream_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE4_SOPC_burst_0_downstream_writedata != DE4_SOPC_burst_0_downstream_writedata_last_time) & DE4_SOPC_burst_0_downstream_write)
        begin
          $write("%0d ns: DE4_SOPC_burst_0_downstream_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_master_read_avalon_master_to_clock_crossing_s1_module (
                                                                            // inputs:
                                                                             clear_fifo,
                                                                             clk,
                                                                             data_in,
                                                                             read,
                                                                             reset_n,
                                                                             sync_reset,
                                                                             write,

                                                                            // outputs:
                                                                             data_out,
                                                                             empty,
                                                                             fifo_contains_ones_n,
                                                                             full
                                                                          )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  reg              full_32;
  reg              full_33;
  reg              full_34;
  reg              full_35;
  reg              full_36;
  reg              full_37;
  reg              full_38;
  reg              full_39;
  reg              full_4;
  reg              full_40;
  reg              full_41;
  reg              full_42;
  reg              full_43;
  reg              full_44;
  reg              full_45;
  reg              full_46;
  reg              full_47;
  reg              full_48;
  reg              full_49;
  reg              full_5;
  reg              full_50;
  reg              full_51;
  reg              full_52;
  reg              full_53;
  reg              full_54;
  reg              full_55;
  reg              full_56;
  reg              full_57;
  reg              full_58;
  reg              full_59;
  reg              full_6;
  reg              full_60;
  reg              full_61;
  reg              full_62;
  reg              full_63;
  reg              full_64;
  reg              full_65;
  reg              full_66;
  reg              full_67;
  reg              full_68;
  reg              full_69;
  reg              full_7;
  reg              full_70;
  reg              full_71;
  reg              full_72;
  reg              full_73;
  reg              full_74;
  reg              full_75;
  reg              full_76;
  reg              full_77;
  reg              full_78;
  reg              full_79;
  reg              full_8;
  reg              full_80;
  reg              full_81;
  reg              full_82;
  reg              full_83;
  reg              full_84;
  reg              full_85;
  reg              full_86;
  reg              full_87;
  reg              full_88;
  reg              full_89;
  reg              full_9;
  reg              full_90;
  reg              full_91;
  reg              full_92;
  reg              full_93;
  reg              full_94;
  reg              full_95;
  reg              full_96;
  reg              full_97;
  wire             full_98;
  reg     [  7: 0] how_many_ones;
  wire    [  7: 0] one_count_minus_one;
  wire    [  7: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p10_full_10;
  wire             p10_stage_10;
  wire             p11_full_11;
  wire             p11_stage_11;
  wire             p12_full_12;
  wire             p12_stage_12;
  wire             p13_full_13;
  wire             p13_stage_13;
  wire             p14_full_14;
  wire             p14_stage_14;
  wire             p15_full_15;
  wire             p15_stage_15;
  wire             p16_full_16;
  wire             p16_stage_16;
  wire             p17_full_17;
  wire             p17_stage_17;
  wire             p18_full_18;
  wire             p18_stage_18;
  wire             p19_full_19;
  wire             p19_stage_19;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p20_full_20;
  wire             p20_stage_20;
  wire             p21_full_21;
  wire             p21_stage_21;
  wire             p22_full_22;
  wire             p22_stage_22;
  wire             p23_full_23;
  wire             p23_stage_23;
  wire             p24_full_24;
  wire             p24_stage_24;
  wire             p25_full_25;
  wire             p25_stage_25;
  wire             p26_full_26;
  wire             p26_stage_26;
  wire             p27_full_27;
  wire             p27_stage_27;
  wire             p28_full_28;
  wire             p28_stage_28;
  wire             p29_full_29;
  wire             p29_stage_29;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p30_full_30;
  wire             p30_stage_30;
  wire             p31_full_31;
  wire             p31_stage_31;
  wire             p32_full_32;
  wire             p32_stage_32;
  wire             p33_full_33;
  wire             p33_stage_33;
  wire             p34_full_34;
  wire             p34_stage_34;
  wire             p35_full_35;
  wire             p35_stage_35;
  wire             p36_full_36;
  wire             p36_stage_36;
  wire             p37_full_37;
  wire             p37_stage_37;
  wire             p38_full_38;
  wire             p38_stage_38;
  wire             p39_full_39;
  wire             p39_stage_39;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p40_full_40;
  wire             p40_stage_40;
  wire             p41_full_41;
  wire             p41_stage_41;
  wire             p42_full_42;
  wire             p42_stage_42;
  wire             p43_full_43;
  wire             p43_stage_43;
  wire             p44_full_44;
  wire             p44_stage_44;
  wire             p45_full_45;
  wire             p45_stage_45;
  wire             p46_full_46;
  wire             p46_stage_46;
  wire             p47_full_47;
  wire             p47_stage_47;
  wire             p48_full_48;
  wire             p48_stage_48;
  wire             p49_full_49;
  wire             p49_stage_49;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p50_full_50;
  wire             p50_stage_50;
  wire             p51_full_51;
  wire             p51_stage_51;
  wire             p52_full_52;
  wire             p52_stage_52;
  wire             p53_full_53;
  wire             p53_stage_53;
  wire             p54_full_54;
  wire             p54_stage_54;
  wire             p55_full_55;
  wire             p55_stage_55;
  wire             p56_full_56;
  wire             p56_stage_56;
  wire             p57_full_57;
  wire             p57_stage_57;
  wire             p58_full_58;
  wire             p58_stage_58;
  wire             p59_full_59;
  wire             p59_stage_59;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p60_full_60;
  wire             p60_stage_60;
  wire             p61_full_61;
  wire             p61_stage_61;
  wire             p62_full_62;
  wire             p62_stage_62;
  wire             p63_full_63;
  wire             p63_stage_63;
  wire             p64_full_64;
  wire             p64_stage_64;
  wire             p65_full_65;
  wire             p65_stage_65;
  wire             p66_full_66;
  wire             p66_stage_66;
  wire             p67_full_67;
  wire             p67_stage_67;
  wire             p68_full_68;
  wire             p68_stage_68;
  wire             p69_full_69;
  wire             p69_stage_69;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p70_full_70;
  wire             p70_stage_70;
  wire             p71_full_71;
  wire             p71_stage_71;
  wire             p72_full_72;
  wire             p72_stage_72;
  wire             p73_full_73;
  wire             p73_stage_73;
  wire             p74_full_74;
  wire             p74_stage_74;
  wire             p75_full_75;
  wire             p75_stage_75;
  wire             p76_full_76;
  wire             p76_stage_76;
  wire             p77_full_77;
  wire             p77_stage_77;
  wire             p78_full_78;
  wire             p78_stage_78;
  wire             p79_full_79;
  wire             p79_stage_79;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p80_full_80;
  wire             p80_stage_80;
  wire             p81_full_81;
  wire             p81_stage_81;
  wire             p82_full_82;
  wire             p82_stage_82;
  wire             p83_full_83;
  wire             p83_stage_83;
  wire             p84_full_84;
  wire             p84_stage_84;
  wire             p85_full_85;
  wire             p85_stage_85;
  wire             p86_full_86;
  wire             p86_stage_86;
  wire             p87_full_87;
  wire             p87_stage_87;
  wire             p88_full_88;
  wire             p88_stage_88;
  wire             p89_full_89;
  wire             p89_stage_89;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p90_full_90;
  wire             p90_stage_90;
  wire             p91_full_91;
  wire             p91_stage_91;
  wire             p92_full_92;
  wire             p92_stage_92;
  wire             p93_full_93;
  wire             p93_stage_93;
  wire             p94_full_94;
  wire             p94_stage_94;
  wire             p95_full_95;
  wire             p95_stage_95;
  wire             p96_full_96;
  wire             p96_stage_96;
  wire             p97_full_97;
  wire             p97_stage_97;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_10;
  reg              stage_11;
  reg              stage_12;
  reg              stage_13;
  reg              stage_14;
  reg              stage_15;
  reg              stage_16;
  reg              stage_17;
  reg              stage_18;
  reg              stage_19;
  reg              stage_2;
  reg              stage_20;
  reg              stage_21;
  reg              stage_22;
  reg              stage_23;
  reg              stage_24;
  reg              stage_25;
  reg              stage_26;
  reg              stage_27;
  reg              stage_28;
  reg              stage_29;
  reg              stage_3;
  reg              stage_30;
  reg              stage_31;
  reg              stage_32;
  reg              stage_33;
  reg              stage_34;
  reg              stage_35;
  reg              stage_36;
  reg              stage_37;
  reg              stage_38;
  reg              stage_39;
  reg              stage_4;
  reg              stage_40;
  reg              stage_41;
  reg              stage_42;
  reg              stage_43;
  reg              stage_44;
  reg              stage_45;
  reg              stage_46;
  reg              stage_47;
  reg              stage_48;
  reg              stage_49;
  reg              stage_5;
  reg              stage_50;
  reg              stage_51;
  reg              stage_52;
  reg              stage_53;
  reg              stage_54;
  reg              stage_55;
  reg              stage_56;
  reg              stage_57;
  reg              stage_58;
  reg              stage_59;
  reg              stage_6;
  reg              stage_60;
  reg              stage_61;
  reg              stage_62;
  reg              stage_63;
  reg              stage_64;
  reg              stage_65;
  reg              stage_66;
  reg              stage_67;
  reg              stage_68;
  reg              stage_69;
  reg              stage_7;
  reg              stage_70;
  reg              stage_71;
  reg              stage_72;
  reg              stage_73;
  reg              stage_74;
  reg              stage_75;
  reg              stage_76;
  reg              stage_77;
  reg              stage_78;
  reg              stage_79;
  reg              stage_8;
  reg              stage_80;
  reg              stage_81;
  reg              stage_82;
  reg              stage_83;
  reg              stage_84;
  reg              stage_85;
  reg              stage_86;
  reg              stage_87;
  reg              stage_88;
  reg              stage_89;
  reg              stage_9;
  reg              stage_90;
  reg              stage_91;
  reg              stage_92;
  reg              stage_93;
  reg              stage_94;
  reg              stage_95;
  reg              stage_96;
  reg              stage_97;
  wire    [  7: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_97;
  assign empty = !full_0;
  assign full_98 = 0;
  //data_97, which is an e_mux
  assign p97_stage_97 = ((full_98 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_97, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_97 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_97))
          if (sync_reset & full_97 & !((full_98 == 0) & read & write))
              stage_97 <= 0;
          else 
            stage_97 <= p97_stage_97;
    end


  //control_97, which is an e_mux
  assign p97_full_97 = ((read & !write) == 0)? full_96 :
    0;

  //control_reg_97, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_97 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_97 <= 0;
          else 
            full_97 <= p97_full_97;
    end


  //data_96, which is an e_mux
  assign p96_stage_96 = ((full_97 & ~clear_fifo) == 0)? data_in :
    stage_97;

  //data_reg_96, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_96 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_96))
          if (sync_reset & full_96 & !((full_97 == 0) & read & write))
              stage_96 <= 0;
          else 
            stage_96 <= p96_stage_96;
    end


  //control_96, which is an e_mux
  assign p96_full_96 = ((read & !write) == 0)? full_95 :
    full_97;

  //control_reg_96, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_96 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_96 <= 0;
          else 
            full_96 <= p96_full_96;
    end


  //data_95, which is an e_mux
  assign p95_stage_95 = ((full_96 & ~clear_fifo) == 0)? data_in :
    stage_96;

  //data_reg_95, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_95 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_95))
          if (sync_reset & full_95 & !((full_96 == 0) & read & write))
              stage_95 <= 0;
          else 
            stage_95 <= p95_stage_95;
    end


  //control_95, which is an e_mux
  assign p95_full_95 = ((read & !write) == 0)? full_94 :
    full_96;

  //control_reg_95, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_95 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_95 <= 0;
          else 
            full_95 <= p95_full_95;
    end


  //data_94, which is an e_mux
  assign p94_stage_94 = ((full_95 & ~clear_fifo) == 0)? data_in :
    stage_95;

  //data_reg_94, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_94 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_94))
          if (sync_reset & full_94 & !((full_95 == 0) & read & write))
              stage_94 <= 0;
          else 
            stage_94 <= p94_stage_94;
    end


  //control_94, which is an e_mux
  assign p94_full_94 = ((read & !write) == 0)? full_93 :
    full_95;

  //control_reg_94, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_94 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_94 <= 0;
          else 
            full_94 <= p94_full_94;
    end


  //data_93, which is an e_mux
  assign p93_stage_93 = ((full_94 & ~clear_fifo) == 0)? data_in :
    stage_94;

  //data_reg_93, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_93 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_93))
          if (sync_reset & full_93 & !((full_94 == 0) & read & write))
              stage_93 <= 0;
          else 
            stage_93 <= p93_stage_93;
    end


  //control_93, which is an e_mux
  assign p93_full_93 = ((read & !write) == 0)? full_92 :
    full_94;

  //control_reg_93, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_93 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_93 <= 0;
          else 
            full_93 <= p93_full_93;
    end


  //data_92, which is an e_mux
  assign p92_stage_92 = ((full_93 & ~clear_fifo) == 0)? data_in :
    stage_93;

  //data_reg_92, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_92 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_92))
          if (sync_reset & full_92 & !((full_93 == 0) & read & write))
              stage_92 <= 0;
          else 
            stage_92 <= p92_stage_92;
    end


  //control_92, which is an e_mux
  assign p92_full_92 = ((read & !write) == 0)? full_91 :
    full_93;

  //control_reg_92, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_92 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_92 <= 0;
          else 
            full_92 <= p92_full_92;
    end


  //data_91, which is an e_mux
  assign p91_stage_91 = ((full_92 & ~clear_fifo) == 0)? data_in :
    stage_92;

  //data_reg_91, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_91 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_91))
          if (sync_reset & full_91 & !((full_92 == 0) & read & write))
              stage_91 <= 0;
          else 
            stage_91 <= p91_stage_91;
    end


  //control_91, which is an e_mux
  assign p91_full_91 = ((read & !write) == 0)? full_90 :
    full_92;

  //control_reg_91, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_91 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_91 <= 0;
          else 
            full_91 <= p91_full_91;
    end


  //data_90, which is an e_mux
  assign p90_stage_90 = ((full_91 & ~clear_fifo) == 0)? data_in :
    stage_91;

  //data_reg_90, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_90 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_90))
          if (sync_reset & full_90 & !((full_91 == 0) & read & write))
              stage_90 <= 0;
          else 
            stage_90 <= p90_stage_90;
    end


  //control_90, which is an e_mux
  assign p90_full_90 = ((read & !write) == 0)? full_89 :
    full_91;

  //control_reg_90, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_90 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_90 <= 0;
          else 
            full_90 <= p90_full_90;
    end


  //data_89, which is an e_mux
  assign p89_stage_89 = ((full_90 & ~clear_fifo) == 0)? data_in :
    stage_90;

  //data_reg_89, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_89 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_89))
          if (sync_reset & full_89 & !((full_90 == 0) & read & write))
              stage_89 <= 0;
          else 
            stage_89 <= p89_stage_89;
    end


  //control_89, which is an e_mux
  assign p89_full_89 = ((read & !write) == 0)? full_88 :
    full_90;

  //control_reg_89, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_89 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_89 <= 0;
          else 
            full_89 <= p89_full_89;
    end


  //data_88, which is an e_mux
  assign p88_stage_88 = ((full_89 & ~clear_fifo) == 0)? data_in :
    stage_89;

  //data_reg_88, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_88 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_88))
          if (sync_reset & full_88 & !((full_89 == 0) & read & write))
              stage_88 <= 0;
          else 
            stage_88 <= p88_stage_88;
    end


  //control_88, which is an e_mux
  assign p88_full_88 = ((read & !write) == 0)? full_87 :
    full_89;

  //control_reg_88, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_88 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_88 <= 0;
          else 
            full_88 <= p88_full_88;
    end


  //data_87, which is an e_mux
  assign p87_stage_87 = ((full_88 & ~clear_fifo) == 0)? data_in :
    stage_88;

  //data_reg_87, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_87 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_87))
          if (sync_reset & full_87 & !((full_88 == 0) & read & write))
              stage_87 <= 0;
          else 
            stage_87 <= p87_stage_87;
    end


  //control_87, which is an e_mux
  assign p87_full_87 = ((read & !write) == 0)? full_86 :
    full_88;

  //control_reg_87, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_87 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_87 <= 0;
          else 
            full_87 <= p87_full_87;
    end


  //data_86, which is an e_mux
  assign p86_stage_86 = ((full_87 & ~clear_fifo) == 0)? data_in :
    stage_87;

  //data_reg_86, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_86 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_86))
          if (sync_reset & full_86 & !((full_87 == 0) & read & write))
              stage_86 <= 0;
          else 
            stage_86 <= p86_stage_86;
    end


  //control_86, which is an e_mux
  assign p86_full_86 = ((read & !write) == 0)? full_85 :
    full_87;

  //control_reg_86, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_86 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_86 <= 0;
          else 
            full_86 <= p86_full_86;
    end


  //data_85, which is an e_mux
  assign p85_stage_85 = ((full_86 & ~clear_fifo) == 0)? data_in :
    stage_86;

  //data_reg_85, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_85 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_85))
          if (sync_reset & full_85 & !((full_86 == 0) & read & write))
              stage_85 <= 0;
          else 
            stage_85 <= p85_stage_85;
    end


  //control_85, which is an e_mux
  assign p85_full_85 = ((read & !write) == 0)? full_84 :
    full_86;

  //control_reg_85, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_85 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_85 <= 0;
          else 
            full_85 <= p85_full_85;
    end


  //data_84, which is an e_mux
  assign p84_stage_84 = ((full_85 & ~clear_fifo) == 0)? data_in :
    stage_85;

  //data_reg_84, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_84 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_84))
          if (sync_reset & full_84 & !((full_85 == 0) & read & write))
              stage_84 <= 0;
          else 
            stage_84 <= p84_stage_84;
    end


  //control_84, which is an e_mux
  assign p84_full_84 = ((read & !write) == 0)? full_83 :
    full_85;

  //control_reg_84, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_84 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_84 <= 0;
          else 
            full_84 <= p84_full_84;
    end


  //data_83, which is an e_mux
  assign p83_stage_83 = ((full_84 & ~clear_fifo) == 0)? data_in :
    stage_84;

  //data_reg_83, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_83 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_83))
          if (sync_reset & full_83 & !((full_84 == 0) & read & write))
              stage_83 <= 0;
          else 
            stage_83 <= p83_stage_83;
    end


  //control_83, which is an e_mux
  assign p83_full_83 = ((read & !write) == 0)? full_82 :
    full_84;

  //control_reg_83, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_83 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_83 <= 0;
          else 
            full_83 <= p83_full_83;
    end


  //data_82, which is an e_mux
  assign p82_stage_82 = ((full_83 & ~clear_fifo) == 0)? data_in :
    stage_83;

  //data_reg_82, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_82 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_82))
          if (sync_reset & full_82 & !((full_83 == 0) & read & write))
              stage_82 <= 0;
          else 
            stage_82 <= p82_stage_82;
    end


  //control_82, which is an e_mux
  assign p82_full_82 = ((read & !write) == 0)? full_81 :
    full_83;

  //control_reg_82, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_82 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_82 <= 0;
          else 
            full_82 <= p82_full_82;
    end


  //data_81, which is an e_mux
  assign p81_stage_81 = ((full_82 & ~clear_fifo) == 0)? data_in :
    stage_82;

  //data_reg_81, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_81 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_81))
          if (sync_reset & full_81 & !((full_82 == 0) & read & write))
              stage_81 <= 0;
          else 
            stage_81 <= p81_stage_81;
    end


  //control_81, which is an e_mux
  assign p81_full_81 = ((read & !write) == 0)? full_80 :
    full_82;

  //control_reg_81, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_81 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_81 <= 0;
          else 
            full_81 <= p81_full_81;
    end


  //data_80, which is an e_mux
  assign p80_stage_80 = ((full_81 & ~clear_fifo) == 0)? data_in :
    stage_81;

  //data_reg_80, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_80 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_80))
          if (sync_reset & full_80 & !((full_81 == 0) & read & write))
              stage_80 <= 0;
          else 
            stage_80 <= p80_stage_80;
    end


  //control_80, which is an e_mux
  assign p80_full_80 = ((read & !write) == 0)? full_79 :
    full_81;

  //control_reg_80, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_80 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_80 <= 0;
          else 
            full_80 <= p80_full_80;
    end


  //data_79, which is an e_mux
  assign p79_stage_79 = ((full_80 & ~clear_fifo) == 0)? data_in :
    stage_80;

  //data_reg_79, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_79 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_79))
          if (sync_reset & full_79 & !((full_80 == 0) & read & write))
              stage_79 <= 0;
          else 
            stage_79 <= p79_stage_79;
    end


  //control_79, which is an e_mux
  assign p79_full_79 = ((read & !write) == 0)? full_78 :
    full_80;

  //control_reg_79, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_79 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_79 <= 0;
          else 
            full_79 <= p79_full_79;
    end


  //data_78, which is an e_mux
  assign p78_stage_78 = ((full_79 & ~clear_fifo) == 0)? data_in :
    stage_79;

  //data_reg_78, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_78 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_78))
          if (sync_reset & full_78 & !((full_79 == 0) & read & write))
              stage_78 <= 0;
          else 
            stage_78 <= p78_stage_78;
    end


  //control_78, which is an e_mux
  assign p78_full_78 = ((read & !write) == 0)? full_77 :
    full_79;

  //control_reg_78, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_78 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_78 <= 0;
          else 
            full_78 <= p78_full_78;
    end


  //data_77, which is an e_mux
  assign p77_stage_77 = ((full_78 & ~clear_fifo) == 0)? data_in :
    stage_78;

  //data_reg_77, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_77 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_77))
          if (sync_reset & full_77 & !((full_78 == 0) & read & write))
              stage_77 <= 0;
          else 
            stage_77 <= p77_stage_77;
    end


  //control_77, which is an e_mux
  assign p77_full_77 = ((read & !write) == 0)? full_76 :
    full_78;

  //control_reg_77, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_77 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_77 <= 0;
          else 
            full_77 <= p77_full_77;
    end


  //data_76, which is an e_mux
  assign p76_stage_76 = ((full_77 & ~clear_fifo) == 0)? data_in :
    stage_77;

  //data_reg_76, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_76 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_76))
          if (sync_reset & full_76 & !((full_77 == 0) & read & write))
              stage_76 <= 0;
          else 
            stage_76 <= p76_stage_76;
    end


  //control_76, which is an e_mux
  assign p76_full_76 = ((read & !write) == 0)? full_75 :
    full_77;

  //control_reg_76, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_76 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_76 <= 0;
          else 
            full_76 <= p76_full_76;
    end


  //data_75, which is an e_mux
  assign p75_stage_75 = ((full_76 & ~clear_fifo) == 0)? data_in :
    stage_76;

  //data_reg_75, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_75 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_75))
          if (sync_reset & full_75 & !((full_76 == 0) & read & write))
              stage_75 <= 0;
          else 
            stage_75 <= p75_stage_75;
    end


  //control_75, which is an e_mux
  assign p75_full_75 = ((read & !write) == 0)? full_74 :
    full_76;

  //control_reg_75, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_75 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_75 <= 0;
          else 
            full_75 <= p75_full_75;
    end


  //data_74, which is an e_mux
  assign p74_stage_74 = ((full_75 & ~clear_fifo) == 0)? data_in :
    stage_75;

  //data_reg_74, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_74 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_74))
          if (sync_reset & full_74 & !((full_75 == 0) & read & write))
              stage_74 <= 0;
          else 
            stage_74 <= p74_stage_74;
    end


  //control_74, which is an e_mux
  assign p74_full_74 = ((read & !write) == 0)? full_73 :
    full_75;

  //control_reg_74, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_74 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_74 <= 0;
          else 
            full_74 <= p74_full_74;
    end


  //data_73, which is an e_mux
  assign p73_stage_73 = ((full_74 & ~clear_fifo) == 0)? data_in :
    stage_74;

  //data_reg_73, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_73 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_73))
          if (sync_reset & full_73 & !((full_74 == 0) & read & write))
              stage_73 <= 0;
          else 
            stage_73 <= p73_stage_73;
    end


  //control_73, which is an e_mux
  assign p73_full_73 = ((read & !write) == 0)? full_72 :
    full_74;

  //control_reg_73, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_73 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_73 <= 0;
          else 
            full_73 <= p73_full_73;
    end


  //data_72, which is an e_mux
  assign p72_stage_72 = ((full_73 & ~clear_fifo) == 0)? data_in :
    stage_73;

  //data_reg_72, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_72 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_72))
          if (sync_reset & full_72 & !((full_73 == 0) & read & write))
              stage_72 <= 0;
          else 
            stage_72 <= p72_stage_72;
    end


  //control_72, which is an e_mux
  assign p72_full_72 = ((read & !write) == 0)? full_71 :
    full_73;

  //control_reg_72, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_72 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_72 <= 0;
          else 
            full_72 <= p72_full_72;
    end


  //data_71, which is an e_mux
  assign p71_stage_71 = ((full_72 & ~clear_fifo) == 0)? data_in :
    stage_72;

  //data_reg_71, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_71 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_71))
          if (sync_reset & full_71 & !((full_72 == 0) & read & write))
              stage_71 <= 0;
          else 
            stage_71 <= p71_stage_71;
    end


  //control_71, which is an e_mux
  assign p71_full_71 = ((read & !write) == 0)? full_70 :
    full_72;

  //control_reg_71, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_71 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_71 <= 0;
          else 
            full_71 <= p71_full_71;
    end


  //data_70, which is an e_mux
  assign p70_stage_70 = ((full_71 & ~clear_fifo) == 0)? data_in :
    stage_71;

  //data_reg_70, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_70 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_70))
          if (sync_reset & full_70 & !((full_71 == 0) & read & write))
              stage_70 <= 0;
          else 
            stage_70 <= p70_stage_70;
    end


  //control_70, which is an e_mux
  assign p70_full_70 = ((read & !write) == 0)? full_69 :
    full_71;

  //control_reg_70, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_70 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_70 <= 0;
          else 
            full_70 <= p70_full_70;
    end


  //data_69, which is an e_mux
  assign p69_stage_69 = ((full_70 & ~clear_fifo) == 0)? data_in :
    stage_70;

  //data_reg_69, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_69 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_69))
          if (sync_reset & full_69 & !((full_70 == 0) & read & write))
              stage_69 <= 0;
          else 
            stage_69 <= p69_stage_69;
    end


  //control_69, which is an e_mux
  assign p69_full_69 = ((read & !write) == 0)? full_68 :
    full_70;

  //control_reg_69, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_69 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_69 <= 0;
          else 
            full_69 <= p69_full_69;
    end


  //data_68, which is an e_mux
  assign p68_stage_68 = ((full_69 & ~clear_fifo) == 0)? data_in :
    stage_69;

  //data_reg_68, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_68 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_68))
          if (sync_reset & full_68 & !((full_69 == 0) & read & write))
              stage_68 <= 0;
          else 
            stage_68 <= p68_stage_68;
    end


  //control_68, which is an e_mux
  assign p68_full_68 = ((read & !write) == 0)? full_67 :
    full_69;

  //control_reg_68, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_68 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_68 <= 0;
          else 
            full_68 <= p68_full_68;
    end


  //data_67, which is an e_mux
  assign p67_stage_67 = ((full_68 & ~clear_fifo) == 0)? data_in :
    stage_68;

  //data_reg_67, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_67 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_67))
          if (sync_reset & full_67 & !((full_68 == 0) & read & write))
              stage_67 <= 0;
          else 
            stage_67 <= p67_stage_67;
    end


  //control_67, which is an e_mux
  assign p67_full_67 = ((read & !write) == 0)? full_66 :
    full_68;

  //control_reg_67, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_67 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_67 <= 0;
          else 
            full_67 <= p67_full_67;
    end


  //data_66, which is an e_mux
  assign p66_stage_66 = ((full_67 & ~clear_fifo) == 0)? data_in :
    stage_67;

  //data_reg_66, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_66 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_66))
          if (sync_reset & full_66 & !((full_67 == 0) & read & write))
              stage_66 <= 0;
          else 
            stage_66 <= p66_stage_66;
    end


  //control_66, which is an e_mux
  assign p66_full_66 = ((read & !write) == 0)? full_65 :
    full_67;

  //control_reg_66, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_66 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_66 <= 0;
          else 
            full_66 <= p66_full_66;
    end


  //data_65, which is an e_mux
  assign p65_stage_65 = ((full_66 & ~clear_fifo) == 0)? data_in :
    stage_66;

  //data_reg_65, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_65 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_65))
          if (sync_reset & full_65 & !((full_66 == 0) & read & write))
              stage_65 <= 0;
          else 
            stage_65 <= p65_stage_65;
    end


  //control_65, which is an e_mux
  assign p65_full_65 = ((read & !write) == 0)? full_64 :
    full_66;

  //control_reg_65, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_65 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_65 <= 0;
          else 
            full_65 <= p65_full_65;
    end


  //data_64, which is an e_mux
  assign p64_stage_64 = ((full_65 & ~clear_fifo) == 0)? data_in :
    stage_65;

  //data_reg_64, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_64 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_64))
          if (sync_reset & full_64 & !((full_65 == 0) & read & write))
              stage_64 <= 0;
          else 
            stage_64 <= p64_stage_64;
    end


  //control_64, which is an e_mux
  assign p64_full_64 = ((read & !write) == 0)? full_63 :
    full_65;

  //control_reg_64, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_64 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_64 <= 0;
          else 
            full_64 <= p64_full_64;
    end


  //data_63, which is an e_mux
  assign p63_stage_63 = ((full_64 & ~clear_fifo) == 0)? data_in :
    stage_64;

  //data_reg_63, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_63 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_63))
          if (sync_reset & full_63 & !((full_64 == 0) & read & write))
              stage_63 <= 0;
          else 
            stage_63 <= p63_stage_63;
    end


  //control_63, which is an e_mux
  assign p63_full_63 = ((read & !write) == 0)? full_62 :
    full_64;

  //control_reg_63, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_63 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_63 <= 0;
          else 
            full_63 <= p63_full_63;
    end


  //data_62, which is an e_mux
  assign p62_stage_62 = ((full_63 & ~clear_fifo) == 0)? data_in :
    stage_63;

  //data_reg_62, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_62 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_62))
          if (sync_reset & full_62 & !((full_63 == 0) & read & write))
              stage_62 <= 0;
          else 
            stage_62 <= p62_stage_62;
    end


  //control_62, which is an e_mux
  assign p62_full_62 = ((read & !write) == 0)? full_61 :
    full_63;

  //control_reg_62, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_62 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_62 <= 0;
          else 
            full_62 <= p62_full_62;
    end


  //data_61, which is an e_mux
  assign p61_stage_61 = ((full_62 & ~clear_fifo) == 0)? data_in :
    stage_62;

  //data_reg_61, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_61 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_61))
          if (sync_reset & full_61 & !((full_62 == 0) & read & write))
              stage_61 <= 0;
          else 
            stage_61 <= p61_stage_61;
    end


  //control_61, which is an e_mux
  assign p61_full_61 = ((read & !write) == 0)? full_60 :
    full_62;

  //control_reg_61, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_61 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_61 <= 0;
          else 
            full_61 <= p61_full_61;
    end


  //data_60, which is an e_mux
  assign p60_stage_60 = ((full_61 & ~clear_fifo) == 0)? data_in :
    stage_61;

  //data_reg_60, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_60 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_60))
          if (sync_reset & full_60 & !((full_61 == 0) & read & write))
              stage_60 <= 0;
          else 
            stage_60 <= p60_stage_60;
    end


  //control_60, which is an e_mux
  assign p60_full_60 = ((read & !write) == 0)? full_59 :
    full_61;

  //control_reg_60, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_60 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_60 <= 0;
          else 
            full_60 <= p60_full_60;
    end


  //data_59, which is an e_mux
  assign p59_stage_59 = ((full_60 & ~clear_fifo) == 0)? data_in :
    stage_60;

  //data_reg_59, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_59 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_59))
          if (sync_reset & full_59 & !((full_60 == 0) & read & write))
              stage_59 <= 0;
          else 
            stage_59 <= p59_stage_59;
    end


  //control_59, which is an e_mux
  assign p59_full_59 = ((read & !write) == 0)? full_58 :
    full_60;

  //control_reg_59, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_59 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_59 <= 0;
          else 
            full_59 <= p59_full_59;
    end


  //data_58, which is an e_mux
  assign p58_stage_58 = ((full_59 & ~clear_fifo) == 0)? data_in :
    stage_59;

  //data_reg_58, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_58 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_58))
          if (sync_reset & full_58 & !((full_59 == 0) & read & write))
              stage_58 <= 0;
          else 
            stage_58 <= p58_stage_58;
    end


  //control_58, which is an e_mux
  assign p58_full_58 = ((read & !write) == 0)? full_57 :
    full_59;

  //control_reg_58, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_58 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_58 <= 0;
          else 
            full_58 <= p58_full_58;
    end


  //data_57, which is an e_mux
  assign p57_stage_57 = ((full_58 & ~clear_fifo) == 0)? data_in :
    stage_58;

  //data_reg_57, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_57 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_57))
          if (sync_reset & full_57 & !((full_58 == 0) & read & write))
              stage_57 <= 0;
          else 
            stage_57 <= p57_stage_57;
    end


  //control_57, which is an e_mux
  assign p57_full_57 = ((read & !write) == 0)? full_56 :
    full_58;

  //control_reg_57, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_57 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_57 <= 0;
          else 
            full_57 <= p57_full_57;
    end


  //data_56, which is an e_mux
  assign p56_stage_56 = ((full_57 & ~clear_fifo) == 0)? data_in :
    stage_57;

  //data_reg_56, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_56 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_56))
          if (sync_reset & full_56 & !((full_57 == 0) & read & write))
              stage_56 <= 0;
          else 
            stage_56 <= p56_stage_56;
    end


  //control_56, which is an e_mux
  assign p56_full_56 = ((read & !write) == 0)? full_55 :
    full_57;

  //control_reg_56, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_56 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_56 <= 0;
          else 
            full_56 <= p56_full_56;
    end


  //data_55, which is an e_mux
  assign p55_stage_55 = ((full_56 & ~clear_fifo) == 0)? data_in :
    stage_56;

  //data_reg_55, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_55 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_55))
          if (sync_reset & full_55 & !((full_56 == 0) & read & write))
              stage_55 <= 0;
          else 
            stage_55 <= p55_stage_55;
    end


  //control_55, which is an e_mux
  assign p55_full_55 = ((read & !write) == 0)? full_54 :
    full_56;

  //control_reg_55, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_55 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_55 <= 0;
          else 
            full_55 <= p55_full_55;
    end


  //data_54, which is an e_mux
  assign p54_stage_54 = ((full_55 & ~clear_fifo) == 0)? data_in :
    stage_55;

  //data_reg_54, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_54 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_54))
          if (sync_reset & full_54 & !((full_55 == 0) & read & write))
              stage_54 <= 0;
          else 
            stage_54 <= p54_stage_54;
    end


  //control_54, which is an e_mux
  assign p54_full_54 = ((read & !write) == 0)? full_53 :
    full_55;

  //control_reg_54, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_54 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_54 <= 0;
          else 
            full_54 <= p54_full_54;
    end


  //data_53, which is an e_mux
  assign p53_stage_53 = ((full_54 & ~clear_fifo) == 0)? data_in :
    stage_54;

  //data_reg_53, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_53 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_53))
          if (sync_reset & full_53 & !((full_54 == 0) & read & write))
              stage_53 <= 0;
          else 
            stage_53 <= p53_stage_53;
    end


  //control_53, which is an e_mux
  assign p53_full_53 = ((read & !write) == 0)? full_52 :
    full_54;

  //control_reg_53, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_53 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_53 <= 0;
          else 
            full_53 <= p53_full_53;
    end


  //data_52, which is an e_mux
  assign p52_stage_52 = ((full_53 & ~clear_fifo) == 0)? data_in :
    stage_53;

  //data_reg_52, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_52 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_52))
          if (sync_reset & full_52 & !((full_53 == 0) & read & write))
              stage_52 <= 0;
          else 
            stage_52 <= p52_stage_52;
    end


  //control_52, which is an e_mux
  assign p52_full_52 = ((read & !write) == 0)? full_51 :
    full_53;

  //control_reg_52, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_52 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_52 <= 0;
          else 
            full_52 <= p52_full_52;
    end


  //data_51, which is an e_mux
  assign p51_stage_51 = ((full_52 & ~clear_fifo) == 0)? data_in :
    stage_52;

  //data_reg_51, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_51 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_51))
          if (sync_reset & full_51 & !((full_52 == 0) & read & write))
              stage_51 <= 0;
          else 
            stage_51 <= p51_stage_51;
    end


  //control_51, which is an e_mux
  assign p51_full_51 = ((read & !write) == 0)? full_50 :
    full_52;

  //control_reg_51, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_51 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_51 <= 0;
          else 
            full_51 <= p51_full_51;
    end


  //data_50, which is an e_mux
  assign p50_stage_50 = ((full_51 & ~clear_fifo) == 0)? data_in :
    stage_51;

  //data_reg_50, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_50 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_50))
          if (sync_reset & full_50 & !((full_51 == 0) & read & write))
              stage_50 <= 0;
          else 
            stage_50 <= p50_stage_50;
    end


  //control_50, which is an e_mux
  assign p50_full_50 = ((read & !write) == 0)? full_49 :
    full_51;

  //control_reg_50, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_50 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_50 <= 0;
          else 
            full_50 <= p50_full_50;
    end


  //data_49, which is an e_mux
  assign p49_stage_49 = ((full_50 & ~clear_fifo) == 0)? data_in :
    stage_50;

  //data_reg_49, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_49 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_49))
          if (sync_reset & full_49 & !((full_50 == 0) & read & write))
              stage_49 <= 0;
          else 
            stage_49 <= p49_stage_49;
    end


  //control_49, which is an e_mux
  assign p49_full_49 = ((read & !write) == 0)? full_48 :
    full_50;

  //control_reg_49, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_49 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_49 <= 0;
          else 
            full_49 <= p49_full_49;
    end


  //data_48, which is an e_mux
  assign p48_stage_48 = ((full_49 & ~clear_fifo) == 0)? data_in :
    stage_49;

  //data_reg_48, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_48 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_48))
          if (sync_reset & full_48 & !((full_49 == 0) & read & write))
              stage_48 <= 0;
          else 
            stage_48 <= p48_stage_48;
    end


  //control_48, which is an e_mux
  assign p48_full_48 = ((read & !write) == 0)? full_47 :
    full_49;

  //control_reg_48, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_48 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_48 <= 0;
          else 
            full_48 <= p48_full_48;
    end


  //data_47, which is an e_mux
  assign p47_stage_47 = ((full_48 & ~clear_fifo) == 0)? data_in :
    stage_48;

  //data_reg_47, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_47 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_47))
          if (sync_reset & full_47 & !((full_48 == 0) & read & write))
              stage_47 <= 0;
          else 
            stage_47 <= p47_stage_47;
    end


  //control_47, which is an e_mux
  assign p47_full_47 = ((read & !write) == 0)? full_46 :
    full_48;

  //control_reg_47, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_47 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_47 <= 0;
          else 
            full_47 <= p47_full_47;
    end


  //data_46, which is an e_mux
  assign p46_stage_46 = ((full_47 & ~clear_fifo) == 0)? data_in :
    stage_47;

  //data_reg_46, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_46 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_46))
          if (sync_reset & full_46 & !((full_47 == 0) & read & write))
              stage_46 <= 0;
          else 
            stage_46 <= p46_stage_46;
    end


  //control_46, which is an e_mux
  assign p46_full_46 = ((read & !write) == 0)? full_45 :
    full_47;

  //control_reg_46, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_46 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_46 <= 0;
          else 
            full_46 <= p46_full_46;
    end


  //data_45, which is an e_mux
  assign p45_stage_45 = ((full_46 & ~clear_fifo) == 0)? data_in :
    stage_46;

  //data_reg_45, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_45 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_45))
          if (sync_reset & full_45 & !((full_46 == 0) & read & write))
              stage_45 <= 0;
          else 
            stage_45 <= p45_stage_45;
    end


  //control_45, which is an e_mux
  assign p45_full_45 = ((read & !write) == 0)? full_44 :
    full_46;

  //control_reg_45, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_45 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_45 <= 0;
          else 
            full_45 <= p45_full_45;
    end


  //data_44, which is an e_mux
  assign p44_stage_44 = ((full_45 & ~clear_fifo) == 0)? data_in :
    stage_45;

  //data_reg_44, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_44 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_44))
          if (sync_reset & full_44 & !((full_45 == 0) & read & write))
              stage_44 <= 0;
          else 
            stage_44 <= p44_stage_44;
    end


  //control_44, which is an e_mux
  assign p44_full_44 = ((read & !write) == 0)? full_43 :
    full_45;

  //control_reg_44, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_44 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_44 <= 0;
          else 
            full_44 <= p44_full_44;
    end


  //data_43, which is an e_mux
  assign p43_stage_43 = ((full_44 & ~clear_fifo) == 0)? data_in :
    stage_44;

  //data_reg_43, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_43 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_43))
          if (sync_reset & full_43 & !((full_44 == 0) & read & write))
              stage_43 <= 0;
          else 
            stage_43 <= p43_stage_43;
    end


  //control_43, which is an e_mux
  assign p43_full_43 = ((read & !write) == 0)? full_42 :
    full_44;

  //control_reg_43, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_43 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_43 <= 0;
          else 
            full_43 <= p43_full_43;
    end


  //data_42, which is an e_mux
  assign p42_stage_42 = ((full_43 & ~clear_fifo) == 0)? data_in :
    stage_43;

  //data_reg_42, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_42 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_42))
          if (sync_reset & full_42 & !((full_43 == 0) & read & write))
              stage_42 <= 0;
          else 
            stage_42 <= p42_stage_42;
    end


  //control_42, which is an e_mux
  assign p42_full_42 = ((read & !write) == 0)? full_41 :
    full_43;

  //control_reg_42, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_42 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_42 <= 0;
          else 
            full_42 <= p42_full_42;
    end


  //data_41, which is an e_mux
  assign p41_stage_41 = ((full_42 & ~clear_fifo) == 0)? data_in :
    stage_42;

  //data_reg_41, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_41 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_41))
          if (sync_reset & full_41 & !((full_42 == 0) & read & write))
              stage_41 <= 0;
          else 
            stage_41 <= p41_stage_41;
    end


  //control_41, which is an e_mux
  assign p41_full_41 = ((read & !write) == 0)? full_40 :
    full_42;

  //control_reg_41, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_41 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_41 <= 0;
          else 
            full_41 <= p41_full_41;
    end


  //data_40, which is an e_mux
  assign p40_stage_40 = ((full_41 & ~clear_fifo) == 0)? data_in :
    stage_41;

  //data_reg_40, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_40 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_40))
          if (sync_reset & full_40 & !((full_41 == 0) & read & write))
              stage_40 <= 0;
          else 
            stage_40 <= p40_stage_40;
    end


  //control_40, which is an e_mux
  assign p40_full_40 = ((read & !write) == 0)? full_39 :
    full_41;

  //control_reg_40, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_40 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_40 <= 0;
          else 
            full_40 <= p40_full_40;
    end


  //data_39, which is an e_mux
  assign p39_stage_39 = ((full_40 & ~clear_fifo) == 0)? data_in :
    stage_40;

  //data_reg_39, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_39 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_39))
          if (sync_reset & full_39 & !((full_40 == 0) & read & write))
              stage_39 <= 0;
          else 
            stage_39 <= p39_stage_39;
    end


  //control_39, which is an e_mux
  assign p39_full_39 = ((read & !write) == 0)? full_38 :
    full_40;

  //control_reg_39, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_39 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_39 <= 0;
          else 
            full_39 <= p39_full_39;
    end


  //data_38, which is an e_mux
  assign p38_stage_38 = ((full_39 & ~clear_fifo) == 0)? data_in :
    stage_39;

  //data_reg_38, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_38 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_38))
          if (sync_reset & full_38 & !((full_39 == 0) & read & write))
              stage_38 <= 0;
          else 
            stage_38 <= p38_stage_38;
    end


  //control_38, which is an e_mux
  assign p38_full_38 = ((read & !write) == 0)? full_37 :
    full_39;

  //control_reg_38, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_38 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_38 <= 0;
          else 
            full_38 <= p38_full_38;
    end


  //data_37, which is an e_mux
  assign p37_stage_37 = ((full_38 & ~clear_fifo) == 0)? data_in :
    stage_38;

  //data_reg_37, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_37 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_37))
          if (sync_reset & full_37 & !((full_38 == 0) & read & write))
              stage_37 <= 0;
          else 
            stage_37 <= p37_stage_37;
    end


  //control_37, which is an e_mux
  assign p37_full_37 = ((read & !write) == 0)? full_36 :
    full_38;

  //control_reg_37, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_37 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_37 <= 0;
          else 
            full_37 <= p37_full_37;
    end


  //data_36, which is an e_mux
  assign p36_stage_36 = ((full_37 & ~clear_fifo) == 0)? data_in :
    stage_37;

  //data_reg_36, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_36 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_36))
          if (sync_reset & full_36 & !((full_37 == 0) & read & write))
              stage_36 <= 0;
          else 
            stage_36 <= p36_stage_36;
    end


  //control_36, which is an e_mux
  assign p36_full_36 = ((read & !write) == 0)? full_35 :
    full_37;

  //control_reg_36, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_36 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_36 <= 0;
          else 
            full_36 <= p36_full_36;
    end


  //data_35, which is an e_mux
  assign p35_stage_35 = ((full_36 & ~clear_fifo) == 0)? data_in :
    stage_36;

  //data_reg_35, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_35 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_35))
          if (sync_reset & full_35 & !((full_36 == 0) & read & write))
              stage_35 <= 0;
          else 
            stage_35 <= p35_stage_35;
    end


  //control_35, which is an e_mux
  assign p35_full_35 = ((read & !write) == 0)? full_34 :
    full_36;

  //control_reg_35, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_35 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_35 <= 0;
          else 
            full_35 <= p35_full_35;
    end


  //data_34, which is an e_mux
  assign p34_stage_34 = ((full_35 & ~clear_fifo) == 0)? data_in :
    stage_35;

  //data_reg_34, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_34 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_34))
          if (sync_reset & full_34 & !((full_35 == 0) & read & write))
              stage_34 <= 0;
          else 
            stage_34 <= p34_stage_34;
    end


  //control_34, which is an e_mux
  assign p34_full_34 = ((read & !write) == 0)? full_33 :
    full_35;

  //control_reg_34, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_34 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_34 <= 0;
          else 
            full_34 <= p34_full_34;
    end


  //data_33, which is an e_mux
  assign p33_stage_33 = ((full_34 & ~clear_fifo) == 0)? data_in :
    stage_34;

  //data_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_33 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_33))
          if (sync_reset & full_33 & !((full_34 == 0) & read & write))
              stage_33 <= 0;
          else 
            stage_33 <= p33_stage_33;
    end


  //control_33, which is an e_mux
  assign p33_full_33 = ((read & !write) == 0)? full_32 :
    full_34;

  //control_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_33 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_33 <= 0;
          else 
            full_33 <= p33_full_33;
    end


  //data_32, which is an e_mux
  assign p32_stage_32 = ((full_33 & ~clear_fifo) == 0)? data_in :
    stage_33;

  //data_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_32 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_32))
          if (sync_reset & full_32 & !((full_33 == 0) & read & write))
              stage_32 <= 0;
          else 
            stage_32 <= p32_stage_32;
    end


  //control_32, which is an e_mux
  assign p32_full_32 = ((read & !write) == 0)? full_31 :
    full_33;

  //control_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_32 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_32 <= 0;
          else 
            full_32 <= p32_full_32;
    end


  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    stage_32;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    full_32;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module clock_crossing_s1_arbitrator (
                                      // inputs:
                                       clk,
                                       clock_crossing_s1_endofpacket,
                                       clock_crossing_s1_readdata,
                                       clock_crossing_s1_readdatavalid,
                                       clock_crossing_s1_waitrequest,
                                       master_read_avalon_master_address_to_slave,
                                       master_read_avalon_master_burstcount,
                                       master_read_avalon_master_read,
                                       master_read_latency_counter,
                                       master_write_avalon_master_address_to_slave,
                                       master_write_avalon_master_burstcount,
                                       master_write_avalon_master_byteenable,
                                       master_write_avalon_master_write,
                                       master_write_avalon_master_writedata,
                                       reset_n,

                                      // outputs:
                                       clock_crossing_s1_address,
                                       clock_crossing_s1_burstcount,
                                       clock_crossing_s1_byteenable,
                                       clock_crossing_s1_endofpacket_from_sa,
                                       clock_crossing_s1_nativeaddress,
                                       clock_crossing_s1_read,
                                       clock_crossing_s1_readdata_from_sa,
                                       clock_crossing_s1_reset_n,
                                       clock_crossing_s1_waitrequest_from_sa,
                                       clock_crossing_s1_write,
                                       clock_crossing_s1_writedata,
                                       d1_clock_crossing_s1_end_xfer,
                                       master_read_granted_clock_crossing_s1,
                                       master_read_qualified_request_clock_crossing_s1,
                                       master_read_read_data_valid_clock_crossing_s1,
                                       master_read_read_data_valid_clock_crossing_s1_shift_register,
                                       master_read_requests_clock_crossing_s1,
                                       master_write_granted_clock_crossing_s1,
                                       master_write_qualified_request_clock_crossing_s1,
                                       master_write_requests_clock_crossing_s1
                                    )
;

  output  [ 27: 0] clock_crossing_s1_address;
  output  [  1: 0] clock_crossing_s1_burstcount;
  output  [  3: 0] clock_crossing_s1_byteenable;
  output           clock_crossing_s1_endofpacket_from_sa;
  output  [ 27: 0] clock_crossing_s1_nativeaddress;
  output           clock_crossing_s1_read;
  output  [ 31: 0] clock_crossing_s1_readdata_from_sa;
  output           clock_crossing_s1_reset_n;
  output           clock_crossing_s1_waitrequest_from_sa;
  output           clock_crossing_s1_write;
  output  [ 31: 0] clock_crossing_s1_writedata;
  output           d1_clock_crossing_s1_end_xfer;
  output           master_read_granted_clock_crossing_s1;
  output           master_read_qualified_request_clock_crossing_s1;
  output           master_read_read_data_valid_clock_crossing_s1;
  output           master_read_read_data_valid_clock_crossing_s1_shift_register;
  output           master_read_requests_clock_crossing_s1;
  output           master_write_granted_clock_crossing_s1;
  output           master_write_qualified_request_clock_crossing_s1;
  output           master_write_requests_clock_crossing_s1;
  input            clk;
  input            clock_crossing_s1_endofpacket;
  input   [ 31: 0] clock_crossing_s1_readdata;
  input            clock_crossing_s1_readdatavalid;
  input            clock_crossing_s1_waitrequest;
  input   [ 29: 0] master_read_avalon_master_address_to_slave;
  input            master_read_avalon_master_burstcount;
  input            master_read_avalon_master_read;
  input            master_read_latency_counter;
  input   [ 29: 0] master_write_avalon_master_address_to_slave;
  input            master_write_avalon_master_burstcount;
  input   [  3: 0] master_write_avalon_master_byteenable;
  input            master_write_avalon_master_write;
  input   [ 31: 0] master_write_avalon_master_writedata;
  input            reset_n;

  wire    [ 27: 0] clock_crossing_s1_address;
  wire             clock_crossing_s1_allgrants;
  wire             clock_crossing_s1_allow_new_arb_cycle;
  wire             clock_crossing_s1_any_bursting_master_saved_grant;
  wire             clock_crossing_s1_any_continuerequest;
  reg     [  1: 0] clock_crossing_s1_arb_addend;
  wire             clock_crossing_s1_arb_counter_enable;
  reg              clock_crossing_s1_arb_share_counter;
  wire             clock_crossing_s1_arb_share_counter_next_value;
  wire             clock_crossing_s1_arb_share_set_values;
  wire    [  1: 0] clock_crossing_s1_arb_winner;
  wire             clock_crossing_s1_arbitration_holdoff_internal;
  reg              clock_crossing_s1_bbt_burstcounter;
  wire             clock_crossing_s1_beginbursttransfer_internal;
  wire             clock_crossing_s1_begins_xfer;
  wire    [  1: 0] clock_crossing_s1_burstcount;
  wire    [  3: 0] clock_crossing_s1_byteenable;
  wire    [  3: 0] clock_crossing_s1_chosen_master_double_vector;
  wire    [  1: 0] clock_crossing_s1_chosen_master_rot_left;
  wire             clock_crossing_s1_end_xfer;
  wire             clock_crossing_s1_endofpacket_from_sa;
  wire             clock_crossing_s1_firsttransfer;
  wire    [  1: 0] clock_crossing_s1_grant_vector;
  wire             clock_crossing_s1_in_a_read_cycle;
  wire             clock_crossing_s1_in_a_write_cycle;
  wire    [  1: 0] clock_crossing_s1_master_qreq_vector;
  wire             clock_crossing_s1_move_on_to_next_transaction;
  wire    [ 27: 0] clock_crossing_s1_nativeaddress;
  wire             clock_crossing_s1_next_bbt_burstcount;
  wire             clock_crossing_s1_non_bursting_master_requests;
  wire             clock_crossing_s1_read;
  wire    [ 31: 0] clock_crossing_s1_readdata_from_sa;
  wire             clock_crossing_s1_readdatavalid_from_sa;
  reg              clock_crossing_s1_reg_firsttransfer;
  wire             clock_crossing_s1_reset_n;
  reg     [  1: 0] clock_crossing_s1_saved_chosen_master_vector;
  reg              clock_crossing_s1_slavearbiterlockenable;
  wire             clock_crossing_s1_slavearbiterlockenable2;
  wire             clock_crossing_s1_unreg_firsttransfer;
  wire             clock_crossing_s1_waitrequest_from_sa;
  wire             clock_crossing_s1_waits_for_read;
  wire             clock_crossing_s1_waits_for_write;
  wire             clock_crossing_s1_write;
  wire    [ 31: 0] clock_crossing_s1_writedata;
  reg              d1_clock_crossing_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_clock_crossing_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_master_read_avalon_master_granted_slave_clock_crossing_s1;
  reg              last_cycle_master_write_avalon_master_granted_slave_clock_crossing_s1;
  wire             master_read_avalon_master_arbiterlock;
  wire             master_read_avalon_master_arbiterlock2;
  wire             master_read_avalon_master_continuerequest;
  wire             master_read_granted_clock_crossing_s1;
  wire             master_read_qualified_request_clock_crossing_s1;
  wire             master_read_rdv_fifo_empty_clock_crossing_s1;
  wire             master_read_rdv_fifo_output_from_clock_crossing_s1;
  wire             master_read_read_data_valid_clock_crossing_s1;
  wire             master_read_read_data_valid_clock_crossing_s1_shift_register;
  wire             master_read_requests_clock_crossing_s1;
  wire             master_read_saved_grant_clock_crossing_s1;
  wire             master_write_avalon_master_arbiterlock;
  wire             master_write_avalon_master_arbiterlock2;
  wire             master_write_avalon_master_continuerequest;
  wire             master_write_granted_clock_crossing_s1;
  wire             master_write_qualified_request_clock_crossing_s1;
  wire             master_write_requests_clock_crossing_s1;
  wire             master_write_saved_grant_clock_crossing_s1;
  wire    [ 29: 0] shifted_address_to_clock_crossing_s1_from_master_read_avalon_master;
  wire    [ 29: 0] shifted_address_to_clock_crossing_s1_from_master_write_avalon_master;
  wire             wait_for_clock_crossing_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~clock_crossing_s1_end_xfer;
    end


  assign clock_crossing_s1_begins_xfer = ~d1_reasons_to_wait & ((master_read_qualified_request_clock_crossing_s1 | master_write_qualified_request_clock_crossing_s1));
  //assign clock_crossing_s1_readdata_from_sa = clock_crossing_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign clock_crossing_s1_readdata_from_sa = clock_crossing_s1_readdata;

  assign master_read_requests_clock_crossing_s1 = ((1) & (master_read_avalon_master_read)) & master_read_avalon_master_read;
  //assign clock_crossing_s1_waitrequest_from_sa = clock_crossing_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign clock_crossing_s1_waitrequest_from_sa = clock_crossing_s1_waitrequest;

  //assign clock_crossing_s1_readdatavalid_from_sa = clock_crossing_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign clock_crossing_s1_readdatavalid_from_sa = clock_crossing_s1_readdatavalid;

  //clock_crossing_s1_arb_share_counter set values, which is an e_mux
  assign clock_crossing_s1_arb_share_set_values = 1;

  //clock_crossing_s1_non_bursting_master_requests mux, which is an e_mux
  assign clock_crossing_s1_non_bursting_master_requests = master_read_requests_clock_crossing_s1 |
    master_write_requests_clock_crossing_s1 |
    master_read_requests_clock_crossing_s1 |
    master_write_requests_clock_crossing_s1;

  //clock_crossing_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign clock_crossing_s1_any_bursting_master_saved_grant = 0;

  //clock_crossing_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign clock_crossing_s1_arb_share_counter_next_value = clock_crossing_s1_firsttransfer ? (clock_crossing_s1_arb_share_set_values - 1) : |clock_crossing_s1_arb_share_counter ? (clock_crossing_s1_arb_share_counter - 1) : 0;

  //clock_crossing_s1_allgrants all slave grants, which is an e_mux
  assign clock_crossing_s1_allgrants = (|clock_crossing_s1_grant_vector) |
    (|clock_crossing_s1_grant_vector) |
    (|clock_crossing_s1_grant_vector) |
    (|clock_crossing_s1_grant_vector);

  //clock_crossing_s1_end_xfer assignment, which is an e_assign
  assign clock_crossing_s1_end_xfer = ~(clock_crossing_s1_waits_for_read | clock_crossing_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_clock_crossing_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_clock_crossing_s1 = clock_crossing_s1_end_xfer & (~clock_crossing_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //clock_crossing_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign clock_crossing_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_clock_crossing_s1 & clock_crossing_s1_allgrants) | (end_xfer_arb_share_counter_term_clock_crossing_s1 & ~clock_crossing_s1_non_bursting_master_requests);

  //clock_crossing_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_s1_arb_share_counter <= 0;
      else if (clock_crossing_s1_arb_counter_enable)
          clock_crossing_s1_arb_share_counter <= clock_crossing_s1_arb_share_counter_next_value;
    end


  //clock_crossing_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_s1_slavearbiterlockenable <= 0;
      else if ((|clock_crossing_s1_master_qreq_vector & end_xfer_arb_share_counter_term_clock_crossing_s1) | (end_xfer_arb_share_counter_term_clock_crossing_s1 & ~clock_crossing_s1_non_bursting_master_requests))
          clock_crossing_s1_slavearbiterlockenable <= |clock_crossing_s1_arb_share_counter_next_value;
    end


  //master_read/avalon_master clock_crossing/s1 arbiterlock, which is an e_assign
  assign master_read_avalon_master_arbiterlock = clock_crossing_s1_slavearbiterlockenable & master_read_avalon_master_continuerequest;

  //clock_crossing_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign clock_crossing_s1_slavearbiterlockenable2 = |clock_crossing_s1_arb_share_counter_next_value;

  //master_read/avalon_master clock_crossing/s1 arbiterlock2, which is an e_assign
  assign master_read_avalon_master_arbiterlock2 = clock_crossing_s1_slavearbiterlockenable2 & master_read_avalon_master_continuerequest;

  //master_write/avalon_master clock_crossing/s1 arbiterlock, which is an e_assign
  assign master_write_avalon_master_arbiterlock = clock_crossing_s1_slavearbiterlockenable & master_write_avalon_master_continuerequest;

  //master_write/avalon_master clock_crossing/s1 arbiterlock2, which is an e_assign
  assign master_write_avalon_master_arbiterlock2 = clock_crossing_s1_slavearbiterlockenable2 & master_write_avalon_master_continuerequest;

  //master_write/avalon_master granted clock_crossing/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_master_write_avalon_master_granted_slave_clock_crossing_s1 <= 0;
      else 
        last_cycle_master_write_avalon_master_granted_slave_clock_crossing_s1 <= master_write_saved_grant_clock_crossing_s1 ? 1 : (clock_crossing_s1_arbitration_holdoff_internal | ~master_write_requests_clock_crossing_s1) ? 0 : last_cycle_master_write_avalon_master_granted_slave_clock_crossing_s1;
    end


  //master_write_avalon_master_continuerequest continued request, which is an e_mux
  assign master_write_avalon_master_continuerequest = last_cycle_master_write_avalon_master_granted_slave_clock_crossing_s1 & master_write_requests_clock_crossing_s1;

  //clock_crossing_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign clock_crossing_s1_any_continuerequest = master_write_avalon_master_continuerequest |
    master_read_avalon_master_continuerequest;

  assign master_read_qualified_request_clock_crossing_s1 = master_read_requests_clock_crossing_s1 & ~((master_read_avalon_master_read & ((master_read_latency_counter != 0) | (1 < master_read_latency_counter))) | master_write_avalon_master_arbiterlock);
  //unique name for clock_crossing_s1_move_on_to_next_transaction, which is an e_assign
  assign clock_crossing_s1_move_on_to_next_transaction = clock_crossing_s1_readdatavalid_from_sa;

  //rdv_fifo_for_master_read_avalon_master_to_clock_crossing_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_master_read_avalon_master_to_clock_crossing_s1_module rdv_fifo_for_master_read_avalon_master_to_clock_crossing_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (master_read_granted_clock_crossing_s1),
      .data_out             (master_read_rdv_fifo_output_from_clock_crossing_s1),
      .empty                (),
      .fifo_contains_ones_n (master_read_rdv_fifo_empty_clock_crossing_s1),
      .full                 (),
      .read                 (clock_crossing_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~clock_crossing_s1_waits_for_read)
    );

  assign master_read_read_data_valid_clock_crossing_s1_shift_register = ~master_read_rdv_fifo_empty_clock_crossing_s1;
  //local readdatavalid master_read_read_data_valid_clock_crossing_s1, which is an e_mux
  assign master_read_read_data_valid_clock_crossing_s1 = (clock_crossing_s1_readdatavalid_from_sa & master_read_rdv_fifo_output_from_clock_crossing_s1) & ~ master_read_rdv_fifo_empty_clock_crossing_s1;

  //assign clock_crossing_s1_endofpacket_from_sa = clock_crossing_s1_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign clock_crossing_s1_endofpacket_from_sa = clock_crossing_s1_endofpacket;

  assign master_write_requests_clock_crossing_s1 = ((1) & (master_write_avalon_master_write)) & master_write_avalon_master_write;
  //master_read/avalon_master granted clock_crossing/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_master_read_avalon_master_granted_slave_clock_crossing_s1 <= 0;
      else 
        last_cycle_master_read_avalon_master_granted_slave_clock_crossing_s1 <= master_read_saved_grant_clock_crossing_s1 ? 1 : (clock_crossing_s1_arbitration_holdoff_internal | ~master_read_requests_clock_crossing_s1) ? 0 : last_cycle_master_read_avalon_master_granted_slave_clock_crossing_s1;
    end


  //master_read_avalon_master_continuerequest continued request, which is an e_mux
  assign master_read_avalon_master_continuerequest = last_cycle_master_read_avalon_master_granted_slave_clock_crossing_s1 & master_read_requests_clock_crossing_s1;

  assign master_write_qualified_request_clock_crossing_s1 = master_write_requests_clock_crossing_s1 & ~(master_read_avalon_master_arbiterlock);
  //clock_crossing_s1_writedata mux, which is an e_mux
  assign clock_crossing_s1_writedata = master_write_avalon_master_writedata;

  //allow new arb cycle for clock_crossing/s1, which is an e_assign
  assign clock_crossing_s1_allow_new_arb_cycle = ~master_read_avalon_master_arbiterlock & ~master_write_avalon_master_arbiterlock;

  //master_write/avalon_master assignment into master qualified-requests vector for clock_crossing/s1, which is an e_assign
  assign clock_crossing_s1_master_qreq_vector[0] = master_write_qualified_request_clock_crossing_s1;

  //master_write/avalon_master grant clock_crossing/s1, which is an e_assign
  assign master_write_granted_clock_crossing_s1 = clock_crossing_s1_grant_vector[0];

  //master_write/avalon_master saved-grant clock_crossing/s1, which is an e_assign
  assign master_write_saved_grant_clock_crossing_s1 = clock_crossing_s1_arb_winner[0] && master_write_requests_clock_crossing_s1;

  //master_read/avalon_master assignment into master qualified-requests vector for clock_crossing/s1, which is an e_assign
  assign clock_crossing_s1_master_qreq_vector[1] = master_read_qualified_request_clock_crossing_s1;

  //master_read/avalon_master grant clock_crossing/s1, which is an e_assign
  assign master_read_granted_clock_crossing_s1 = clock_crossing_s1_grant_vector[1];

  //master_read/avalon_master saved-grant clock_crossing/s1, which is an e_assign
  assign master_read_saved_grant_clock_crossing_s1 = clock_crossing_s1_arb_winner[1] && master_read_requests_clock_crossing_s1;

  //clock_crossing/s1 chosen-master double-vector, which is an e_assign
  assign clock_crossing_s1_chosen_master_double_vector = {clock_crossing_s1_master_qreq_vector, clock_crossing_s1_master_qreq_vector} & ({~clock_crossing_s1_master_qreq_vector, ~clock_crossing_s1_master_qreq_vector} + clock_crossing_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign clock_crossing_s1_arb_winner = (clock_crossing_s1_allow_new_arb_cycle & | clock_crossing_s1_grant_vector) ? clock_crossing_s1_grant_vector : clock_crossing_s1_saved_chosen_master_vector;

  //saved clock_crossing_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_s1_saved_chosen_master_vector <= 0;
      else if (clock_crossing_s1_allow_new_arb_cycle)
          clock_crossing_s1_saved_chosen_master_vector <= |clock_crossing_s1_grant_vector ? clock_crossing_s1_grant_vector : clock_crossing_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign clock_crossing_s1_grant_vector = {(clock_crossing_s1_chosen_master_double_vector[1] | clock_crossing_s1_chosen_master_double_vector[3]),
    (clock_crossing_s1_chosen_master_double_vector[0] | clock_crossing_s1_chosen_master_double_vector[2])};

  //clock_crossing/s1 chosen master rotated left, which is an e_assign
  assign clock_crossing_s1_chosen_master_rot_left = (clock_crossing_s1_arb_winner << 1) ? (clock_crossing_s1_arb_winner << 1) : 1;

  //clock_crossing/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_s1_arb_addend <= 1;
      else if (|clock_crossing_s1_grant_vector)
          clock_crossing_s1_arb_addend <= clock_crossing_s1_end_xfer? clock_crossing_s1_chosen_master_rot_left : clock_crossing_s1_grant_vector;
    end


  //clock_crossing_s1_reset_n assignment, which is an e_assign
  assign clock_crossing_s1_reset_n = reset_n;

  //clock_crossing_s1_firsttransfer first transaction, which is an e_assign
  assign clock_crossing_s1_firsttransfer = clock_crossing_s1_begins_xfer ? clock_crossing_s1_unreg_firsttransfer : clock_crossing_s1_reg_firsttransfer;

  //clock_crossing_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign clock_crossing_s1_unreg_firsttransfer = ~(clock_crossing_s1_slavearbiterlockenable & clock_crossing_s1_any_continuerequest);

  //clock_crossing_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_s1_reg_firsttransfer <= 1'b1;
      else if (clock_crossing_s1_begins_xfer)
          clock_crossing_s1_reg_firsttransfer <= clock_crossing_s1_unreg_firsttransfer;
    end


  //clock_crossing_s1_next_bbt_burstcount next_bbt_burstcount, which is an e_mux
  assign clock_crossing_s1_next_bbt_burstcount = ((((clock_crossing_s1_write) && (clock_crossing_s1_bbt_burstcounter == 0))))? (clock_crossing_s1_burstcount - 1) :
    ((((clock_crossing_s1_read) && (clock_crossing_s1_bbt_burstcounter == 0))))? 0 :
    (clock_crossing_s1_bbt_burstcounter - 1);

  //clock_crossing_s1_bbt_burstcounter bbt_burstcounter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_s1_bbt_burstcounter <= 0;
      else if (clock_crossing_s1_begins_xfer)
          clock_crossing_s1_bbt_burstcounter <= clock_crossing_s1_next_bbt_burstcount;
    end


  //clock_crossing_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign clock_crossing_s1_beginbursttransfer_internal = clock_crossing_s1_begins_xfer & (clock_crossing_s1_bbt_burstcounter == 0);

  //clock_crossing_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign clock_crossing_s1_arbitration_holdoff_internal = clock_crossing_s1_begins_xfer & clock_crossing_s1_firsttransfer;

  //clock_crossing_s1_read assignment, which is an e_mux
  assign clock_crossing_s1_read = master_read_granted_clock_crossing_s1 & master_read_avalon_master_read;

  //clock_crossing_s1_write assignment, which is an e_mux
  assign clock_crossing_s1_write = master_write_granted_clock_crossing_s1 & master_write_avalon_master_write;

  assign shifted_address_to_clock_crossing_s1_from_master_read_avalon_master = master_read_avalon_master_address_to_slave;
  //clock_crossing_s1_address mux, which is an e_mux
  assign clock_crossing_s1_address = (master_read_granted_clock_crossing_s1)? (shifted_address_to_clock_crossing_s1_from_master_read_avalon_master >> 2) :
    (shifted_address_to_clock_crossing_s1_from_master_write_avalon_master >> 2);

  assign shifted_address_to_clock_crossing_s1_from_master_write_avalon_master = master_write_avalon_master_address_to_slave;
  //slaveid clock_crossing_s1_nativeaddress nativeaddress mux, which is an e_mux
  assign clock_crossing_s1_nativeaddress = (master_read_granted_clock_crossing_s1)? (master_read_avalon_master_address_to_slave >> 2) :
    (master_write_avalon_master_address_to_slave >> 2);

  //d1_clock_crossing_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_clock_crossing_s1_end_xfer <= 1;
      else 
        d1_clock_crossing_s1_end_xfer <= clock_crossing_s1_end_xfer;
    end


  //clock_crossing_s1_waits_for_read in a cycle, which is an e_mux
  assign clock_crossing_s1_waits_for_read = clock_crossing_s1_in_a_read_cycle & clock_crossing_s1_waitrequest_from_sa;

  //clock_crossing_s1_in_a_read_cycle assignment, which is an e_assign
  assign clock_crossing_s1_in_a_read_cycle = master_read_granted_clock_crossing_s1 & master_read_avalon_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = clock_crossing_s1_in_a_read_cycle;

  //clock_crossing_s1_waits_for_write in a cycle, which is an e_mux
  assign clock_crossing_s1_waits_for_write = clock_crossing_s1_in_a_write_cycle & clock_crossing_s1_waitrequest_from_sa;

  //clock_crossing_s1_in_a_write_cycle assignment, which is an e_assign
  assign clock_crossing_s1_in_a_write_cycle = master_write_granted_clock_crossing_s1 & master_write_avalon_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = clock_crossing_s1_in_a_write_cycle;

  assign wait_for_clock_crossing_s1_counter = 0;
  //clock_crossing_s1_byteenable byte enable port mux, which is an e_mux
  assign clock_crossing_s1_byteenable = (master_write_granted_clock_crossing_s1)? master_write_avalon_master_byteenable :
    -1;

  //burstcount mux, which is an e_mux
  assign clock_crossing_s1_burstcount = (master_read_granted_clock_crossing_s1)? master_read_avalon_master_burstcount :
    (master_write_granted_clock_crossing_s1)? master_write_avalon_master_burstcount :
    1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //clock_crossing/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //master_read/avalon_master non-zero burstcount assertion, which is an e_process
  always @(posedge clk)
    begin
      if (master_read_requests_clock_crossing_s1 && (master_read_avalon_master_burstcount == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: master_read/avalon_master drove 0 on its 'burstcount' port while accessing slave clock_crossing/s1", $time);
          $stop;
        end
    end


  //master_write/avalon_master non-zero burstcount assertion, which is an e_process
  always @(posedge clk)
    begin
      if (master_write_requests_clock_crossing_s1 && (master_write_avalon_master_burstcount == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: master_write/avalon_master drove 0 on its 'burstcount' port while accessing slave clock_crossing/s1", $time);
          $stop;
        end
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (master_read_granted_clock_crossing_s1 + master_write_granted_clock_crossing_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (master_read_saved_grant_clock_crossing_s1 + master_write_saved_grant_clock_crossing_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo_module (
                                                                                // inputs:
                                                                                 clear_fifo,
                                                                                 clk,
                                                                                 data_in,
                                                                                 read,
                                                                                 reset_n,
                                                                                 sync_reset,
                                                                                 write,

                                                                                // outputs:
                                                                                 data_out,
                                                                                 empty,
                                                                                 fifo_contains_ones_n,
                                                                                 full
                                                                              )
;

  output  [  2: 0] data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input   [  2: 0] data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire    [  2: 0] data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  reg              full_32;
  reg              full_33;
  wire             full_34;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  6: 0] how_many_ones;
  wire    [  6: 0] one_count_minus_one;
  wire    [  6: 0] one_count_plus_one;
  wire             p0_full_0;
  wire    [  2: 0] p0_stage_0;
  wire             p10_full_10;
  wire    [  2: 0] p10_stage_10;
  wire             p11_full_11;
  wire    [  2: 0] p11_stage_11;
  wire             p12_full_12;
  wire    [  2: 0] p12_stage_12;
  wire             p13_full_13;
  wire    [  2: 0] p13_stage_13;
  wire             p14_full_14;
  wire    [  2: 0] p14_stage_14;
  wire             p15_full_15;
  wire    [  2: 0] p15_stage_15;
  wire             p16_full_16;
  wire    [  2: 0] p16_stage_16;
  wire             p17_full_17;
  wire    [  2: 0] p17_stage_17;
  wire             p18_full_18;
  wire    [  2: 0] p18_stage_18;
  wire             p19_full_19;
  wire    [  2: 0] p19_stage_19;
  wire             p1_full_1;
  wire    [  2: 0] p1_stage_1;
  wire             p20_full_20;
  wire    [  2: 0] p20_stage_20;
  wire             p21_full_21;
  wire    [  2: 0] p21_stage_21;
  wire             p22_full_22;
  wire    [  2: 0] p22_stage_22;
  wire             p23_full_23;
  wire    [  2: 0] p23_stage_23;
  wire             p24_full_24;
  wire    [  2: 0] p24_stage_24;
  wire             p25_full_25;
  wire    [  2: 0] p25_stage_25;
  wire             p26_full_26;
  wire    [  2: 0] p26_stage_26;
  wire             p27_full_27;
  wire    [  2: 0] p27_stage_27;
  wire             p28_full_28;
  wire    [  2: 0] p28_stage_28;
  wire             p29_full_29;
  wire    [  2: 0] p29_stage_29;
  wire             p2_full_2;
  wire    [  2: 0] p2_stage_2;
  wire             p30_full_30;
  wire    [  2: 0] p30_stage_30;
  wire             p31_full_31;
  wire    [  2: 0] p31_stage_31;
  wire             p32_full_32;
  wire    [  2: 0] p32_stage_32;
  wire             p33_full_33;
  wire    [  2: 0] p33_stage_33;
  wire             p3_full_3;
  wire    [  2: 0] p3_stage_3;
  wire             p4_full_4;
  wire    [  2: 0] p4_stage_4;
  wire             p5_full_5;
  wire    [  2: 0] p5_stage_5;
  wire             p6_full_6;
  wire    [  2: 0] p6_stage_6;
  wire             p7_full_7;
  wire    [  2: 0] p7_stage_7;
  wire             p8_full_8;
  wire    [  2: 0] p8_stage_8;
  wire             p9_full_9;
  wire    [  2: 0] p9_stage_9;
  reg     [  2: 0] stage_0;
  reg     [  2: 0] stage_1;
  reg     [  2: 0] stage_10;
  reg     [  2: 0] stage_11;
  reg     [  2: 0] stage_12;
  reg     [  2: 0] stage_13;
  reg     [  2: 0] stage_14;
  reg     [  2: 0] stage_15;
  reg     [  2: 0] stage_16;
  reg     [  2: 0] stage_17;
  reg     [  2: 0] stage_18;
  reg     [  2: 0] stage_19;
  reg     [  2: 0] stage_2;
  reg     [  2: 0] stage_20;
  reg     [  2: 0] stage_21;
  reg     [  2: 0] stage_22;
  reg     [  2: 0] stage_23;
  reg     [  2: 0] stage_24;
  reg     [  2: 0] stage_25;
  reg     [  2: 0] stage_26;
  reg     [  2: 0] stage_27;
  reg     [  2: 0] stage_28;
  reg     [  2: 0] stage_29;
  reg     [  2: 0] stage_3;
  reg     [  2: 0] stage_30;
  reg     [  2: 0] stage_31;
  reg     [  2: 0] stage_32;
  reg     [  2: 0] stage_33;
  reg     [  2: 0] stage_4;
  reg     [  2: 0] stage_5;
  reg     [  2: 0] stage_6;
  reg     [  2: 0] stage_7;
  reg     [  2: 0] stage_8;
  reg     [  2: 0] stage_9;
  wire    [  6: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_33;
  assign empty = !full_0;
  assign full_34 = 0;
  //data_33, which is an e_mux
  assign p33_stage_33 = ((full_34 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_33 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_33))
          if (sync_reset & full_33 & !((full_34 == 0) & read & write))
              stage_33 <= 0;
          else 
            stage_33 <= p33_stage_33;
    end


  //control_33, which is an e_mux
  assign p33_full_33 = ((read & !write) == 0)? full_32 :
    0;

  //control_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_33 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_33 <= 0;
          else 
            full_33 <= p33_full_33;
    end


  //data_32, which is an e_mux
  assign p32_stage_32 = ((full_33 & ~clear_fifo) == 0)? data_in :
    stage_33;

  //data_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_32 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_32))
          if (sync_reset & full_32 & !((full_33 == 0) & read & write))
              stage_32 <= 0;
          else 
            stage_32 <= p32_stage_32;
    end


  //control_32, which is an e_mux
  assign p32_full_32 = ((read & !write) == 0)? full_31 :
    full_33;

  //control_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_32 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_32 <= 0;
          else 
            full_32 <= p32_full_32;
    end


  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    stage_32;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    full_32;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module clock_crossing_m1_arbitrator (
                                      // inputs:
                                       DE4_SOPC_burst_0_upstream_readdata_from_sa,
                                       DE4_SOPC_burst_0_upstream_waitrequest_from_sa,
                                       clk,
                                       clock_crossing_m1_address,
                                       clock_crossing_m1_burstcount,
                                       clock_crossing_m1_byteenable,
                                       clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream,
                                       clock_crossing_m1_qualified_request_DE4_SOPC_burst_0_upstream,
                                       clock_crossing_m1_read,
                                       clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream,
                                       clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream_shift_register,
                                       clock_crossing_m1_requests_DE4_SOPC_burst_0_upstream,
                                       clock_crossing_m1_write,
                                       clock_crossing_m1_writedata,
                                       d1_DE4_SOPC_burst_0_upstream_end_xfer,
                                       reset_n,

                                      // outputs:
                                       clock_crossing_m1_address_to_slave,
                                       clock_crossing_m1_latency_counter,
                                       clock_crossing_m1_readdata,
                                       clock_crossing_m1_readdatavalid,
                                       clock_crossing_m1_reset_n,
                                       clock_crossing_m1_waitrequest
                                    )
;

  output  [ 29: 0] clock_crossing_m1_address_to_slave;
  output           clock_crossing_m1_latency_counter;
  output  [ 31: 0] clock_crossing_m1_readdata;
  output           clock_crossing_m1_readdatavalid;
  output           clock_crossing_m1_reset_n;
  output           clock_crossing_m1_waitrequest;
  input   [255: 0] DE4_SOPC_burst_0_upstream_readdata_from_sa;
  input            DE4_SOPC_burst_0_upstream_waitrequest_from_sa;
  input            clk;
  input   [ 29: 0] clock_crossing_m1_address;
  input   [  1: 0] clock_crossing_m1_burstcount;
  input   [  3: 0] clock_crossing_m1_byteenable;
  input            clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream;
  input            clock_crossing_m1_qualified_request_DE4_SOPC_burst_0_upstream;
  input            clock_crossing_m1_read;
  input            clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream;
  input            clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream_shift_register;
  input            clock_crossing_m1_requests_DE4_SOPC_burst_0_upstream;
  input            clock_crossing_m1_write;
  input   [ 31: 0] clock_crossing_m1_writedata;
  input            d1_DE4_SOPC_burst_0_upstream_end_xfer;
  input            reset_n;

  wire    [ 31: 0] DE4_SOPC_burst_0_upstream_readdata_from_sa_part_selected_by_negative_dbs;
  reg              active_and_waiting_last_time;
  reg     [ 29: 0] clock_crossing_m1_address_last_time;
  wire    [ 29: 0] clock_crossing_m1_address_to_slave;
  reg     [  1: 0] clock_crossing_m1_burstcount_last_time;
  reg     [  3: 0] clock_crossing_m1_byteenable_last_time;
  wire             clock_crossing_m1_latency_counter;
  reg              clock_crossing_m1_read_last_time;
  wire    [ 31: 0] clock_crossing_m1_readdata;
  wire             clock_crossing_m1_readdatavalid;
  wire             clock_crossing_m1_reset_n;
  wire             clock_crossing_m1_run;
  wire             clock_crossing_m1_waitrequest;
  reg              clock_crossing_m1_write_last_time;
  reg     [ 31: 0] clock_crossing_m1_writedata_last_time;
  wire             empty_selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo;
  wire             full_selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo;
  wire             pre_flush_clock_crossing_m1_readdatavalid;
  wire             r_0;
  wire             read_selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo;
  wire    [  2: 0] selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo_output;
  wire    [  2: 0] selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo_output_DE4_SOPC_burst_0_upstream;
  wire             write_selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (clock_crossing_m1_qualified_request_DE4_SOPC_burst_0_upstream | ~clock_crossing_m1_requests_DE4_SOPC_burst_0_upstream) & ((~clock_crossing_m1_qualified_request_DE4_SOPC_burst_0_upstream | ~(clock_crossing_m1_read | clock_crossing_m1_write) | (1 & ~DE4_SOPC_burst_0_upstream_waitrequest_from_sa & (clock_crossing_m1_read | clock_crossing_m1_write)))) & ((~clock_crossing_m1_qualified_request_DE4_SOPC_burst_0_upstream | ~(clock_crossing_m1_read | clock_crossing_m1_write) | (1 & ~DE4_SOPC_burst_0_upstream_waitrequest_from_sa & (clock_crossing_m1_read | clock_crossing_m1_write))));

  //cascaded wait assignment, which is an e_assign
  assign clock_crossing_m1_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign clock_crossing_m1_address_to_slave = clock_crossing_m1_address[29 : 0];

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_clock_crossing_m1_readdatavalid = clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign clock_crossing_m1_readdatavalid = 0 |
    pre_flush_clock_crossing_m1_readdatavalid;

  //Negative Dynamic Bus-sizing mux.
  //this mux selects the correct eighth of the 
  //wide data coming from the slave DE4_SOPC_burst_0/upstream 
  assign DE4_SOPC_burst_0_upstream_readdata_from_sa_part_selected_by_negative_dbs = ((selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo_output_DE4_SOPC_burst_0_upstream == 0))? DE4_SOPC_burst_0_upstream_readdata_from_sa[31 : 0] :
    ((selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo_output_DE4_SOPC_burst_0_upstream == 1))? DE4_SOPC_burst_0_upstream_readdata_from_sa[63 : 32] :
    ((selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo_output_DE4_SOPC_burst_0_upstream == 2))? DE4_SOPC_burst_0_upstream_readdata_from_sa[95 : 64] :
    ((selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo_output_DE4_SOPC_burst_0_upstream == 3))? DE4_SOPC_burst_0_upstream_readdata_from_sa[127 : 96] :
    ((selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo_output_DE4_SOPC_burst_0_upstream == 4))? DE4_SOPC_burst_0_upstream_readdata_from_sa[159 : 128] :
    ((selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo_output_DE4_SOPC_burst_0_upstream == 5))? DE4_SOPC_burst_0_upstream_readdata_from_sa[191 : 160] :
    ((selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo_output_DE4_SOPC_burst_0_upstream == 6))? DE4_SOPC_burst_0_upstream_readdata_from_sa[223 : 192] :
    DE4_SOPC_burst_0_upstream_readdata_from_sa[255 : 224];

  //read_selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo fifo read, which is an e_mux
  assign read_selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo = clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream;

  //write_selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo fifo write, which is an e_mux
  assign write_selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo = clock_crossing_m1_read & clock_crossing_m1_run & clock_crossing_m1_requests_DE4_SOPC_burst_0_upstream;

  assign selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo_output_DE4_SOPC_burst_0_upstream = 3'b0;
  //selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo, which is an e_fifo_with_registered_outputs
  selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo_module selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo
    (
      .clear_fifo           (1'b1),
      .clk                  (clk),
      .data_in              (clock_crossing_m1_address_to_slave[4 : 2]),
      .data_out             (selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo_output),
      .empty                (empty_selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo),
      .fifo_contains_ones_n (),
      .full                 (full_selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo),
      .read                 (1'b0),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (1'b0)
    );

  //clock_crossing/m1 readdata mux, which is an e_mux
  assign clock_crossing_m1_readdata = DE4_SOPC_burst_0_upstream_readdata_from_sa_part_selected_by_negative_dbs;

  //actual waitrequest port, which is an e_assign
  assign clock_crossing_m1_waitrequest = ~clock_crossing_m1_run;

  //latent max counter, which is an e_assign
  assign clock_crossing_m1_latency_counter = 0;

  //clock_crossing_m1_reset_n assignment, which is an e_assign
  assign clock_crossing_m1_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //clock_crossing_m1_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_m1_address_last_time <= 0;
      else 
        clock_crossing_m1_address_last_time <= clock_crossing_m1_address;
    end


  //clock_crossing/m1 waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= clock_crossing_m1_waitrequest & (clock_crossing_m1_read | clock_crossing_m1_write);
    end


  //clock_crossing_m1_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (clock_crossing_m1_address != clock_crossing_m1_address_last_time))
        begin
          $write("%0d ns: clock_crossing_m1_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //clock_crossing_m1_burstcount check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_m1_burstcount_last_time <= 0;
      else 
        clock_crossing_m1_burstcount_last_time <= clock_crossing_m1_burstcount;
    end


  //clock_crossing_m1_burstcount matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (clock_crossing_m1_burstcount != clock_crossing_m1_burstcount_last_time))
        begin
          $write("%0d ns: clock_crossing_m1_burstcount did not heed wait!!!", $time);
          $stop;
        end
    end


  //clock_crossing_m1_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_m1_byteenable_last_time <= 0;
      else 
        clock_crossing_m1_byteenable_last_time <= clock_crossing_m1_byteenable;
    end


  //clock_crossing_m1_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (clock_crossing_m1_byteenable != clock_crossing_m1_byteenable_last_time))
        begin
          $write("%0d ns: clock_crossing_m1_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //clock_crossing_m1_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_m1_read_last_time <= 0;
      else 
        clock_crossing_m1_read_last_time <= clock_crossing_m1_read;
    end


  //clock_crossing_m1_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (clock_crossing_m1_read != clock_crossing_m1_read_last_time))
        begin
          $write("%0d ns: clock_crossing_m1_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //clock_crossing_m1_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_m1_write_last_time <= 0;
      else 
        clock_crossing_m1_write_last_time <= clock_crossing_m1_write;
    end


  //clock_crossing_m1_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (clock_crossing_m1_write != clock_crossing_m1_write_last_time))
        begin
          $write("%0d ns: clock_crossing_m1_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //clock_crossing_m1_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_m1_writedata_last_time <= 0;
      else 
        clock_crossing_m1_writedata_last_time <= clock_crossing_m1_writedata;
    end


  //clock_crossing_m1_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (clock_crossing_m1_writedata != clock_crossing_m1_writedata_last_time) & clock_crossing_m1_write)
        begin
          $write("%0d ns: clock_crossing_m1_writedata did not heed wait!!!", $time);
          $stop;
        end
    end


  //selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo read when empty, which is an e_process
  always @(posedge clk)
    begin
      if (empty_selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo & 1'b0)
        begin
          $write("%0d ns: clock_crossing/m1 negative rdv fifo selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo: read AND empty.\n", $time);
          $stop;
        end
    end


  //selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo write when full, which is an e_process
  always @(posedge clk)
    begin
      if (full_selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo & 1'b0 & ~1'b0)
        begin
          $write("%0d ns: clock_crossing/m1 negative rdv fifo selecto_nrdv_clock_crossing_m1_3_DE4_SOPC_burst_0_upstream_fifo: write AND full.\n", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module clock_crossing_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module burstcount_fifo_for_ddr2_s1_module (
                                            // inputs:
                                             clear_fifo,
                                             clk,
                                             data_in,
                                             read,
                                             reset_n,
                                             sync_reset,
                                             write,

                                            // outputs:
                                             data_out,
                                             empty,
                                             fifo_contains_ones_n,
                                             full
                                          )
;

  output  [  2: 0] data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input   [  2: 0] data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire    [  2: 0] data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  wire             full_32;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  6: 0] how_many_ones;
  wire    [  6: 0] one_count_minus_one;
  wire    [  6: 0] one_count_plus_one;
  wire             p0_full_0;
  wire    [  2: 0] p0_stage_0;
  wire             p10_full_10;
  wire    [  2: 0] p10_stage_10;
  wire             p11_full_11;
  wire    [  2: 0] p11_stage_11;
  wire             p12_full_12;
  wire    [  2: 0] p12_stage_12;
  wire             p13_full_13;
  wire    [  2: 0] p13_stage_13;
  wire             p14_full_14;
  wire    [  2: 0] p14_stage_14;
  wire             p15_full_15;
  wire    [  2: 0] p15_stage_15;
  wire             p16_full_16;
  wire    [  2: 0] p16_stage_16;
  wire             p17_full_17;
  wire    [  2: 0] p17_stage_17;
  wire             p18_full_18;
  wire    [  2: 0] p18_stage_18;
  wire             p19_full_19;
  wire    [  2: 0] p19_stage_19;
  wire             p1_full_1;
  wire    [  2: 0] p1_stage_1;
  wire             p20_full_20;
  wire    [  2: 0] p20_stage_20;
  wire             p21_full_21;
  wire    [  2: 0] p21_stage_21;
  wire             p22_full_22;
  wire    [  2: 0] p22_stage_22;
  wire             p23_full_23;
  wire    [  2: 0] p23_stage_23;
  wire             p24_full_24;
  wire    [  2: 0] p24_stage_24;
  wire             p25_full_25;
  wire    [  2: 0] p25_stage_25;
  wire             p26_full_26;
  wire    [  2: 0] p26_stage_26;
  wire             p27_full_27;
  wire    [  2: 0] p27_stage_27;
  wire             p28_full_28;
  wire    [  2: 0] p28_stage_28;
  wire             p29_full_29;
  wire    [  2: 0] p29_stage_29;
  wire             p2_full_2;
  wire    [  2: 0] p2_stage_2;
  wire             p30_full_30;
  wire    [  2: 0] p30_stage_30;
  wire             p31_full_31;
  wire    [  2: 0] p31_stage_31;
  wire             p3_full_3;
  wire    [  2: 0] p3_stage_3;
  wire             p4_full_4;
  wire    [  2: 0] p4_stage_4;
  wire             p5_full_5;
  wire    [  2: 0] p5_stage_5;
  wire             p6_full_6;
  wire    [  2: 0] p6_stage_6;
  wire             p7_full_7;
  wire    [  2: 0] p7_stage_7;
  wire             p8_full_8;
  wire    [  2: 0] p8_stage_8;
  wire             p9_full_9;
  wire    [  2: 0] p9_stage_9;
  reg     [  2: 0] stage_0;
  reg     [  2: 0] stage_1;
  reg     [  2: 0] stage_10;
  reg     [  2: 0] stage_11;
  reg     [  2: 0] stage_12;
  reg     [  2: 0] stage_13;
  reg     [  2: 0] stage_14;
  reg     [  2: 0] stage_15;
  reg     [  2: 0] stage_16;
  reg     [  2: 0] stage_17;
  reg     [  2: 0] stage_18;
  reg     [  2: 0] stage_19;
  reg     [  2: 0] stage_2;
  reg     [  2: 0] stage_20;
  reg     [  2: 0] stage_21;
  reg     [  2: 0] stage_22;
  reg     [  2: 0] stage_23;
  reg     [  2: 0] stage_24;
  reg     [  2: 0] stage_25;
  reg     [  2: 0] stage_26;
  reg     [  2: 0] stage_27;
  reg     [  2: 0] stage_28;
  reg     [  2: 0] stage_29;
  reg     [  2: 0] stage_3;
  reg     [  2: 0] stage_30;
  reg     [  2: 0] stage_31;
  reg     [  2: 0] stage_4;
  reg     [  2: 0] stage_5;
  reg     [  2: 0] stage_6;
  reg     [  2: 0] stage_7;
  reg     [  2: 0] stage_8;
  reg     [  2: 0] stage_9;
  wire    [  6: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_31;
  assign empty = !full_0;
  assign full_32 = 0;
  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    0;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_DE4_SOPC_burst_0_downstream_to_ddr2_s1_module (
                                                                    // inputs:
                                                                     clear_fifo,
                                                                     clk,
                                                                     data_in,
                                                                     read,
                                                                     reset_n,
                                                                     sync_reset,
                                                                     write,

                                                                    // outputs:
                                                                     data_out,
                                                                     empty,
                                                                     fifo_contains_ones_n,
                                                                     full
                                                                  )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  wire             full_32;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  6: 0] how_many_ones;
  wire    [  6: 0] one_count_minus_one;
  wire    [  6: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p10_full_10;
  wire             p10_stage_10;
  wire             p11_full_11;
  wire             p11_stage_11;
  wire             p12_full_12;
  wire             p12_stage_12;
  wire             p13_full_13;
  wire             p13_stage_13;
  wire             p14_full_14;
  wire             p14_stage_14;
  wire             p15_full_15;
  wire             p15_stage_15;
  wire             p16_full_16;
  wire             p16_stage_16;
  wire             p17_full_17;
  wire             p17_stage_17;
  wire             p18_full_18;
  wire             p18_stage_18;
  wire             p19_full_19;
  wire             p19_stage_19;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p20_full_20;
  wire             p20_stage_20;
  wire             p21_full_21;
  wire             p21_stage_21;
  wire             p22_full_22;
  wire             p22_stage_22;
  wire             p23_full_23;
  wire             p23_stage_23;
  wire             p24_full_24;
  wire             p24_stage_24;
  wire             p25_full_25;
  wire             p25_stage_25;
  wire             p26_full_26;
  wire             p26_stage_26;
  wire             p27_full_27;
  wire             p27_stage_27;
  wire             p28_full_28;
  wire             p28_stage_28;
  wire             p29_full_29;
  wire             p29_stage_29;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p30_full_30;
  wire             p30_stage_30;
  wire             p31_full_31;
  wire             p31_stage_31;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_10;
  reg              stage_11;
  reg              stage_12;
  reg              stage_13;
  reg              stage_14;
  reg              stage_15;
  reg              stage_16;
  reg              stage_17;
  reg              stage_18;
  reg              stage_19;
  reg              stage_2;
  reg              stage_20;
  reg              stage_21;
  reg              stage_22;
  reg              stage_23;
  reg              stage_24;
  reg              stage_25;
  reg              stage_26;
  reg              stage_27;
  reg              stage_28;
  reg              stage_29;
  reg              stage_3;
  reg              stage_30;
  reg              stage_31;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  reg              stage_7;
  reg              stage_8;
  reg              stage_9;
  wire    [  6: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_31;
  assign empty = !full_0;
  assign full_32 = 0;
  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    0;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ddr2_s1_arbitrator (
                            // inputs:
                             DE4_SOPC_burst_0_downstream_address_to_slave,
                             DE4_SOPC_burst_0_downstream_arbitrationshare,
                             DE4_SOPC_burst_0_downstream_burstcount,
                             DE4_SOPC_burst_0_downstream_byteenable,
                             DE4_SOPC_burst_0_downstream_latency_counter,
                             DE4_SOPC_burst_0_downstream_read,
                             DE4_SOPC_burst_0_downstream_write,
                             DE4_SOPC_burst_0_downstream_writedata,
                             clk,
                             ddr2_s1_readdata,
                             ddr2_s1_readdatavalid,
                             ddr2_s1_resetrequest_n,
                             ddr2_s1_waitrequest_n,
                             reset_n,

                            // outputs:
                             DE4_SOPC_burst_0_downstream_granted_ddr2_s1,
                             DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1,
                             DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1,
                             DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1_shift_register,
                             DE4_SOPC_burst_0_downstream_requests_ddr2_s1,
                             d1_ddr2_s1_end_xfer,
                             ddr2_s1_address,
                             ddr2_s1_beginbursttransfer,
                             ddr2_s1_burstcount,
                             ddr2_s1_byteenable,
                             ddr2_s1_read,
                             ddr2_s1_readdata_from_sa,
                             ddr2_s1_resetrequest_n_from_sa,
                             ddr2_s1_waitrequest_n_from_sa,
                             ddr2_s1_write,
                             ddr2_s1_writedata
                          )
;

  output           DE4_SOPC_burst_0_downstream_granted_ddr2_s1;
  output           DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1;
  output           DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1;
  output           DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1_shift_register;
  output           DE4_SOPC_burst_0_downstream_requests_ddr2_s1;
  output           d1_ddr2_s1_end_xfer;
  output  [ 24: 0] ddr2_s1_address;
  output           ddr2_s1_beginbursttransfer;
  output  [  2: 0] ddr2_s1_burstcount;
  output  [ 31: 0] ddr2_s1_byteenable;
  output           ddr2_s1_read;
  output  [255: 0] ddr2_s1_readdata_from_sa;
  output           ddr2_s1_resetrequest_n_from_sa;
  output           ddr2_s1_waitrequest_n_from_sa;
  output           ddr2_s1_write;
  output  [255: 0] ddr2_s1_writedata;
  input   [ 29: 0] DE4_SOPC_burst_0_downstream_address_to_slave;
  input   [  1: 0] DE4_SOPC_burst_0_downstream_arbitrationshare;
  input   [  2: 0] DE4_SOPC_burst_0_downstream_burstcount;
  input   [ 31: 0] DE4_SOPC_burst_0_downstream_byteenable;
  input            DE4_SOPC_burst_0_downstream_latency_counter;
  input            DE4_SOPC_burst_0_downstream_read;
  input            DE4_SOPC_burst_0_downstream_write;
  input   [255: 0] DE4_SOPC_burst_0_downstream_writedata;
  input            clk;
  input   [255: 0] ddr2_s1_readdata;
  input            ddr2_s1_readdatavalid;
  input            ddr2_s1_resetrequest_n;
  input            ddr2_s1_waitrequest_n;
  input            reset_n;

  wire             DE4_SOPC_burst_0_downstream_arbiterlock;
  wire             DE4_SOPC_burst_0_downstream_arbiterlock2;
  wire             DE4_SOPC_burst_0_downstream_continuerequest;
  wire             DE4_SOPC_burst_0_downstream_granted_ddr2_s1;
  wire             DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1;
  wire             DE4_SOPC_burst_0_downstream_rdv_fifo_empty_ddr2_s1;
  wire             DE4_SOPC_burst_0_downstream_rdv_fifo_output_from_ddr2_s1;
  wire             DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1;
  wire             DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1_shift_register;
  wire             DE4_SOPC_burst_0_downstream_requests_ddr2_s1;
  wire             DE4_SOPC_burst_0_downstream_saved_grant_ddr2_s1;
  reg              d1_ddr2_s1_end_xfer;
  reg              d1_reasons_to_wait;
  wire    [ 24: 0] ddr2_s1_address;
  wire             ddr2_s1_allgrants;
  wire             ddr2_s1_allow_new_arb_cycle;
  wire             ddr2_s1_any_bursting_master_saved_grant;
  wire             ddr2_s1_any_continuerequest;
  wire             ddr2_s1_arb_counter_enable;
  reg     [  1: 0] ddr2_s1_arb_share_counter;
  wire    [  1: 0] ddr2_s1_arb_share_counter_next_value;
  wire    [  1: 0] ddr2_s1_arb_share_set_values;
  reg     [  1: 0] ddr2_s1_bbt_burstcounter;
  wire             ddr2_s1_beginbursttransfer;
  wire             ddr2_s1_beginbursttransfer_internal;
  wire             ddr2_s1_begins_xfer;
  wire    [  2: 0] ddr2_s1_burstcount;
  wire             ddr2_s1_burstcount_fifo_empty;
  wire    [ 31: 0] ddr2_s1_byteenable;
  reg     [  2: 0] ddr2_s1_current_burst;
  wire    [  2: 0] ddr2_s1_current_burst_minus_one;
  wire             ddr2_s1_end_xfer;
  wire             ddr2_s1_firsttransfer;
  wire             ddr2_s1_grant_vector;
  wire             ddr2_s1_in_a_read_cycle;
  wire             ddr2_s1_in_a_write_cycle;
  reg              ddr2_s1_load_fifo;
  wire             ddr2_s1_master_qreq_vector;
  wire             ddr2_s1_move_on_to_next_transaction;
  wire    [  1: 0] ddr2_s1_next_bbt_burstcount;
  wire    [  2: 0] ddr2_s1_next_burst_count;
  wire             ddr2_s1_non_bursting_master_requests;
  wire             ddr2_s1_read;
  wire    [255: 0] ddr2_s1_readdata_from_sa;
  wire             ddr2_s1_readdatavalid_from_sa;
  reg              ddr2_s1_reg_firsttransfer;
  wire             ddr2_s1_resetrequest_n_from_sa;
  wire    [  2: 0] ddr2_s1_selected_burstcount;
  reg              ddr2_s1_slavearbiterlockenable;
  wire             ddr2_s1_slavearbiterlockenable2;
  wire             ddr2_s1_this_cycle_is_the_last_burst;
  wire    [  2: 0] ddr2_s1_transaction_burst_count;
  wire             ddr2_s1_unreg_firsttransfer;
  wire             ddr2_s1_waitrequest_n_from_sa;
  wire             ddr2_s1_waits_for_read;
  wire             ddr2_s1_waits_for_write;
  wire             ddr2_s1_write;
  wire    [255: 0] ddr2_s1_writedata;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_ddr2_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p0_ddr2_s1_load_fifo;
  wire    [ 29: 0] shifted_address_to_ddr2_s1_from_DE4_SOPC_burst_0_downstream;
  wire             wait_for_ddr2_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~ddr2_s1_end_xfer;
    end


  assign ddr2_s1_begins_xfer = ~d1_reasons_to_wait & ((DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1));
  //assign ddr2_s1_readdata_from_sa = ddr2_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ddr2_s1_readdata_from_sa = ddr2_s1_readdata;

  assign DE4_SOPC_burst_0_downstream_requests_ddr2_s1 = (1) & (DE4_SOPC_burst_0_downstream_read | DE4_SOPC_burst_0_downstream_write);
  //assign ddr2_s1_waitrequest_n_from_sa = ddr2_s1_waitrequest_n so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ddr2_s1_waitrequest_n_from_sa = ddr2_s1_waitrequest_n;

  //assign ddr2_s1_readdatavalid_from_sa = ddr2_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ddr2_s1_readdatavalid_from_sa = ddr2_s1_readdatavalid;

  //ddr2_s1_arb_share_counter set values, which is an e_mux
  assign ddr2_s1_arb_share_set_values = (DE4_SOPC_burst_0_downstream_granted_ddr2_s1)? DE4_SOPC_burst_0_downstream_arbitrationshare :
    1;

  //ddr2_s1_non_bursting_master_requests mux, which is an e_mux
  assign ddr2_s1_non_bursting_master_requests = 0;

  //ddr2_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign ddr2_s1_any_bursting_master_saved_grant = DE4_SOPC_burst_0_downstream_saved_grant_ddr2_s1;

  //ddr2_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign ddr2_s1_arb_share_counter_next_value = ddr2_s1_firsttransfer ? (ddr2_s1_arb_share_set_values - 1) : |ddr2_s1_arb_share_counter ? (ddr2_s1_arb_share_counter - 1) : 0;

  //ddr2_s1_allgrants all slave grants, which is an e_mux
  assign ddr2_s1_allgrants = |ddr2_s1_grant_vector;

  //ddr2_s1_end_xfer assignment, which is an e_assign
  assign ddr2_s1_end_xfer = ~(ddr2_s1_waits_for_read | ddr2_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_ddr2_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_ddr2_s1 = ddr2_s1_end_xfer & (~ddr2_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //ddr2_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign ddr2_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_ddr2_s1 & ddr2_s1_allgrants) | (end_xfer_arb_share_counter_term_ddr2_s1 & ~ddr2_s1_non_bursting_master_requests);

  //ddr2_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ddr2_s1_arb_share_counter <= 0;
      else if (ddr2_s1_arb_counter_enable)
          ddr2_s1_arb_share_counter <= ddr2_s1_arb_share_counter_next_value;
    end


  //ddr2_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ddr2_s1_slavearbiterlockenable <= 0;
      else if ((|ddr2_s1_master_qreq_vector & end_xfer_arb_share_counter_term_ddr2_s1) | (end_xfer_arb_share_counter_term_ddr2_s1 & ~ddr2_s1_non_bursting_master_requests))
          ddr2_s1_slavearbiterlockenable <= |ddr2_s1_arb_share_counter_next_value;
    end


  //DE4_SOPC_burst_0/downstream ddr2/s1 arbiterlock, which is an e_assign
  assign DE4_SOPC_burst_0_downstream_arbiterlock = ddr2_s1_slavearbiterlockenable & DE4_SOPC_burst_0_downstream_continuerequest;

  //ddr2_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign ddr2_s1_slavearbiterlockenable2 = |ddr2_s1_arb_share_counter_next_value;

  //DE4_SOPC_burst_0/downstream ddr2/s1 arbiterlock2, which is an e_assign
  assign DE4_SOPC_burst_0_downstream_arbiterlock2 = ddr2_s1_slavearbiterlockenable2 & DE4_SOPC_burst_0_downstream_continuerequest;

  //ddr2_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign ddr2_s1_any_continuerequest = 1;

  //DE4_SOPC_burst_0_downstream_continuerequest continued request, which is an e_assign
  assign DE4_SOPC_burst_0_downstream_continuerequest = 1;

  assign DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1 = DE4_SOPC_burst_0_downstream_requests_ddr2_s1 & ~((DE4_SOPC_burst_0_downstream_read & ((DE4_SOPC_burst_0_downstream_latency_counter != 0) | (1 < DE4_SOPC_burst_0_downstream_latency_counter))));
  //unique name for ddr2_s1_move_on_to_next_transaction, which is an e_assign
  assign ddr2_s1_move_on_to_next_transaction = ddr2_s1_this_cycle_is_the_last_burst & ddr2_s1_load_fifo;

  //the currently selected burstcount for ddr2_s1, which is an e_mux
  assign ddr2_s1_selected_burstcount = (DE4_SOPC_burst_0_downstream_granted_ddr2_s1)? DE4_SOPC_burst_0_downstream_burstcount :
    1;

  //burstcount_fifo_for_ddr2_s1, which is an e_fifo_with_registered_outputs
  burstcount_fifo_for_ddr2_s1_module burstcount_fifo_for_ddr2_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (ddr2_s1_selected_burstcount),
      .data_out             (ddr2_s1_transaction_burst_count),
      .empty                (ddr2_s1_burstcount_fifo_empty),
      .fifo_contains_ones_n (),
      .full                 (),
      .read                 (ddr2_s1_this_cycle_is_the_last_burst),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~ddr2_s1_waits_for_read & ddr2_s1_load_fifo & ~(ddr2_s1_this_cycle_is_the_last_burst & ddr2_s1_burstcount_fifo_empty))
    );

  //ddr2_s1 current burst minus one, which is an e_assign
  assign ddr2_s1_current_burst_minus_one = ddr2_s1_current_burst - 1;

  //what to load in current_burst, for ddr2_s1, which is an e_mux
  assign ddr2_s1_next_burst_count = (((in_a_read_cycle & ~ddr2_s1_waits_for_read) & ~ddr2_s1_load_fifo))? ddr2_s1_selected_burstcount :
    ((in_a_read_cycle & ~ddr2_s1_waits_for_read & ddr2_s1_this_cycle_is_the_last_burst & ddr2_s1_burstcount_fifo_empty))? ddr2_s1_selected_burstcount :
    (ddr2_s1_this_cycle_is_the_last_burst)? ddr2_s1_transaction_burst_count :
    ddr2_s1_current_burst_minus_one;

  //the current burst count for ddr2_s1, to be decremented, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ddr2_s1_current_burst <= 0;
      else if (ddr2_s1_readdatavalid_from_sa | (~ddr2_s1_load_fifo & (in_a_read_cycle & ~ddr2_s1_waits_for_read)))
          ddr2_s1_current_burst <= ddr2_s1_next_burst_count;
    end


  //a 1 or burstcount fifo empty, to initialize the counter, which is an e_mux
  assign p0_ddr2_s1_load_fifo = (~ddr2_s1_load_fifo)? 1 :
    (((in_a_read_cycle & ~ddr2_s1_waits_for_read) & ddr2_s1_load_fifo))? 1 :
    ~ddr2_s1_burstcount_fifo_empty;

  //whether to load directly to the counter or to the fifo, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ddr2_s1_load_fifo <= 0;
      else if ((in_a_read_cycle & ~ddr2_s1_waits_for_read) & ~ddr2_s1_load_fifo | ddr2_s1_this_cycle_is_the_last_burst)
          ddr2_s1_load_fifo <= p0_ddr2_s1_load_fifo;
    end


  //the last cycle in the burst for ddr2_s1, which is an e_assign
  assign ddr2_s1_this_cycle_is_the_last_burst = ~(|ddr2_s1_current_burst_minus_one) & ddr2_s1_readdatavalid_from_sa;

  //rdv_fifo_for_DE4_SOPC_burst_0_downstream_to_ddr2_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_DE4_SOPC_burst_0_downstream_to_ddr2_s1_module rdv_fifo_for_DE4_SOPC_burst_0_downstream_to_ddr2_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (DE4_SOPC_burst_0_downstream_granted_ddr2_s1),
      .data_out             (DE4_SOPC_burst_0_downstream_rdv_fifo_output_from_ddr2_s1),
      .empty                (),
      .fifo_contains_ones_n (DE4_SOPC_burst_0_downstream_rdv_fifo_empty_ddr2_s1),
      .full                 (),
      .read                 (ddr2_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~ddr2_s1_waits_for_read)
    );

  assign DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1_shift_register = ~DE4_SOPC_burst_0_downstream_rdv_fifo_empty_ddr2_s1;
  //local readdatavalid DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1, which is an e_mux
  assign DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1 = ddr2_s1_readdatavalid_from_sa;

  //ddr2_s1_writedata mux, which is an e_mux
  assign ddr2_s1_writedata = DE4_SOPC_burst_0_downstream_writedata;

  //master is always granted when requested
  assign DE4_SOPC_burst_0_downstream_granted_ddr2_s1 = DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1;

  //DE4_SOPC_burst_0/downstream saved-grant ddr2/s1, which is an e_assign
  assign DE4_SOPC_burst_0_downstream_saved_grant_ddr2_s1 = DE4_SOPC_burst_0_downstream_requests_ddr2_s1;

  //allow new arb cycle for ddr2/s1, which is an e_assign
  assign ddr2_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign ddr2_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign ddr2_s1_master_qreq_vector = 1;

  //assign ddr2_s1_resetrequest_n_from_sa = ddr2_s1_resetrequest_n so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ddr2_s1_resetrequest_n_from_sa = ddr2_s1_resetrequest_n;

  //ddr2_s1_firsttransfer first transaction, which is an e_assign
  assign ddr2_s1_firsttransfer = ddr2_s1_begins_xfer ? ddr2_s1_unreg_firsttransfer : ddr2_s1_reg_firsttransfer;

  //ddr2_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign ddr2_s1_unreg_firsttransfer = ~(ddr2_s1_slavearbiterlockenable & ddr2_s1_any_continuerequest);

  //ddr2_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ddr2_s1_reg_firsttransfer <= 1'b1;
      else if (ddr2_s1_begins_xfer)
          ddr2_s1_reg_firsttransfer <= ddr2_s1_unreg_firsttransfer;
    end


  //ddr2_s1_next_bbt_burstcount next_bbt_burstcount, which is an e_mux
  assign ddr2_s1_next_bbt_burstcount = ((((ddr2_s1_write) && (ddr2_s1_bbt_burstcounter == 0))))? (ddr2_s1_burstcount - 1) :
    ((((ddr2_s1_read) && (ddr2_s1_bbt_burstcounter == 0))))? 0 :
    (ddr2_s1_bbt_burstcounter - 1);

  //ddr2_s1_bbt_burstcounter bbt_burstcounter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ddr2_s1_bbt_burstcounter <= 0;
      else if (ddr2_s1_begins_xfer)
          ddr2_s1_bbt_burstcounter <= ddr2_s1_next_bbt_burstcount;
    end


  //ddr2_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign ddr2_s1_beginbursttransfer_internal = ddr2_s1_begins_xfer & (ddr2_s1_bbt_burstcounter == 0);

  //ddr2/s1 begin burst transfer to slave, which is an e_assign
  assign ddr2_s1_beginbursttransfer = ddr2_s1_beginbursttransfer_internal;

  //ddr2_s1_read assignment, which is an e_mux
  assign ddr2_s1_read = DE4_SOPC_burst_0_downstream_granted_ddr2_s1 & DE4_SOPC_burst_0_downstream_read;

  //ddr2_s1_write assignment, which is an e_mux
  assign ddr2_s1_write = DE4_SOPC_burst_0_downstream_granted_ddr2_s1 & DE4_SOPC_burst_0_downstream_write;

  assign shifted_address_to_ddr2_s1_from_DE4_SOPC_burst_0_downstream = DE4_SOPC_burst_0_downstream_address_to_slave;
  //ddr2_s1_address mux, which is an e_mux
  assign ddr2_s1_address = shifted_address_to_ddr2_s1_from_DE4_SOPC_burst_0_downstream >> 5;

  //d1_ddr2_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_ddr2_s1_end_xfer <= 1;
      else 
        d1_ddr2_s1_end_xfer <= ddr2_s1_end_xfer;
    end


  //ddr2_s1_waits_for_read in a cycle, which is an e_mux
  assign ddr2_s1_waits_for_read = ddr2_s1_in_a_read_cycle & ~ddr2_s1_waitrequest_n_from_sa;

  //ddr2_s1_in_a_read_cycle assignment, which is an e_assign
  assign ddr2_s1_in_a_read_cycle = DE4_SOPC_burst_0_downstream_granted_ddr2_s1 & DE4_SOPC_burst_0_downstream_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = ddr2_s1_in_a_read_cycle;

  //ddr2_s1_waits_for_write in a cycle, which is an e_mux
  assign ddr2_s1_waits_for_write = ddr2_s1_in_a_write_cycle & ~ddr2_s1_waitrequest_n_from_sa;

  //ddr2_s1_in_a_write_cycle assignment, which is an e_assign
  assign ddr2_s1_in_a_write_cycle = DE4_SOPC_burst_0_downstream_granted_ddr2_s1 & DE4_SOPC_burst_0_downstream_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = ddr2_s1_in_a_write_cycle;

  assign wait_for_ddr2_s1_counter = 0;
  //ddr2_s1_byteenable byte enable port mux, which is an e_mux
  assign ddr2_s1_byteenable = (DE4_SOPC_burst_0_downstream_granted_ddr2_s1)? DE4_SOPC_burst_0_downstream_byteenable :
    -1;

  //burstcount mux, which is an e_mux
  assign ddr2_s1_burstcount = (DE4_SOPC_burst_0_downstream_granted_ddr2_s1)? DE4_SOPC_burst_0_downstream_burstcount :
    1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //ddr2/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //DE4_SOPC_burst_0/downstream non-zero arbitrationshare assertion, which is an e_process
  always @(posedge clk)
    begin
      if (DE4_SOPC_burst_0_downstream_requests_ddr2_s1 && (DE4_SOPC_burst_0_downstream_arbitrationshare == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: DE4_SOPC_burst_0/downstream drove 0 on its 'arbitrationshare' port while accessing slave ddr2/s1", $time);
          $stop;
        end
    end


  //DE4_SOPC_burst_0/downstream non-zero burstcount assertion, which is an e_process
  always @(posedge clk)
    begin
      if (DE4_SOPC_burst_0_downstream_requests_ddr2_s1 && (DE4_SOPC_burst_0_downstream_burstcount == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: DE4_SOPC_burst_0/downstream drove 0 on its 'burstcount' port while accessing slave ddr2/s1", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE4_SOPC_reset_clk_50_domain_synch_module (
                                                   // inputs:
                                                    clk,
                                                    data_in,
                                                    reset_n,

                                                   // outputs:
                                                    data_out
                                                 )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module master_read_avalon_master_arbitrator (
                                              // inputs:
                                               clk,
                                               clock_crossing_s1_readdata_from_sa,
                                               clock_crossing_s1_waitrequest_from_sa,
                                               d1_clock_crossing_s1_end_xfer,
                                               master_read_avalon_master_address,
                                               master_read_avalon_master_burstcount,
                                               master_read_avalon_master_byteenable,
                                               master_read_avalon_master_read,
                                               master_read_granted_clock_crossing_s1,
                                               master_read_qualified_request_clock_crossing_s1,
                                               master_read_read_data_valid_clock_crossing_s1,
                                               master_read_read_data_valid_clock_crossing_s1_shift_register,
                                               master_read_requests_clock_crossing_s1,
                                               reset_n,

                                              // outputs:
                                               master_read_avalon_master_address_to_slave,
                                               master_read_avalon_master_readdata,
                                               master_read_avalon_master_readdatavalid,
                                               master_read_avalon_master_reset,
                                               master_read_avalon_master_waitrequest,
                                               master_read_latency_counter
                                            )
;

  output  [ 29: 0] master_read_avalon_master_address_to_slave;
  output  [ 31: 0] master_read_avalon_master_readdata;
  output           master_read_avalon_master_readdatavalid;
  output           master_read_avalon_master_reset;
  output           master_read_avalon_master_waitrequest;
  output           master_read_latency_counter;
  input            clk;
  input   [ 31: 0] clock_crossing_s1_readdata_from_sa;
  input            clock_crossing_s1_waitrequest_from_sa;
  input            d1_clock_crossing_s1_end_xfer;
  input   [ 29: 0] master_read_avalon_master_address;
  input            master_read_avalon_master_burstcount;
  input   [  3: 0] master_read_avalon_master_byteenable;
  input            master_read_avalon_master_read;
  input            master_read_granted_clock_crossing_s1;
  input            master_read_qualified_request_clock_crossing_s1;
  input            master_read_read_data_valid_clock_crossing_s1;
  input            master_read_read_data_valid_clock_crossing_s1_shift_register;
  input            master_read_requests_clock_crossing_s1;
  input            reset_n;

  reg              active_and_waiting_last_time;
  wire             latency_load_value;
  reg     [ 29: 0] master_read_avalon_master_address_last_time;
  wire    [ 29: 0] master_read_avalon_master_address_to_slave;
  reg              master_read_avalon_master_burstcount_last_time;
  reg     [  3: 0] master_read_avalon_master_byteenable_last_time;
  wire             master_read_avalon_master_is_granted_some_slave;
  reg              master_read_avalon_master_read_but_no_slave_selected;
  reg              master_read_avalon_master_read_last_time;
  wire    [ 31: 0] master_read_avalon_master_readdata;
  wire             master_read_avalon_master_readdatavalid;
  wire             master_read_avalon_master_reset;
  wire             master_read_avalon_master_run;
  wire             master_read_avalon_master_waitrequest;
  reg              master_read_latency_counter;
  wire             p1_master_read_latency_counter;
  wire             pre_flush_master_read_avalon_master_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (master_read_qualified_request_clock_crossing_s1 | ~master_read_requests_clock_crossing_s1) & (master_read_granted_clock_crossing_s1 | ~master_read_qualified_request_clock_crossing_s1) & ((~master_read_qualified_request_clock_crossing_s1 | ~(master_read_avalon_master_read) | (1 & ~clock_crossing_s1_waitrequest_from_sa & (master_read_avalon_master_read))));

  //cascaded wait assignment, which is an e_assign
  assign master_read_avalon_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign master_read_avalon_master_address_to_slave = master_read_avalon_master_address[29 : 0];

  //master_read_avalon_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          master_read_avalon_master_read_but_no_slave_selected <= 0;
      else 
        master_read_avalon_master_read_but_no_slave_selected <= master_read_avalon_master_read & master_read_avalon_master_run & ~master_read_avalon_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign master_read_avalon_master_is_granted_some_slave = master_read_granted_clock_crossing_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_master_read_avalon_master_readdatavalid = master_read_read_data_valid_clock_crossing_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign master_read_avalon_master_readdatavalid = master_read_avalon_master_read_but_no_slave_selected |
    pre_flush_master_read_avalon_master_readdatavalid;

  //master_read/avalon_master readdata mux, which is an e_mux
  assign master_read_avalon_master_readdata = clock_crossing_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign master_read_avalon_master_waitrequest = ~master_read_avalon_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          master_read_latency_counter <= 0;
      else 
        master_read_latency_counter <= p1_master_read_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_master_read_latency_counter = ((master_read_avalon_master_run & master_read_avalon_master_read))? latency_load_value :
    (master_read_latency_counter)? master_read_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;

  //~master_read_avalon_master_reset assignment, which is an e_assign
  assign master_read_avalon_master_reset = ~reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //master_read_avalon_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          master_read_avalon_master_address_last_time <= 0;
      else 
        master_read_avalon_master_address_last_time <= master_read_avalon_master_address;
    end


  //master_read/avalon_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= master_read_avalon_master_waitrequest & (master_read_avalon_master_read);
    end


  //master_read_avalon_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (master_read_avalon_master_address != master_read_avalon_master_address_last_time))
        begin
          $write("%0d ns: master_read_avalon_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //master_read_avalon_master_burstcount check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          master_read_avalon_master_burstcount_last_time <= 0;
      else 
        master_read_avalon_master_burstcount_last_time <= master_read_avalon_master_burstcount;
    end


  //master_read_avalon_master_burstcount matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (master_read_avalon_master_burstcount != master_read_avalon_master_burstcount_last_time))
        begin
          $write("%0d ns: master_read_avalon_master_burstcount did not heed wait!!!", $time);
          $stop;
        end
    end


  //master_read_avalon_master_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          master_read_avalon_master_byteenable_last_time <= 0;
      else 
        master_read_avalon_master_byteenable_last_time <= master_read_avalon_master_byteenable;
    end


  //master_read_avalon_master_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (master_read_avalon_master_byteenable != master_read_avalon_master_byteenable_last_time))
        begin
          $write("%0d ns: master_read_avalon_master_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //master_read_avalon_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          master_read_avalon_master_read_last_time <= 0;
      else 
        master_read_avalon_master_read_last_time <= master_read_avalon_master_read;
    end


  //master_read_avalon_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (master_read_avalon_master_read != master_read_avalon_master_read_last_time))
        begin
          $write("%0d ns: master_read_avalon_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module master_write_avalon_master_arbitrator (
                                               // inputs:
                                                clk,
                                                clock_crossing_s1_waitrequest_from_sa,
                                                d1_clock_crossing_s1_end_xfer,
                                                master_write_avalon_master_address,
                                                master_write_avalon_master_burstcount,
                                                master_write_avalon_master_byteenable,
                                                master_write_avalon_master_write,
                                                master_write_avalon_master_writedata,
                                                master_write_granted_clock_crossing_s1,
                                                master_write_qualified_request_clock_crossing_s1,
                                                master_write_requests_clock_crossing_s1,
                                                reset_n,

                                               // outputs:
                                                master_write_avalon_master_address_to_slave,
                                                master_write_avalon_master_reset,
                                                master_write_avalon_master_waitrequest
                                             )
;

  output  [ 29: 0] master_write_avalon_master_address_to_slave;
  output           master_write_avalon_master_reset;
  output           master_write_avalon_master_waitrequest;
  input            clk;
  input            clock_crossing_s1_waitrequest_from_sa;
  input            d1_clock_crossing_s1_end_xfer;
  input   [ 29: 0] master_write_avalon_master_address;
  input            master_write_avalon_master_burstcount;
  input   [  3: 0] master_write_avalon_master_byteenable;
  input            master_write_avalon_master_write;
  input   [ 31: 0] master_write_avalon_master_writedata;
  input            master_write_granted_clock_crossing_s1;
  input            master_write_qualified_request_clock_crossing_s1;
  input            master_write_requests_clock_crossing_s1;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 29: 0] master_write_avalon_master_address_last_time;
  wire    [ 29: 0] master_write_avalon_master_address_to_slave;
  reg              master_write_avalon_master_burstcount_last_time;
  reg     [  3: 0] master_write_avalon_master_byteenable_last_time;
  wire             master_write_avalon_master_reset;
  wire             master_write_avalon_master_run;
  wire             master_write_avalon_master_waitrequest;
  reg              master_write_avalon_master_write_last_time;
  reg     [ 31: 0] master_write_avalon_master_writedata_last_time;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (master_write_qualified_request_clock_crossing_s1 | ~master_write_requests_clock_crossing_s1) & (master_write_granted_clock_crossing_s1 | ~master_write_qualified_request_clock_crossing_s1) & ((~master_write_qualified_request_clock_crossing_s1 | ~(master_write_avalon_master_write) | (1 & ~clock_crossing_s1_waitrequest_from_sa & (master_write_avalon_master_write))));

  //cascaded wait assignment, which is an e_assign
  assign master_write_avalon_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign master_write_avalon_master_address_to_slave = master_write_avalon_master_address[29 : 0];

  //actual waitrequest port, which is an e_assign
  assign master_write_avalon_master_waitrequest = ~master_write_avalon_master_run;

  //~master_write_avalon_master_reset assignment, which is an e_assign
  assign master_write_avalon_master_reset = ~reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //master_write_avalon_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          master_write_avalon_master_address_last_time <= 0;
      else 
        master_write_avalon_master_address_last_time <= master_write_avalon_master_address;
    end


  //master_write/avalon_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= master_write_avalon_master_waitrequest & (master_write_avalon_master_write);
    end


  //master_write_avalon_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (master_write_avalon_master_address != master_write_avalon_master_address_last_time))
        begin
          $write("%0d ns: master_write_avalon_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //master_write_avalon_master_burstcount check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          master_write_avalon_master_burstcount_last_time <= 0;
      else 
        master_write_avalon_master_burstcount_last_time <= master_write_avalon_master_burstcount;
    end


  //master_write_avalon_master_burstcount matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (master_write_avalon_master_burstcount != master_write_avalon_master_burstcount_last_time))
        begin
          $write("%0d ns: master_write_avalon_master_burstcount did not heed wait!!!", $time);
          $stop;
        end
    end


  //master_write_avalon_master_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          master_write_avalon_master_byteenable_last_time <= 0;
      else 
        master_write_avalon_master_byteenable_last_time <= master_write_avalon_master_byteenable;
    end


  //master_write_avalon_master_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (master_write_avalon_master_byteenable != master_write_avalon_master_byteenable_last_time))
        begin
          $write("%0d ns: master_write_avalon_master_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //master_write_avalon_master_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          master_write_avalon_master_write_last_time <= 0;
      else 
        master_write_avalon_master_write_last_time <= master_write_avalon_master_write;
    end


  //master_write_avalon_master_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (master_write_avalon_master_write != master_write_avalon_master_write_last_time))
        begin
          $write("%0d ns: master_write_avalon_master_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //master_write_avalon_master_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          master_write_avalon_master_writedata_last_time <= 0;
      else 
        master_write_avalon_master_writedata_last_time <= master_write_avalon_master_writedata;
    end


  //master_write_avalon_master_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (master_write_avalon_master_writedata != master_write_avalon_master_writedata_last_time) & master_write_avalon_master_write)
        begin
          $write("%0d ns: master_write_avalon_master_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE4_SOPC_reset_ddr2_phy_clk_out_domain_synch_module (
                                                             // inputs:
                                                              clk,
                                                              data_in,
                                                              reset_n,

                                                             // outputs:
                                                              data_out
                                                           )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE4_SOPC (
                  // 1) global signals:
                   clk_50,
                   ddr2_aux_full_rate_clk_out,
                   ddr2_aux_half_rate_clk_out,
                   ddr2_phy_clk_out,
                   reset_n,

                  // the_ddr2
                   aux_scan_clk_from_the_ddr2,
                   aux_scan_clk_reset_n_from_the_ddr2,
                   dll_reference_clk_from_the_ddr2,
                   dqs_delay_ctrl_export_from_the_ddr2,
                   global_reset_n_to_the_ddr2,
                   local_init_done_from_the_ddr2,
                   local_refresh_ack_from_the_ddr2,
                   local_wdata_req_from_the_ddr2,
                   mem_addr_from_the_ddr2,
                   mem_ba_from_the_ddr2,
                   mem_cas_n_from_the_ddr2,
                   mem_cke_from_the_ddr2,
                   mem_clk_n_to_and_from_the_ddr2,
                   mem_clk_to_and_from_the_ddr2,
                   mem_cs_n_from_the_ddr2,
                   mem_dm_from_the_ddr2,
                   mem_dq_to_and_from_the_ddr2,
                   mem_dqs_to_and_from_the_ddr2,
                   mem_dqsn_to_and_from_the_ddr2,
                   mem_odt_from_the_ddr2,
                   mem_ras_n_from_the_ddr2,
                   mem_we_n_from_the_ddr2,
                   oct_ctl_rs_value_to_the_ddr2,
                   oct_ctl_rt_value_to_the_ddr2,
                   reset_phy_clk_n_from_the_ddr2,

                  // the_master_read
                   control_done_from_the_master_read,
                   control_early_done_from_the_master_read,
                   control_fixed_location_to_the_master_read,
                   control_go_to_the_master_read,
                   control_read_base_to_the_master_read,
                   control_read_length_to_the_master_read,
                   user_buffer_output_data_from_the_master_read,
                   user_data_available_from_the_master_read,
                   user_read_buffer_to_the_master_read,

                  // the_master_write
                   control_done_from_the_master_write,
                   control_fixed_location_to_the_master_write,
                   control_go_to_the_master_write,
                   control_write_base_to_the_master_write,
                   control_write_length_to_the_master_write,
                   user_buffer_full_from_the_master_write,
                   user_buffer_input_data_to_the_master_write,
                   user_write_buffer_to_the_master_write
                )
;

  output           aux_scan_clk_from_the_ddr2;
  output           aux_scan_clk_reset_n_from_the_ddr2;
  output           control_done_from_the_master_read;
  output           control_done_from_the_master_write;
  output           control_early_done_from_the_master_read;
  output           ddr2_aux_full_rate_clk_out;
  output           ddr2_aux_half_rate_clk_out;
  output           ddr2_phy_clk_out;
  output           dll_reference_clk_from_the_ddr2;
  output  [  5: 0] dqs_delay_ctrl_export_from_the_ddr2;
  output           local_init_done_from_the_ddr2;
  output           local_refresh_ack_from_the_ddr2;
  output           local_wdata_req_from_the_ddr2;
  output  [ 13: 0] mem_addr_from_the_ddr2;
  output  [  2: 0] mem_ba_from_the_ddr2;
  output           mem_cas_n_from_the_ddr2;
  output           mem_cke_from_the_ddr2;
  inout   [  1: 0] mem_clk_n_to_and_from_the_ddr2;
  inout   [  1: 0] mem_clk_to_and_from_the_ddr2;
  output           mem_cs_n_from_the_ddr2;
  output  [  7: 0] mem_dm_from_the_ddr2;
  inout   [ 63: 0] mem_dq_to_and_from_the_ddr2;
  inout   [  7: 0] mem_dqs_to_and_from_the_ddr2;
  inout   [  7: 0] mem_dqsn_to_and_from_the_ddr2;
  output           mem_odt_from_the_ddr2;
  output           mem_ras_n_from_the_ddr2;
  output           mem_we_n_from_the_ddr2;
  output           reset_phy_clk_n_from_the_ddr2;
  output           user_buffer_full_from_the_master_write;
  output  [ 31: 0] user_buffer_output_data_from_the_master_read;
  output           user_data_available_from_the_master_read;
  input            clk_50;
  input            control_fixed_location_to_the_master_read;
  input            control_fixed_location_to_the_master_write;
  input            control_go_to_the_master_read;
  input            control_go_to_the_master_write;
  input   [ 29: 0] control_read_base_to_the_master_read;
  input   [ 29: 0] control_read_length_to_the_master_read;
  input   [ 29: 0] control_write_base_to_the_master_write;
  input   [ 29: 0] control_write_length_to_the_master_write;
  input            global_reset_n_to_the_ddr2;
  input   [ 13: 0] oct_ctl_rs_value_to_the_ddr2;
  input   [ 13: 0] oct_ctl_rt_value_to_the_ddr2;
  input            reset_n;
  input   [ 31: 0] user_buffer_input_data_to_the_master_write;
  input            user_read_buffer_to_the_master_read;
  input            user_write_buffer_to_the_master_write;

  wire    [ 29: 0] DE4_SOPC_burst_0_downstream_address;
  wire    [ 29: 0] DE4_SOPC_burst_0_downstream_address_to_slave;
  wire    [  1: 0] DE4_SOPC_burst_0_downstream_arbitrationshare;
  wire    [  2: 0] DE4_SOPC_burst_0_downstream_burstcount;
  wire    [ 31: 0] DE4_SOPC_burst_0_downstream_byteenable;
  wire             DE4_SOPC_burst_0_downstream_debugaccess;
  wire             DE4_SOPC_burst_0_downstream_granted_ddr2_s1;
  wire             DE4_SOPC_burst_0_downstream_latency_counter;
  wire    [ 29: 0] DE4_SOPC_burst_0_downstream_nativeaddress;
  wire             DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1;
  wire             DE4_SOPC_burst_0_downstream_read;
  wire             DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1;
  wire             DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1_shift_register;
  wire    [255: 0] DE4_SOPC_burst_0_downstream_readdata;
  wire             DE4_SOPC_burst_0_downstream_readdatavalid;
  wire             DE4_SOPC_burst_0_downstream_requests_ddr2_s1;
  wire             DE4_SOPC_burst_0_downstream_reset_n;
  wire             DE4_SOPC_burst_0_downstream_waitrequest;
  wire             DE4_SOPC_burst_0_downstream_write;
  wire    [255: 0] DE4_SOPC_burst_0_downstream_writedata;
  wire    [ 29: 0] DE4_SOPC_burst_0_upstream_address;
  wire    [  1: 0] DE4_SOPC_burst_0_upstream_burstcount;
  wire    [ 34: 0] DE4_SOPC_burst_0_upstream_byteaddress;
  wire    [ 31: 0] DE4_SOPC_burst_0_upstream_byteenable;
  wire             DE4_SOPC_burst_0_upstream_debugaccess;
  wire             DE4_SOPC_burst_0_upstream_read;
  wire    [255: 0] DE4_SOPC_burst_0_upstream_readdata;
  wire    [255: 0] DE4_SOPC_burst_0_upstream_readdata_from_sa;
  wire             DE4_SOPC_burst_0_upstream_readdatavalid;
  wire             DE4_SOPC_burst_0_upstream_waitrequest;
  wire             DE4_SOPC_burst_0_upstream_waitrequest_from_sa;
  wire             DE4_SOPC_burst_0_upstream_write;
  wire    [255: 0] DE4_SOPC_burst_0_upstream_writedata;
  wire             aux_scan_clk_from_the_ddr2;
  wire             aux_scan_clk_reset_n_from_the_ddr2;
  wire             clk_50_reset_n;
  wire    [ 29: 0] clock_crossing_m1_address;
  wire    [ 29: 0] clock_crossing_m1_address_to_slave;
  wire    [  1: 0] clock_crossing_m1_burstcount;
  wire    [  3: 0] clock_crossing_m1_byteenable;
  wire             clock_crossing_m1_endofpacket;
  wire             clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream;
  wire             clock_crossing_m1_latency_counter;
  wire    [ 27: 0] clock_crossing_m1_nativeaddress;
  wire             clock_crossing_m1_qualified_request_DE4_SOPC_burst_0_upstream;
  wire             clock_crossing_m1_read;
  wire             clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream;
  wire             clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream_shift_register;
  wire    [ 31: 0] clock_crossing_m1_readdata;
  wire             clock_crossing_m1_readdatavalid;
  wire             clock_crossing_m1_requests_DE4_SOPC_burst_0_upstream;
  wire             clock_crossing_m1_reset_n;
  wire             clock_crossing_m1_waitrequest;
  wire             clock_crossing_m1_write;
  wire    [ 31: 0] clock_crossing_m1_writedata;
  wire    [ 27: 0] clock_crossing_s1_address;
  wire    [  1: 0] clock_crossing_s1_burstcount;
  wire    [  3: 0] clock_crossing_s1_byteenable;
  wire             clock_crossing_s1_endofpacket;
  wire             clock_crossing_s1_endofpacket_from_sa;
  wire    [ 27: 0] clock_crossing_s1_nativeaddress;
  wire             clock_crossing_s1_read;
  wire    [ 31: 0] clock_crossing_s1_readdata;
  wire    [ 31: 0] clock_crossing_s1_readdata_from_sa;
  wire             clock_crossing_s1_readdatavalid;
  wire             clock_crossing_s1_reset_n;
  wire             clock_crossing_s1_waitrequest;
  wire             clock_crossing_s1_waitrequest_from_sa;
  wire             clock_crossing_s1_write;
  wire    [ 31: 0] clock_crossing_s1_writedata;
  wire             control_done_from_the_master_read;
  wire             control_done_from_the_master_write;
  wire             control_early_done_from_the_master_read;
  wire             d1_DE4_SOPC_burst_0_upstream_end_xfer;
  wire             d1_clock_crossing_s1_end_xfer;
  wire             d1_ddr2_s1_end_xfer;
  wire             ddr2_aux_full_rate_clk_out;
  wire             ddr2_aux_half_rate_clk_out;
  wire             ddr2_phy_clk_out;
  wire             ddr2_phy_clk_out_reset_n;
  wire    [ 24: 0] ddr2_s1_address;
  wire             ddr2_s1_beginbursttransfer;
  wire    [  2: 0] ddr2_s1_burstcount;
  wire    [ 31: 0] ddr2_s1_byteenable;
  wire             ddr2_s1_read;
  wire    [255: 0] ddr2_s1_readdata;
  wire    [255: 0] ddr2_s1_readdata_from_sa;
  wire             ddr2_s1_readdatavalid;
  wire             ddr2_s1_resetrequest_n;
  wire             ddr2_s1_resetrequest_n_from_sa;
  wire             ddr2_s1_waitrequest_n;
  wire             ddr2_s1_waitrequest_n_from_sa;
  wire             ddr2_s1_write;
  wire    [255: 0] ddr2_s1_writedata;
  wire             dll_reference_clk_from_the_ddr2;
  wire    [  5: 0] dqs_delay_ctrl_export_from_the_ddr2;
  wire             local_init_done_from_the_ddr2;
  wire             local_refresh_ack_from_the_ddr2;
  wire             local_wdata_req_from_the_ddr2;
  wire    [ 29: 0] master_read_avalon_master_address;
  wire    [ 29: 0] master_read_avalon_master_address_to_slave;
  wire             master_read_avalon_master_burstcount;
  wire    [  3: 0] master_read_avalon_master_byteenable;
  wire             master_read_avalon_master_read;
  wire    [ 31: 0] master_read_avalon_master_readdata;
  wire             master_read_avalon_master_readdatavalid;
  wire             master_read_avalon_master_reset;
  wire             master_read_avalon_master_waitrequest;
  wire             master_read_granted_clock_crossing_s1;
  wire             master_read_latency_counter;
  wire             master_read_qualified_request_clock_crossing_s1;
  wire             master_read_read_data_valid_clock_crossing_s1;
  wire             master_read_read_data_valid_clock_crossing_s1_shift_register;
  wire             master_read_requests_clock_crossing_s1;
  wire    [ 29: 0] master_write_avalon_master_address;
  wire    [ 29: 0] master_write_avalon_master_address_to_slave;
  wire             master_write_avalon_master_burstcount;
  wire    [  3: 0] master_write_avalon_master_byteenable;
  wire             master_write_avalon_master_reset;
  wire             master_write_avalon_master_waitrequest;
  wire             master_write_avalon_master_write;
  wire    [ 31: 0] master_write_avalon_master_writedata;
  wire             master_write_granted_clock_crossing_s1;
  wire             master_write_qualified_request_clock_crossing_s1;
  wire             master_write_requests_clock_crossing_s1;
  wire    [ 13: 0] mem_addr_from_the_ddr2;
  wire    [  2: 0] mem_ba_from_the_ddr2;
  wire             mem_cas_n_from_the_ddr2;
  wire             mem_cke_from_the_ddr2;
  wire    [  1: 0] mem_clk_n_to_and_from_the_ddr2;
  wire    [  1: 0] mem_clk_to_and_from_the_ddr2;
  wire             mem_cs_n_from_the_ddr2;
  wire    [  7: 0] mem_dm_from_the_ddr2;
  wire    [ 63: 0] mem_dq_to_and_from_the_ddr2;
  wire    [  7: 0] mem_dqs_to_and_from_the_ddr2;
  wire    [  7: 0] mem_dqsn_to_and_from_the_ddr2;
  wire             mem_odt_from_the_ddr2;
  wire             mem_ras_n_from_the_ddr2;
  wire             mem_we_n_from_the_ddr2;
  wire             out_clk_ddr2_aux_full_rate_clk;
  wire             out_clk_ddr2_aux_half_rate_clk;
  wire             out_clk_ddr2_phy_clk;
  wire             reset_n_sources;
  wire             reset_phy_clk_n_from_the_ddr2;
  wire             user_buffer_full_from_the_master_write;
  wire    [ 31: 0] user_buffer_output_data_from_the_master_read;
  wire             user_data_available_from_the_master_read;
  DE4_SOPC_burst_0_upstream_arbitrator the_DE4_SOPC_burst_0_upstream
    (
      .DE4_SOPC_burst_0_upstream_address                                          (DE4_SOPC_burst_0_upstream_address),
      .DE4_SOPC_burst_0_upstream_burstcount                                       (DE4_SOPC_burst_0_upstream_burstcount),
      .DE4_SOPC_burst_0_upstream_byteaddress                                      (DE4_SOPC_burst_0_upstream_byteaddress),
      .DE4_SOPC_burst_0_upstream_byteenable                                       (DE4_SOPC_burst_0_upstream_byteenable),
      .DE4_SOPC_burst_0_upstream_debugaccess                                      (DE4_SOPC_burst_0_upstream_debugaccess),
      .DE4_SOPC_burst_0_upstream_read                                             (DE4_SOPC_burst_0_upstream_read),
      .DE4_SOPC_burst_0_upstream_readdata                                         (DE4_SOPC_burst_0_upstream_readdata),
      .DE4_SOPC_burst_0_upstream_readdata_from_sa                                 (DE4_SOPC_burst_0_upstream_readdata_from_sa),
      .DE4_SOPC_burst_0_upstream_readdatavalid                                    (DE4_SOPC_burst_0_upstream_readdatavalid),
      .DE4_SOPC_burst_0_upstream_waitrequest                                      (DE4_SOPC_burst_0_upstream_waitrequest),
      .DE4_SOPC_burst_0_upstream_waitrequest_from_sa                              (DE4_SOPC_burst_0_upstream_waitrequest_from_sa),
      .DE4_SOPC_burst_0_upstream_write                                            (DE4_SOPC_burst_0_upstream_write),
      .DE4_SOPC_burst_0_upstream_writedata                                        (DE4_SOPC_burst_0_upstream_writedata),
      .clk                                                                        (ddr2_phy_clk_out),
      .clock_crossing_m1_address_to_slave                                         (clock_crossing_m1_address_to_slave),
      .clock_crossing_m1_burstcount                                               (clock_crossing_m1_burstcount),
      .clock_crossing_m1_byteenable                                               (clock_crossing_m1_byteenable),
      .clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream                        (clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream),
      .clock_crossing_m1_latency_counter                                          (clock_crossing_m1_latency_counter),
      .clock_crossing_m1_qualified_request_DE4_SOPC_burst_0_upstream              (clock_crossing_m1_qualified_request_DE4_SOPC_burst_0_upstream),
      .clock_crossing_m1_read                                                     (clock_crossing_m1_read),
      .clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream                (clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream),
      .clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream_shift_register (clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream_shift_register),
      .clock_crossing_m1_requests_DE4_SOPC_burst_0_upstream                       (clock_crossing_m1_requests_DE4_SOPC_burst_0_upstream),
      .clock_crossing_m1_write                                                    (clock_crossing_m1_write),
      .clock_crossing_m1_writedata                                                (clock_crossing_m1_writedata),
      .d1_DE4_SOPC_burst_0_upstream_end_xfer                                      (d1_DE4_SOPC_burst_0_upstream_end_xfer),
      .reset_n                                                                    (ddr2_phy_clk_out_reset_n)
    );

  DE4_SOPC_burst_0_downstream_arbitrator the_DE4_SOPC_burst_0_downstream
    (
      .DE4_SOPC_burst_0_downstream_address                                (DE4_SOPC_burst_0_downstream_address),
      .DE4_SOPC_burst_0_downstream_address_to_slave                       (DE4_SOPC_burst_0_downstream_address_to_slave),
      .DE4_SOPC_burst_0_downstream_burstcount                             (DE4_SOPC_burst_0_downstream_burstcount),
      .DE4_SOPC_burst_0_downstream_byteenable                             (DE4_SOPC_burst_0_downstream_byteenable),
      .DE4_SOPC_burst_0_downstream_granted_ddr2_s1                        (DE4_SOPC_burst_0_downstream_granted_ddr2_s1),
      .DE4_SOPC_burst_0_downstream_latency_counter                        (DE4_SOPC_burst_0_downstream_latency_counter),
      .DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1              (DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1),
      .DE4_SOPC_burst_0_downstream_read                                   (DE4_SOPC_burst_0_downstream_read),
      .DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1                (DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1),
      .DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1_shift_register (DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1_shift_register),
      .DE4_SOPC_burst_0_downstream_readdata                               (DE4_SOPC_burst_0_downstream_readdata),
      .DE4_SOPC_burst_0_downstream_readdatavalid                          (DE4_SOPC_burst_0_downstream_readdatavalid),
      .DE4_SOPC_burst_0_downstream_requests_ddr2_s1                       (DE4_SOPC_burst_0_downstream_requests_ddr2_s1),
      .DE4_SOPC_burst_0_downstream_reset_n                                (DE4_SOPC_burst_0_downstream_reset_n),
      .DE4_SOPC_burst_0_downstream_waitrequest                            (DE4_SOPC_burst_0_downstream_waitrequest),
      .DE4_SOPC_burst_0_downstream_write                                  (DE4_SOPC_burst_0_downstream_write),
      .DE4_SOPC_burst_0_downstream_writedata                              (DE4_SOPC_burst_0_downstream_writedata),
      .clk                                                                (ddr2_phy_clk_out),
      .d1_ddr2_s1_end_xfer                                                (d1_ddr2_s1_end_xfer),
      .ddr2_s1_readdata_from_sa                                           (ddr2_s1_readdata_from_sa),
      .ddr2_s1_waitrequest_n_from_sa                                      (ddr2_s1_waitrequest_n_from_sa),
      .reset_n                                                            (ddr2_phy_clk_out_reset_n)
    );

  DE4_SOPC_burst_0 the_DE4_SOPC_burst_0
    (
      .clk                         (ddr2_phy_clk_out),
      .downstream_address          (DE4_SOPC_burst_0_downstream_address),
      .downstream_arbitrationshare (DE4_SOPC_burst_0_downstream_arbitrationshare),
      .downstream_burstcount       (DE4_SOPC_burst_0_downstream_burstcount),
      .downstream_byteenable       (DE4_SOPC_burst_0_downstream_byteenable),
      .downstream_debugaccess      (DE4_SOPC_burst_0_downstream_debugaccess),
      .downstream_nativeaddress    (DE4_SOPC_burst_0_downstream_nativeaddress),
      .downstream_read             (DE4_SOPC_burst_0_downstream_read),
      .downstream_readdata         (DE4_SOPC_burst_0_downstream_readdata),
      .downstream_readdatavalid    (DE4_SOPC_burst_0_downstream_readdatavalid),
      .downstream_waitrequest      (DE4_SOPC_burst_0_downstream_waitrequest),
      .downstream_write            (DE4_SOPC_burst_0_downstream_write),
      .downstream_writedata        (DE4_SOPC_burst_0_downstream_writedata),
      .reset_n                     (DE4_SOPC_burst_0_downstream_reset_n),
      .upstream_address            (DE4_SOPC_burst_0_upstream_byteaddress),
      .upstream_burstcount         (DE4_SOPC_burst_0_upstream_burstcount),
      .upstream_byteenable         (DE4_SOPC_burst_0_upstream_byteenable),
      .upstream_debugaccess        (DE4_SOPC_burst_0_upstream_debugaccess),
      .upstream_nativeaddress      (DE4_SOPC_burst_0_upstream_address),
      .upstream_read               (DE4_SOPC_burst_0_upstream_read),
      .upstream_readdata           (DE4_SOPC_burst_0_upstream_readdata),
      .upstream_readdatavalid      (DE4_SOPC_burst_0_upstream_readdatavalid),
      .upstream_waitrequest        (DE4_SOPC_burst_0_upstream_waitrequest),
      .upstream_write              (DE4_SOPC_burst_0_upstream_write),
      .upstream_writedata          (DE4_SOPC_burst_0_upstream_writedata)
    );

  clock_crossing_s1_arbitrator the_clock_crossing_s1
    (
      .clk                                                          (clk_50),
      .clock_crossing_s1_address                                    (clock_crossing_s1_address),
      .clock_crossing_s1_burstcount                                 (clock_crossing_s1_burstcount),
      .clock_crossing_s1_byteenable                                 (clock_crossing_s1_byteenable),
      .clock_crossing_s1_endofpacket                                (clock_crossing_s1_endofpacket),
      .clock_crossing_s1_endofpacket_from_sa                        (clock_crossing_s1_endofpacket_from_sa),
      .clock_crossing_s1_nativeaddress                              (clock_crossing_s1_nativeaddress),
      .clock_crossing_s1_read                                       (clock_crossing_s1_read),
      .clock_crossing_s1_readdata                                   (clock_crossing_s1_readdata),
      .clock_crossing_s1_readdata_from_sa                           (clock_crossing_s1_readdata_from_sa),
      .clock_crossing_s1_readdatavalid                              (clock_crossing_s1_readdatavalid),
      .clock_crossing_s1_reset_n                                    (clock_crossing_s1_reset_n),
      .clock_crossing_s1_waitrequest                                (clock_crossing_s1_waitrequest),
      .clock_crossing_s1_waitrequest_from_sa                        (clock_crossing_s1_waitrequest_from_sa),
      .clock_crossing_s1_write                                      (clock_crossing_s1_write),
      .clock_crossing_s1_writedata                                  (clock_crossing_s1_writedata),
      .d1_clock_crossing_s1_end_xfer                                (d1_clock_crossing_s1_end_xfer),
      .master_read_avalon_master_address_to_slave                   (master_read_avalon_master_address_to_slave),
      .master_read_avalon_master_burstcount                         (master_read_avalon_master_burstcount),
      .master_read_avalon_master_read                               (master_read_avalon_master_read),
      .master_read_granted_clock_crossing_s1                        (master_read_granted_clock_crossing_s1),
      .master_read_latency_counter                                  (master_read_latency_counter),
      .master_read_qualified_request_clock_crossing_s1              (master_read_qualified_request_clock_crossing_s1),
      .master_read_read_data_valid_clock_crossing_s1                (master_read_read_data_valid_clock_crossing_s1),
      .master_read_read_data_valid_clock_crossing_s1_shift_register (master_read_read_data_valid_clock_crossing_s1_shift_register),
      .master_read_requests_clock_crossing_s1                       (master_read_requests_clock_crossing_s1),
      .master_write_avalon_master_address_to_slave                  (master_write_avalon_master_address_to_slave),
      .master_write_avalon_master_burstcount                        (master_write_avalon_master_burstcount),
      .master_write_avalon_master_byteenable                        (master_write_avalon_master_byteenable),
      .master_write_avalon_master_write                             (master_write_avalon_master_write),
      .master_write_avalon_master_writedata                         (master_write_avalon_master_writedata),
      .master_write_granted_clock_crossing_s1                       (master_write_granted_clock_crossing_s1),
      .master_write_qualified_request_clock_crossing_s1             (master_write_qualified_request_clock_crossing_s1),
      .master_write_requests_clock_crossing_s1                      (master_write_requests_clock_crossing_s1),
      .reset_n                                                      (clk_50_reset_n)
    );

  clock_crossing_m1_arbitrator the_clock_crossing_m1
    (
      .DE4_SOPC_burst_0_upstream_readdata_from_sa                                 (DE4_SOPC_burst_0_upstream_readdata_from_sa),
      .DE4_SOPC_burst_0_upstream_waitrequest_from_sa                              (DE4_SOPC_burst_0_upstream_waitrequest_from_sa),
      .clk                                                                        (ddr2_phy_clk_out),
      .clock_crossing_m1_address                                                  (clock_crossing_m1_address),
      .clock_crossing_m1_address_to_slave                                         (clock_crossing_m1_address_to_slave),
      .clock_crossing_m1_burstcount                                               (clock_crossing_m1_burstcount),
      .clock_crossing_m1_byteenable                                               (clock_crossing_m1_byteenable),
      .clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream                        (clock_crossing_m1_granted_DE4_SOPC_burst_0_upstream),
      .clock_crossing_m1_latency_counter                                          (clock_crossing_m1_latency_counter),
      .clock_crossing_m1_qualified_request_DE4_SOPC_burst_0_upstream              (clock_crossing_m1_qualified_request_DE4_SOPC_burst_0_upstream),
      .clock_crossing_m1_read                                                     (clock_crossing_m1_read),
      .clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream                (clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream),
      .clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream_shift_register (clock_crossing_m1_read_data_valid_DE4_SOPC_burst_0_upstream_shift_register),
      .clock_crossing_m1_readdata                                                 (clock_crossing_m1_readdata),
      .clock_crossing_m1_readdatavalid                                            (clock_crossing_m1_readdatavalid),
      .clock_crossing_m1_requests_DE4_SOPC_burst_0_upstream                       (clock_crossing_m1_requests_DE4_SOPC_burst_0_upstream),
      .clock_crossing_m1_reset_n                                                  (clock_crossing_m1_reset_n),
      .clock_crossing_m1_waitrequest                                              (clock_crossing_m1_waitrequest),
      .clock_crossing_m1_write                                                    (clock_crossing_m1_write),
      .clock_crossing_m1_writedata                                                (clock_crossing_m1_writedata),
      .d1_DE4_SOPC_burst_0_upstream_end_xfer                                      (d1_DE4_SOPC_burst_0_upstream_end_xfer),
      .reset_n                                                                    (ddr2_phy_clk_out_reset_n)
    );

  clock_crossing the_clock_crossing
    (
      .master_address       (clock_crossing_m1_address),
      .master_burstcount    (clock_crossing_m1_burstcount),
      .master_byteenable    (clock_crossing_m1_byteenable),
      .master_clk           (ddr2_phy_clk_out),
      .master_endofpacket   (clock_crossing_m1_endofpacket),
      .master_nativeaddress (clock_crossing_m1_nativeaddress),
      .master_read          (clock_crossing_m1_read),
      .master_readdata      (clock_crossing_m1_readdata),
      .master_readdatavalid (clock_crossing_m1_readdatavalid),
      .master_reset_n       (clock_crossing_m1_reset_n),
      .master_waitrequest   (clock_crossing_m1_waitrequest),
      .master_write         (clock_crossing_m1_write),
      .master_writedata     (clock_crossing_m1_writedata),
      .slave_address        (clock_crossing_s1_address),
      .slave_burstcount     (clock_crossing_s1_burstcount),
      .slave_byteenable     (clock_crossing_s1_byteenable),
      .slave_clk            (clk_50),
      .slave_endofpacket    (clock_crossing_s1_endofpacket),
      .slave_nativeaddress  (clock_crossing_s1_nativeaddress),
      .slave_read           (clock_crossing_s1_read),
      .slave_readdata       (clock_crossing_s1_readdata),
      .slave_readdatavalid  (clock_crossing_s1_readdatavalid),
      .slave_reset_n        (clock_crossing_s1_reset_n),
      .slave_waitrequest    (clock_crossing_s1_waitrequest),
      .slave_write          (clock_crossing_s1_write),
      .slave_writedata      (clock_crossing_s1_writedata)
    );

  ddr2_s1_arbitrator the_ddr2_s1
    (
      .DE4_SOPC_burst_0_downstream_address_to_slave                       (DE4_SOPC_burst_0_downstream_address_to_slave),
      .DE4_SOPC_burst_0_downstream_arbitrationshare                       (DE4_SOPC_burst_0_downstream_arbitrationshare),
      .DE4_SOPC_burst_0_downstream_burstcount                             (DE4_SOPC_burst_0_downstream_burstcount),
      .DE4_SOPC_burst_0_downstream_byteenable                             (DE4_SOPC_burst_0_downstream_byteenable),
      .DE4_SOPC_burst_0_downstream_granted_ddr2_s1                        (DE4_SOPC_burst_0_downstream_granted_ddr2_s1),
      .DE4_SOPC_burst_0_downstream_latency_counter                        (DE4_SOPC_burst_0_downstream_latency_counter),
      .DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1              (DE4_SOPC_burst_0_downstream_qualified_request_ddr2_s1),
      .DE4_SOPC_burst_0_downstream_read                                   (DE4_SOPC_burst_0_downstream_read),
      .DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1                (DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1),
      .DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1_shift_register (DE4_SOPC_burst_0_downstream_read_data_valid_ddr2_s1_shift_register),
      .DE4_SOPC_burst_0_downstream_requests_ddr2_s1                       (DE4_SOPC_burst_0_downstream_requests_ddr2_s1),
      .DE4_SOPC_burst_0_downstream_write                                  (DE4_SOPC_burst_0_downstream_write),
      .DE4_SOPC_burst_0_downstream_writedata                              (DE4_SOPC_burst_0_downstream_writedata),
      .clk                                                                (ddr2_phy_clk_out),
      .d1_ddr2_s1_end_xfer                                                (d1_ddr2_s1_end_xfer),
      .ddr2_s1_address                                                    (ddr2_s1_address),
      .ddr2_s1_beginbursttransfer                                         (ddr2_s1_beginbursttransfer),
      .ddr2_s1_burstcount                                                 (ddr2_s1_burstcount),
      .ddr2_s1_byteenable                                                 (ddr2_s1_byteenable),
      .ddr2_s1_read                                                       (ddr2_s1_read),
      .ddr2_s1_readdata                                                   (ddr2_s1_readdata),
      .ddr2_s1_readdata_from_sa                                           (ddr2_s1_readdata_from_sa),
      .ddr2_s1_readdatavalid                                              (ddr2_s1_readdatavalid),
      .ddr2_s1_resetrequest_n                                             (ddr2_s1_resetrequest_n),
      .ddr2_s1_resetrequest_n_from_sa                                     (ddr2_s1_resetrequest_n_from_sa),
      .ddr2_s1_waitrequest_n                                              (ddr2_s1_waitrequest_n),
      .ddr2_s1_waitrequest_n_from_sa                                      (ddr2_s1_waitrequest_n_from_sa),
      .ddr2_s1_write                                                      (ddr2_s1_write),
      .ddr2_s1_writedata                                                  (ddr2_s1_writedata),
      .reset_n                                                            (ddr2_phy_clk_out_reset_n)
    );

  //ddr2_aux_full_rate_clk_out out_clk assignment, which is an e_assign
  assign ddr2_aux_full_rate_clk_out = out_clk_ddr2_aux_full_rate_clk;

  //ddr2_aux_half_rate_clk_out out_clk assignment, which is an e_assign
  assign ddr2_aux_half_rate_clk_out = out_clk_ddr2_aux_half_rate_clk;

  //ddr2_phy_clk_out out_clk assignment, which is an e_assign
  assign ddr2_phy_clk_out = out_clk_ddr2_phy_clk;

  //reset is asserted asynchronously and deasserted synchronously
  DE4_SOPC_reset_clk_50_domain_synch_module DE4_SOPC_reset_clk_50_domain_synch
    (
      .clk      (clk_50),
      .data_in  (1'b1),
      .data_out (clk_50_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    0 |
    ~ddr2_s1_resetrequest_n_from_sa |
    ~ddr2_s1_resetrequest_n_from_sa);

  ddr2 the_ddr2
    (
      .aux_full_rate_clk     (out_clk_ddr2_aux_full_rate_clk),
      .aux_half_rate_clk     (out_clk_ddr2_aux_half_rate_clk),
      .aux_scan_clk          (aux_scan_clk_from_the_ddr2),
      .aux_scan_clk_reset_n  (aux_scan_clk_reset_n_from_the_ddr2),
      .dll_reference_clk     (dll_reference_clk_from_the_ddr2),
      .dqs_delay_ctrl_export (dqs_delay_ctrl_export_from_the_ddr2),
      .global_reset_n        (global_reset_n_to_the_ddr2),
      .local_address         (ddr2_s1_address),
      .local_be              (ddr2_s1_byteenable),
      .local_burstbegin      (ddr2_s1_beginbursttransfer),
      .local_init_done       (local_init_done_from_the_ddr2),
      .local_rdata           (ddr2_s1_readdata),
      .local_rdata_valid     (ddr2_s1_readdatavalid),
      .local_read_req        (ddr2_s1_read),
      .local_ready           (ddr2_s1_waitrequest_n),
      .local_refresh_ack     (local_refresh_ack_from_the_ddr2),
      .local_size            (ddr2_s1_burstcount),
      .local_wdata           (ddr2_s1_writedata),
      .local_wdata_req       (local_wdata_req_from_the_ddr2),
      .local_write_req       (ddr2_s1_write),
      .mem_addr              (mem_addr_from_the_ddr2),
      .mem_ba                (mem_ba_from_the_ddr2),
      .mem_cas_n             (mem_cas_n_from_the_ddr2),
      .mem_cke               (mem_cke_from_the_ddr2),
      .mem_clk               (mem_clk_to_and_from_the_ddr2),
      .mem_clk_n             (mem_clk_n_to_and_from_the_ddr2),
      .mem_cs_n              (mem_cs_n_from_the_ddr2),
      .mem_dm                (mem_dm_from_the_ddr2),
      .mem_dq                (mem_dq_to_and_from_the_ddr2),
      .mem_dqs               (mem_dqs_to_and_from_the_ddr2),
      .mem_dqsn              (mem_dqsn_to_and_from_the_ddr2),
      .mem_odt               (mem_odt_from_the_ddr2),
      .mem_ras_n             (mem_ras_n_from_the_ddr2),
      .mem_we_n              (mem_we_n_from_the_ddr2),
      .oct_ctl_rs_value      (oct_ctl_rs_value_to_the_ddr2),
      .oct_ctl_rt_value      (oct_ctl_rt_value_to_the_ddr2),
      .phy_clk               (out_clk_ddr2_phy_clk),
      .pll_ref_clk           (clk_50),
      .reset_phy_clk_n       (reset_phy_clk_n_from_the_ddr2),
      .reset_request_n       (ddr2_s1_resetrequest_n),
      .soft_reset_n          (clk_50_reset_n)
    );

  master_read_avalon_master_arbitrator the_master_read_avalon_master
    (
      .clk                                                          (clk_50),
      .clock_crossing_s1_readdata_from_sa                           (clock_crossing_s1_readdata_from_sa),
      .clock_crossing_s1_waitrequest_from_sa                        (clock_crossing_s1_waitrequest_from_sa),
      .d1_clock_crossing_s1_end_xfer                                (d1_clock_crossing_s1_end_xfer),
      .master_read_avalon_master_address                            (master_read_avalon_master_address),
      .master_read_avalon_master_address_to_slave                   (master_read_avalon_master_address_to_slave),
      .master_read_avalon_master_burstcount                         (master_read_avalon_master_burstcount),
      .master_read_avalon_master_byteenable                         (master_read_avalon_master_byteenable),
      .master_read_avalon_master_read                               (master_read_avalon_master_read),
      .master_read_avalon_master_readdata                           (master_read_avalon_master_readdata),
      .master_read_avalon_master_readdatavalid                      (master_read_avalon_master_readdatavalid),
      .master_read_avalon_master_reset                              (master_read_avalon_master_reset),
      .master_read_avalon_master_waitrequest                        (master_read_avalon_master_waitrequest),
      .master_read_granted_clock_crossing_s1                        (master_read_granted_clock_crossing_s1),
      .master_read_latency_counter                                  (master_read_latency_counter),
      .master_read_qualified_request_clock_crossing_s1              (master_read_qualified_request_clock_crossing_s1),
      .master_read_read_data_valid_clock_crossing_s1                (master_read_read_data_valid_clock_crossing_s1),
      .master_read_read_data_valid_clock_crossing_s1_shift_register (master_read_read_data_valid_clock_crossing_s1_shift_register),
      .master_read_requests_clock_crossing_s1                       (master_read_requests_clock_crossing_s1),
      .reset_n                                                      (clk_50_reset_n)
    );

  master_read the_master_read
    (
      .clk                     (clk_50),
      .control_done            (control_done_from_the_master_read),
      .control_early_done      (control_early_done_from_the_master_read),
      .control_fixed_location  (control_fixed_location_to_the_master_read),
      .control_go              (control_go_to_the_master_read),
      .control_read_base       (control_read_base_to_the_master_read),
      .control_read_length     (control_read_length_to_the_master_read),
      .master_address          (master_read_avalon_master_address),
      .master_burstcount       (master_read_avalon_master_burstcount),
      .master_byteenable       (master_read_avalon_master_byteenable),
      .master_read             (master_read_avalon_master_read),
      .master_readdata         (master_read_avalon_master_readdata),
      .master_readdatavalid    (master_read_avalon_master_readdatavalid),
      .master_waitrequest      (master_read_avalon_master_waitrequest),
      .reset                   (master_read_avalon_master_reset),
      .user_buffer_output_data (user_buffer_output_data_from_the_master_read),
      .user_data_available     (user_data_available_from_the_master_read),
      .user_read_buffer        (user_read_buffer_to_the_master_read)
    );

  master_write_avalon_master_arbitrator the_master_write_avalon_master
    (
      .clk                                              (clk_50),
      .clock_crossing_s1_waitrequest_from_sa            (clock_crossing_s1_waitrequest_from_sa),
      .d1_clock_crossing_s1_end_xfer                    (d1_clock_crossing_s1_end_xfer),
      .master_write_avalon_master_address               (master_write_avalon_master_address),
      .master_write_avalon_master_address_to_slave      (master_write_avalon_master_address_to_slave),
      .master_write_avalon_master_burstcount            (master_write_avalon_master_burstcount),
      .master_write_avalon_master_byteenable            (master_write_avalon_master_byteenable),
      .master_write_avalon_master_reset                 (master_write_avalon_master_reset),
      .master_write_avalon_master_waitrequest           (master_write_avalon_master_waitrequest),
      .master_write_avalon_master_write                 (master_write_avalon_master_write),
      .master_write_avalon_master_writedata             (master_write_avalon_master_writedata),
      .master_write_granted_clock_crossing_s1           (master_write_granted_clock_crossing_s1),
      .master_write_qualified_request_clock_crossing_s1 (master_write_qualified_request_clock_crossing_s1),
      .master_write_requests_clock_crossing_s1          (master_write_requests_clock_crossing_s1),
      .reset_n                                          (clk_50_reset_n)
    );

  master_write the_master_write
    (
      .clk                    (clk_50),
      .control_done           (control_done_from_the_master_write),
      .control_fixed_location (control_fixed_location_to_the_master_write),
      .control_go             (control_go_to_the_master_write),
      .control_write_base     (control_write_base_to_the_master_write),
      .control_write_length   (control_write_length_to_the_master_write),
      .master_address         (master_write_avalon_master_address),
      .master_burstcount      (master_write_avalon_master_burstcount),
      .master_byteenable      (master_write_avalon_master_byteenable),
      .master_waitrequest     (master_write_avalon_master_waitrequest),
      .master_write           (master_write_avalon_master_write),
      .master_writedata       (master_write_avalon_master_writedata),
      .reset                  (master_write_avalon_master_reset),
      .user_buffer_full       (user_buffer_full_from_the_master_write),
      .user_buffer_input_data (user_buffer_input_data_to_the_master_write),
      .user_write_buffer      (user_write_buffer_to_the_master_write)
    );

  //reset is asserted asynchronously and deasserted synchronously
  DE4_SOPC_reset_ddr2_phy_clk_out_domain_synch_module DE4_SOPC_reset_ddr2_phy_clk_out_domain_synch
    (
      .clk      (ddr2_phy_clk_out),
      .data_in  (1'b1),
      .data_out (ddr2_phy_clk_out_reset_n),
      .reset_n  (reset_n_sources)
    );

  //clock_crossing_m1_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign clock_crossing_m1_endofpacket = 0;


endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "c:/altera/91/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/91/quartus/eda/sim_lib/220model.v"
`include "c:/altera/91/quartus/eda/sim_lib/sgate.v"
`include "Avalon_MM-Master_Templates/custom_master.v"
`include "Avalon_MM-Master_Templates/burst_write_master.v"
`include "Avalon_MM-Master_Templates/burst_read_master.v"
`include "Avalon_MM-Master_Templates/write_master.v"
`include "Avalon_MM-Master_Templates/latency_aware_read_master.v"
`include "master_write.v"
`include "master_read.v"
`include "clock_crossing.v"
`include "DE4_SOPC_burst_0.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             DE4_SOPC_burst_0_downstream_debugaccess;
  wire    [ 29: 0] DE4_SOPC_burst_0_downstream_nativeaddress;
  wire             aux_scan_clk_from_the_ddr2;
  wire             aux_scan_clk_reset_n_from_the_ddr2;
  wire             clk;
  reg              clk_50;
  wire             clock_crossing_m1_endofpacket;
  wire    [ 27: 0] clock_crossing_m1_nativeaddress;
  wire             clock_crossing_s1_endofpacket_from_sa;
  wire             control_done_from_the_master_read;
  wire             control_done_from_the_master_write;
  wire             control_early_done_from_the_master_read;
  wire             control_fixed_location_to_the_master_read;
  wire             control_fixed_location_to_the_master_write;
  wire             control_go_to_the_master_read;
  wire             control_go_to_the_master_write;
  wire    [ 29: 0] control_read_base_to_the_master_read;
  wire    [ 29: 0] control_read_length_to_the_master_read;
  wire    [ 29: 0] control_write_base_to_the_master_write;
  wire    [ 29: 0] control_write_length_to_the_master_write;
  wire             ddr2_aux_full_rate_clk_out;
  wire             ddr2_aux_half_rate_clk_out;
  wire             ddr2_phy_clk_out;
  wire             dll_reference_clk_from_the_ddr2;
  wire    [  5: 0] dqs_delay_ctrl_export_from_the_ddr2;
  wire             global_reset_n_to_the_ddr2;
  wire             local_init_done_from_the_ddr2;
  wire             local_refresh_ack_from_the_ddr2;
  wire             local_wdata_req_from_the_ddr2;
  wire    [ 13: 0] mem_addr_from_the_ddr2;
  wire    [  2: 0] mem_ba_from_the_ddr2;
  wire             mem_cas_n_from_the_ddr2;
  wire             mem_cke_from_the_ddr2;
  wire    [  1: 0] mem_clk_n_to_and_from_the_ddr2;
  wire    [  1: 0] mem_clk_to_and_from_the_ddr2;
  wire             mem_cs_n_from_the_ddr2;
  wire    [  7: 0] mem_dm_from_the_ddr2;
  wire    [ 63: 0] mem_dq_to_and_from_the_ddr2;
  wire    [  7: 0] mem_dqs_to_and_from_the_ddr2;
  wire    [  7: 0] mem_dqsn_to_and_from_the_ddr2;
  wire             mem_odt_from_the_ddr2;
  wire             mem_ras_n_from_the_ddr2;
  wire             mem_we_n_from_the_ddr2;
  wire    [ 13: 0] oct_ctl_rs_value_to_the_ddr2;
  wire    [ 13: 0] oct_ctl_rt_value_to_the_ddr2;
  reg              reset_n;
  wire             reset_phy_clk_n_from_the_ddr2;
  wire             user_buffer_full_from_the_master_write;
  wire    [ 31: 0] user_buffer_input_data_to_the_master_write;
  wire    [ 31: 0] user_buffer_output_data_from_the_master_read;
  wire             user_data_available_from_the_master_read;
  wire             user_read_buffer_to_the_master_read;
  wire             user_write_buffer_to_the_master_write;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  DE4_SOPC DUT
    (
      .aux_scan_clk_from_the_ddr2                   (aux_scan_clk_from_the_ddr2),
      .aux_scan_clk_reset_n_from_the_ddr2           (aux_scan_clk_reset_n_from_the_ddr2),
      .clk_50                                       (clk_50),
      .control_done_from_the_master_read            (control_done_from_the_master_read),
      .control_done_from_the_master_write           (control_done_from_the_master_write),
      .control_early_done_from_the_master_read      (control_early_done_from_the_master_read),
      .control_fixed_location_to_the_master_read    (control_fixed_location_to_the_master_read),
      .control_fixed_location_to_the_master_write   (control_fixed_location_to_the_master_write),
      .control_go_to_the_master_read                (control_go_to_the_master_read),
      .control_go_to_the_master_write               (control_go_to_the_master_write),
      .control_read_base_to_the_master_read         (control_read_base_to_the_master_read),
      .control_read_length_to_the_master_read       (control_read_length_to_the_master_read),
      .control_write_base_to_the_master_write       (control_write_base_to_the_master_write),
      .control_write_length_to_the_master_write     (control_write_length_to_the_master_write),
      .ddr2_aux_full_rate_clk_out                   (ddr2_aux_full_rate_clk_out),
      .ddr2_aux_half_rate_clk_out                   (ddr2_aux_half_rate_clk_out),
      .ddr2_phy_clk_out                             (ddr2_phy_clk_out),
      .dll_reference_clk_from_the_ddr2              (dll_reference_clk_from_the_ddr2),
      .dqs_delay_ctrl_export_from_the_ddr2          (dqs_delay_ctrl_export_from_the_ddr2),
      .global_reset_n_to_the_ddr2                   (global_reset_n_to_the_ddr2),
      .local_init_done_from_the_ddr2                (local_init_done_from_the_ddr2),
      .local_refresh_ack_from_the_ddr2              (local_refresh_ack_from_the_ddr2),
      .local_wdata_req_from_the_ddr2                (local_wdata_req_from_the_ddr2),
      .mem_addr_from_the_ddr2                       (mem_addr_from_the_ddr2),
      .mem_ba_from_the_ddr2                         (mem_ba_from_the_ddr2),
      .mem_cas_n_from_the_ddr2                      (mem_cas_n_from_the_ddr2),
      .mem_cke_from_the_ddr2                        (mem_cke_from_the_ddr2),
      .mem_clk_n_to_and_from_the_ddr2               (mem_clk_n_to_and_from_the_ddr2),
      .mem_clk_to_and_from_the_ddr2                 (mem_clk_to_and_from_the_ddr2),
      .mem_cs_n_from_the_ddr2                       (mem_cs_n_from_the_ddr2),
      .mem_dm_from_the_ddr2                         (mem_dm_from_the_ddr2),
      .mem_dq_to_and_from_the_ddr2                  (mem_dq_to_and_from_the_ddr2),
      .mem_dqs_to_and_from_the_ddr2                 (mem_dqs_to_and_from_the_ddr2),
      .mem_dqsn_to_and_from_the_ddr2                (mem_dqsn_to_and_from_the_ddr2),
      .mem_odt_from_the_ddr2                        (mem_odt_from_the_ddr2),
      .mem_ras_n_from_the_ddr2                      (mem_ras_n_from_the_ddr2),
      .mem_we_n_from_the_ddr2                       (mem_we_n_from_the_ddr2),
      .oct_ctl_rs_value_to_the_ddr2                 (oct_ctl_rs_value_to_the_ddr2),
      .oct_ctl_rt_value_to_the_ddr2                 (oct_ctl_rt_value_to_the_ddr2),
      .reset_n                                      (reset_n),
      .reset_phy_clk_n_from_the_ddr2                (reset_phy_clk_n_from_the_ddr2),
      .user_buffer_full_from_the_master_write       (user_buffer_full_from_the_master_write),
      .user_buffer_input_data_to_the_master_write   (user_buffer_input_data_to_the_master_write),
      .user_buffer_output_data_from_the_master_read (user_buffer_output_data_from_the_master_read),
      .user_data_available_from_the_master_read     (user_data_available_from_the_master_read),
      .user_read_buffer_to_the_master_read          (user_read_buffer_to_the_master_read),
      .user_write_buffer_to_the_master_write        (user_write_buffer_to_the_master_write)
    );

  initial
    clk_50 = 1'b0;
  always
    #10 clk_50 <= ~clk_50;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on