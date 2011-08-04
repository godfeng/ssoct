#!/bin/sh
#
# generated.sh - shell script fragment - not very useful on its own
#
# Machine generated for a CPU named "cpu" as defined in:
# c:\Terasic\DE4_Install\demonstrations\DE4_230\DE4_DDR2\software\DE4_DDR2_syslib\..\..\DE4_SOPC.ptf
#
# Generated: 2011-07-04 17:47:15.008

# DO NOT MODIFY THIS FILE
#
#   Changing this file will have subtle consequences
#   which will almost certainly lead to a nonfunctioning
#   system. If you do modify this file, be aware that your
#   changes will be overwritten and lost when this file
#   is generated again.
#
# DO NOT MODIFY THIS FILE

# This variable indicates where the PTF file for this design is located
ptf=c:\Terasic\DE4_Install\demonstrations\DE4_230\DE4_DDR2\software\DE4_DDR2_syslib\..\..\DE4_SOPC.ptf

# This variable indicates whether there is a CPU debug core
nios2_debug_core=yes

# This variable indicates how to connect to the CPU debug core
nios2_instance=0

# This variable indicates the CPU module name
nios2_cpu_name=cpu

# These variables indicate what the System ID peripheral should hold
sidp=0x40000070
id=651202559u
timestamp=1277427864u

# Include operating system specific parameters, if they are supplied.

if test -f /cygdrive/c/altera/91/nios2eds/components/altera_hal/build/os.sh ; then
   . /cygdrive/c/altera/91/nios2eds/components/altera_hal/build/os.sh
fi