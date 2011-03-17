if {[file exist [project env]] > 0} {project close}
if {[file exist "C:/altera/72sp3/kits/stratixIII_3sl150_dev_dsp/examples/stratixIII_3sl150_dev_dsp_example_ChA/nc0_10mhz.mpf"] == 0} {
  project new C:/altera/72sp3/kits/stratixIII_3sl150_dev_dsp/examples/stratixIII_3sl150_dev_dsp_example_ChA/ nc0_10mhz
} else	{
project open nc0_10mhz
}
if {[file exist work] ==0} 	{
  exec vlib work
  exec vmap work work}      
vlog c:/altera/72sp3/quartus//eda/sim_lib/220model.v
vlog c:/altera/72sp3/quartus//eda/sim_lib/altera_mf.v
vlog c:/altera/72sp3/quartus//eda/sim_lib/sgate.v
vlog nc0_10mhz.vo
vlog nc0_10mhz_tb.v
vsim nc0_10mhz_tb
do nc0_10mhz_wave.do
run 22000 ns;
