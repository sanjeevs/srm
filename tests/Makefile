#
# Simple Makefile to run blockA testbench.
#
ifndef UVM_HOME
  $(error UVM_HOME is undefied. Point it to install dir for uvm package)
endif

ifndef SRM_HOME
  $(error SRM_HOME is undefied. Point it to install dir for simple_reg_model)
endif

VCS = vcs -sverilog -timescale=1ns/1ns +acc +vpi -debug_all\
      +define+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
      +incdir+$(UVM_HOME)/src $(UVM_HOME)/src/uvm.sv  \
      +incdir+$(SRM_HOME)/src $(SRM_HOME)/src/srm.sv \
      $(UVM_HOME)/src/dpi/uvm_dpi.cc -CFLAGS -DVCS

SIMV = simv -l test.log


cpu_table32: cpu_table32.sv
	$(VCS) $(INCDIR) $< test_cpu_table32.sv 

cpu_table32.json: cpu_table32.rb
	../bin/srm_spec -s $< -o $@

cpu_table32.sv: cpu_table32.json
	../bin/srm_rgen -j $< -o $@

vcs_clean:
	rm -rf csrc simv simv.daidir vc_hdrs.h DVEfiles *.log *.key *.vpd 

clean: vcs_clean
	rm -rf cpu_table32.json cpu_table32.sv
