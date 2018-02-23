This is a Ruby gem that is used for generating [simple_register_model](https://github.com/Juniper/simple_reg_mode) files.

Requires Ruby 2.0+ since it uses keyword arguments.

## Overview
The gem provides a script **srm_rgen** takes a [JSON](https://www.json.org/) format of the attirbutes of the register model. It then uses the ruby template engine "erb" to generate the simple_reg_model register description. By using a standard JSON file as the input, it allows easier integration with other register description languages like [SystemRDL](https://github.com/Juniper/open-register-design-tool) or other register generation tools.  

The gem also provides [Ruby](https://www.ruby-lang.org/en/) library for creating the JSON format. Similar bindings for other OOP languages like [Python](https://www.python.org/) can be created. [TBD]. The script **srm_rb** will evaluate the register description in ruby and generate the JSON file. This file can then be fed to **srm_rgen** to create the srm register model. 

## Run Sample Test 
Clone this git repo and navigate to the tests directory.  

### Step 1: Ruby To JSON
The tests directory contains "cpu_reg32.rb" that describes a single 32b register, having 2 16b fields "field0" and "field1".
```
tests> ../bin/srm_rb -s cpu_reg32.rb
Creating "srm_regmodel.json" output file for register block "top"
```
The output JSON file is created as "srm_regmodel.json" by default.

### Step2: JSON To SRM
The JSON file output can now be used to generate the SRM description.
```
tests>../bin/srm_spec -j srm_regmode.json 
Creating "srm_regmodel.sv" output file for register block
```

1. JSON Format  
This describes all the fields required by the tool generation.
## Scripts
There are 2 utilitiles. 
1. **srm_spec** 
Generates json from a ruby specification file.  

2. **srm_rgen**
This generates the system verilog register model from the json specification.  

## Generating Register Model

Generate Json format.
```
cd tests
make
```
