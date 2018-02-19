# Create a 32 bit table of 1024 entries in cpu map at offset 0x100.
require 'srm'

SRM::RegBlock.new(name: "top") do |block|
  block << SRM::Table.new(name: "t1", num_entries: 1024, reset_kinds: [:hard_reset]) do |reg|
    reg << SRM::Field.new(name: "field0", nbits: 16, lsb_pos:0, hard_reset: 0xbeef)
    reg << SRM::Field.new(name: "field1", nbits: 16, lsb_pos:16, hard_reset: 0xdead)
  end.offset(cpu_map: 0x100)
end


