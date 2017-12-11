# Top level address map of srm
require 'srm'
require "sap1_blockX"

class Sap1 < SRM::RegBlock
  def initialize(name:)
    super
    #FIXME: How to initialize the offset 0xa000_0000
    self << BlockX.new(name: "blockX")
  end
end

