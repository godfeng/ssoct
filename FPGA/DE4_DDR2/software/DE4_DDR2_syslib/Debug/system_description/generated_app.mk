# generated_app.mk
#
# Machine generated for a CPU named "cpu" as defined in:
# c:\Terasic\DE4_Install\demonstrations\DE4_230\DE4_DDR2\software\DE4_DDR2_syslib\..\..\DE4_SOPC.ptf
#
# Generated: 2011-07-04 17:47:10.115

# DO NOT MODIFY THIS FILE
#
#   Changing this file will have subtle consequences
#   which will almost certainly lead to a nonfunctioning
#   system. If you do modify this file, be aware that your
#   changes will be overwritten and lost when this file
#   is generated again.
#
# DO NOT MODIFY THIS FILE

# assuming the Quartus project directory is the same as the PTF directory
QUARTUS_PROJECT_DIR = C:/Terasic/DE4_Install/demonstrations/DE4_230/DE4_DDR2

# the simulation directory is a subdirectory of the PTF directory
SIMDIR = $(QUARTUS_PROJECT_DIR)/DE4_SOPC_sim

DBL_QUOTE := "



all: delete_placeholder_warning hex sim

verifysysid: dummy_verifysysid_file
.PHONY: verifysysid

delete_placeholder_warning: do_delete_placeholder_warning
.PHONY: delete_placeholder_warning

hex: $(QUARTUS_PROJECT_DIR)/onchip_memory2.hex
.PHONY: hex

sim: $(SIMDIR)/dummy_file
.PHONY: sim

dummy_verifysysid_file:
	nios2-download $(JTAG_CABLE)                                --sidp=0x40000070 --id=651202559 --timestamp=1277427864
.PHONY: dummy_verifysysid_file

do_delete_placeholder_warning:
	rm -f $(SIMDIR)/contents_file_warning.txt
.PHONY: do_delete_placeholder_warning

$(QUARTUS_PROJECT_DIR)/onchip_memory2.hex: $(ELF)
	@echo Post-processing to create $(notdir $@)
	elf2hex $(ELF) 0x41020000 0x4103FFFF --width=32 $(QUARTUS_PROJECT_DIR)/onchip_memory2.hex --create-lanes=0

$(SIMDIR)/dummy_file: $(ELF)
	if [ ! -d $(SIMDIR) ]; then mkdir $(SIMDIR) ; fi
	@echo Hardware simulation is not enabled for the target SOPC Builder system. Skipping creation of hardware simulation model contents and simulation symbol files. \(Note: This does not affect the instruction set simulator.\)
	touch $(SIMDIR)/dummy_file


generated_app_clean:
	$(RM) $(QUARTUS_PROJECT_DIR)/onchip_memory2.hex
	$(RM) $(SIMDIR)/dummy_file
.PHONY: generated_app_clean
