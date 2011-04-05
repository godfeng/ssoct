#set workdir to the path setting where design files are installed
set workdir [pwd]
#set megacore_lib_dir to the path setting where the FFT IP is installed
set megacore_lib_dir {c:/software/altera/megacore/fft-v2.1.3/lib}

#set quartusdir to the path setting where Quartus II is installed
global env
if ![info exists env(QUARTUS_ROOTDIR)] {
	puts "Expected Enviroment variable QUARTUS_ROOTDIR pointing to a valid Quartus installation"
	exit
}
set quartusdir [file join $env(QUARTUS_ROOTDIR) eda sim_lib]


# Create ModelSim project 
if {[file exist [project env]] > 0} {project close}
cd $workdir
if {[file exist "$workdir/fft_32K.mpf"] == 0} {
	project new $workdir fft_32K 
} else	{
	project open fft_32K
}

# Create work lib
if {[file exist work] ==0} 	{
  exec vlib work
  exec vmap work work}  
      
vlog "$quartusdir/220model.v"
vlog "$quartusdir/altera_mf.v"
vlog "$quartusdir/sgate.v"
vlog "$workdir/fft_small.vo"
vlog "$workdir/clk_pll.v"
vlog "$workdir/mult_add.v"
vlog "$workdir/mram_buf.v"
vlog "$workdir/twiddle_rom_add.v"
vlog "$workdir/mul_fft_bot_tf.v"
vlog "$workdir/scale_fft_res.v"
vlog "$workdir/comb_final_fft_res.v"
vlog "$workdir/parse_fft_input.v"
vlog "$workdir/combine_fft.v"
vlog "$workdir/fft_32K.v"
vlog "$workdir/fft_32K_streaming_tb.v"
vsim fft_32K_tb -pli "$env(QUARTUS_ROOTDIR)/eda/mentor/modelsim/convert_hex2ver.dll"
do fft_32K_wave.do
run 1.5 ms;
