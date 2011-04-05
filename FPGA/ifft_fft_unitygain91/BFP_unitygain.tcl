  
if {[file exist [project env]] > 0} {project close}
if {[file exist "BFP_unitygain.mpf"] == 0} {
	project new . BFP_unitygain BFP_unitygain
} else {
project open BFP_unitygain
}
if {[file exist work] ==0} 	{
  exec vlib work
  exec vmap work work
}

vlog c:/altera/91/quartus//eda/sim_lib/220model.v
vlog c:/altera/91/quartus//eda/sim_lib/altera_mf.v
vlog c:/altera/91/quartus//eda/sim_lib/sgate.v
vlog fft91.vo
vlog Scaler.v
vlog BFP_unitygain.v
vlog BFP_unitygain_tb.v
vsim BFP_unitygain_tb
do wave.do
run 20000 ns;
