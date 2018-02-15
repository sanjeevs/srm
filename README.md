This is a Ruby gem that is used for generating system verilog "simple_register_model" files.

Requires Ruby 2.0+ since it uses keyword arguments.

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
