require_relative "table"

module SRM
# A register is an array of fields. It is modelled as a register array of 1 entry. 
class Register < Table 
  def initialize(name:, fields: [], reset_kinds: [])
    super(name: name, fields: fields, reset_kinds: reset_kinds, num_entries: 1)
    @type = "Register"
  end

end
end
