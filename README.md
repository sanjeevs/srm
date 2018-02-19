This is a Ruby gem that is used for generating system verilog "simple_register_model" files.

Requires Ruby 2.0+ since it uses keyword arguments.

## Overview
The gem provides a script **srm_spec** takes a JSON format of the attirbutes of the register model and generates the system verilog register package. 
```
```

External register generation tool should generate this compatible JSON file and use this gem to convert to system verilog. An example is a DSL based on ruby that generates the JSON. This is then converted to system verilog by "srm_spec". 

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
