if {[file exist [project env]] > 0} {project close}
if {[file exist "C:/altera/72sp3/kits/stratixIII_3sl150_dev_dsp/examples/stratixIII_3sl150_dev_dsp_example_ChA/nco_1mhz.mpf"] == 0} {
  project new C:/altera/72sp3/kits/stratixIII_3sl150_dev_dsp/examples/stratixIII_3sl150_dev_dsp_example_ChA/ nco_1mhz
} else	{
project open nco_1mhz
}
if {[file exist work] ==0} 	{
  exec vlib work
  exec vmap work work}      
vlog c:/altera/72sp3/quartus//eda/sim_lib/220model.v
vlog c:/altera/72sp3/quartus//eda/sim_lib/altera_mf.v
vlog c:/altera/72sp3/quartus//eda/sim_lib/sgate.v
vlog nco_1mhz.vo
vlog nco_1mhz_tb.v
vsim nco_1mhz_tb
do nco_1mhz_wave.do
run 22000 ns;
