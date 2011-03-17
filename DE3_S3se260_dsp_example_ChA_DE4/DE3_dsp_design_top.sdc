## Generated SDC file "DE3_dsp_design_top.sdc"

## Copyright (C) 1991-2007 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 7.2 Build 206 03/17/2008 Service Pack 3 SJ Full Version"

## DATE    "Fri Mar 21 10:00:39 2008"


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {OSC1_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {OSC1_50}] -add
create_clock -name {altera_reserved_tck} -period 100.000 -waveform { 0.000 50.000 } [get_pins { altera_reserved_tck~input|o }] -add
create_clock -name {ada_dco} -period 10.000 -waveform { 5.000 10.000 } [get_ports { ada_dco }] -add


#**************************************************************
# Create Generated Clock
#**************************************************************

derive_pll_clocks


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay -rise -clock [get_clocks {ada_dco}]  -max 5.000 [get_ports {ada_d[0]}]
set_input_delay -add_delay -rise -clock [get_clocks {ada_dco}]  -max 5.000 [get_ports {ada_d[2]}]
set_input_delay -add_delay -rise -clock [get_clocks {ada_dco}]  -max 5.000 [get_ports {ada_d[1]}]
set_input_delay -add_delay -rise -clock [get_clocks {ada_dco}]  -max 5.000 [get_ports {ada_d[11]}]
set_input_delay -add_delay -rise -clock [get_clocks {ada_dco}]  -max 5.000 [get_ports {ada_d[6]}]
set_input_delay -add_delay -rise -clock [get_clocks {ada_dco}]  -max 5.000 [get_ports {ada_d[3]}]
set_input_delay -add_delay -rise -clock [get_clocks {ada_dco}]  -max 5.000 [get_ports {ada_d[4]}]
set_input_delay -add_delay -rise -clock [get_clocks {ada_dco}]  -max 5.000 [get_ports {ada_d[5]}]
set_input_delay -add_delay -rise -clock [get_clocks {ada_dco}]  -max 5.000 [get_ports {ada_d[7]}]
set_input_delay -add_delay -rise -clock [get_clocks {ada_dco}]  -max 5.000 [get_ports {ada_d[8]}]
set_input_delay -add_delay -rise -clock [get_clocks {ada_dco}]  -max 5.000 [get_ports {ada_d[10]}]
set_input_delay -add_delay -rise -clock [get_clocks {ada_dco}]  -max 5.000 [get_ports {ada_d[12]}]
set_input_delay -add_delay -rise -clock [get_clocks {ada_dco}]  -max 5.000 [get_ports {ada_d[13]}]
set_input_delay -add_delay -rise -clock [get_clocks {ada_dco}]  -max 5.000 [get_ports {ada_d[9]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {db[7]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {db[6]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {db[5]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {db[4]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {db[3]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {db[2]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {db[1]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {db[0]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {da[13]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {da[12]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {da[11]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {da[10]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {da[9]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {da[8]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {da[7]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {da[6]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {da[5]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {da[4]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {da[3]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {da[2]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {da[1]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {da[0]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {db[13]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {db[12]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {db[11]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {db[10]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {db[9]}]
set_output_delay -add_delay  -rise -clock [get_clocks {inst|altpll_component|auto_generated|pll1|clk[0]}]  -max 5.000 [get_ports {db[8]}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

set_false_path  -from  [get_ports {SW[0] SW[1] Button[0] Button[1]}]  -to  *
set_false_path  -from  *  -to  [get_ports {LEDB[0] LEDB[1] LEDB[2] LEDB[3] LEDB[4] LEDB[5] LEDB[6] LEDB[7]}]
set_false_path  -from  [get_cells {altera_reserved_tck~input}]  -to  *
set_false_path  -from  *  -to  [get_cells {altera_au*}]
set_false_path  -from  [get_clocks {altera_reserved_tck}]  -to  [get_cells {altera_auto*}]
set_false_path  -from  [get_cells {altera_reserved_tck~input}]  -to  [get_cells {altera_internal_jtag}]
set_false_path  -from  [get_clocks {altera_reserved_tck}]  -to  [get_cells {altera_internal_jtag}]
set_false_path  -from  [get_clocks {altera_reserved_tck}]  -through [get_nets {altera_internal_jtag~TCKUTAP}] -to  [get_cells {altera_internal_jtag}]
set_false_path  -from  [get_ports {ada_or}]  -to  *
set_false_path  -from  [get_cells {altera_reserved_tms~input altera_reserved_tdi~input altera_reserved_ntrst~input altera_reserved_tck~input}]  -to  *


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Load
#**************************************************************

