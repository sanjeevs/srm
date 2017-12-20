all: srm_sap1.sv
	@echo Done generating srm register model

SRM_SPEC=../bin/srm_spec
SRM_RGEN=../bin/srm_rgen

srm_sap1.sv: srm_sap1.json
	$(SRM_RGEN) -j $< -o $@

srm_sap1.json: sap1_top.rb
	$(SRM_SPEC) -s $< -t Sap1 > $@

clean:
	rm -rf srm_sap1.json srm_sap1.sv
