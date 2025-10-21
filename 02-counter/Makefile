.PHONY: all program clean
all: gray_counter.bit
REPORTS = post_synth_power.rpt post_synth.dcp post_synth_clock_interaction.rpt post_synth_high_fanout_nets.rpt
NETLISTS = impl_netlist.v impl_netlist.edif
BITFILES = gray_counter.bin gray_counter.bit

$(REPORTS) $(NETLISTS) $(BITFILES): gray_counter.v synth.tcl design.xdc
	vivado -mode batch -source synth.tcl

program:
	vivado -mode batch -source prog.tcl

clean:
	rm -f $(REPORTS) $(NETLISTS) $(BITFILES)
	rm -f vivado*.jou vivado*.log
	rm -f clockInfo.txt
