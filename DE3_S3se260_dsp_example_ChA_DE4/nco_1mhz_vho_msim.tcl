if {[file exist [project env]] > 0} {project close}
if {[file exist "C:/altera/72sp3/kits/stratixIII_3sl150_dev_dsp/examples/stratixIII_3sl150_dev_dsp_example_ChA/nco_1mhz.mpf"] == 0} {
  project new C:/altera/72sp3/kits/stratixIII_3sl150_dev_dsp/examples/stratixIII_3sl150_dev_dsp_example_ChA/ nco_1mhz
} else	{
project open nco_1mhz
}
# Create default work directory if not present
if {[file exist work] ==0} 	{
  exec vlib work
  exec vmap work work}      
# Map lpm library
if {[file exist lpm] ==0} 	{
  exec vlib lpm
  exec vmap lpm lpm}      
vcom -93 -work lpm c:/altera/72sp3/quartus//eda/sim_lib/220pack.vhd 
vcom -93 -work lpm c:/altera/72sp3/quartus//eda/sim_lib/220model.vhd 
# Map altera_mf library
if {[file exist altera_mf] ==0} 	{
  exec vlib altera_mf
  exec vmap altera_mf altera_mf}      
vcom -93 -work altera_mf c:/altera/72sp3/quartus//eda/sim_lib/altera_mf_components.vhd 
vcom -93 -work altera_mf c:/altera/72sp3/quartus//eda/sim_lib/altera_mf.vhd 
# Map sgate library
if {[file exist sgate] ==0} 	{
  exec vlib sgate
  exec vmap sgate sgate}      
vcom -93 -work sgate c:/altera/72sp3/quartus//eda/sim_lib/sgate_pack.vhd 
vcom -93 -work sgate c:/altera/72sp3/quartus//eda/sim_lib/sgate.vhd 
vcom -93 nco_1mhz.vho
vcom -93 nco_1mhz_tb.vhd
vsim nco_1mhz_tb
do nco_1mhz_wave.do
run 22000 ns;
