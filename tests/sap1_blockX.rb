# Address map for block X
require 'srm'

class BlockX < SRM::RegBlock
  def initialize(name:)
    super
    self << SRM::Table.new(name: "t1", reset_kinds: [:hard_reset], num_entries: 1024) do |t|
      t << SRM::Field.new(name: 'field0', nbits: 32, lsb_pos: 0, hard_reset: 0x0)
    end.offset(sw_map: 0x0)

    self << SRM::Register.new(name: "r1", reset_kinds: [:hard_reset]) do |r|
      r << SRM::Field.new(name: 'field0', nbits: 32, lsb_pos: 0, hard_reset: 0x0);
    end.offset(sw_map: 0x1000)
  end
end
