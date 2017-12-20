require 'srm'
require "sap1_blockX"

# Test whether hier chip.a.b.t1, chip.a.b.r1 works.
# ../bin/srm_spec -s test_hier.rb -t Chip
class Chip < SRM::RegBlock
  def initialize(name:)
    super
    self << A.new(name: "a")
  end
end

class A < SRM::RegBlock
  def initialize(name:)
    super
    self << B.new(name: 'b')
  end
end

class B < SRM::RegBlock
  def initialize(name:)
    super
    self << BlockX.new(name: 'blockX')
  end
end

