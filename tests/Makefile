#
# Simple Makefile to run blockA testbench.
#
# Makefile for generating the srm register model
#
all: cpu_reg32.sv cpu_table32.sv sap_blockA.sv
	@echo Done building all the register model

sap_blockA.json: sap_blockA.rb
	../bin/srm_rb -s $< -o $@ -t BlockA

%.json: %.rb
	../bin/srm_rb -s $< -o $@

%.sv: %.json
	../bin/srm_rgen -j $< -o $@

clean: 
	rm -rf  cpu_table32.sv cpu_reg32.json cpu_reg32.sv
