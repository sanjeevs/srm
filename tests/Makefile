all: sap1_srm_model.svh
	@echo Done generating srm register model

SRM_SPEC=../bin/srm_spec
SRM_RGEN=../bin/srm_rgen

sap1_srm_model.svh: sap1_srm_model.json
	$(SRM_RGEN) -j $< -o $@

sap1_srm_model.json: sap1_top.rb
	$(SRM_SPEC) -s $< -t Sap1 -o $@

clean:
	rm -rf sap1_srm_model.json sap1_srm_model.svh
