require 'minitest/autorun'
require_relative "../lib/srm/node"
require_relative "../lib/srm/register"

class TestNodeJson < MiniTest::Test
  include SRM
  def setup
    @user_spec = %Q(
Node.new(name: "cpu_reg32") do |model|
  model << SRM::Register.new(name: "r1_reg") do |r|
                  r << SRM::Field.new(name: "field", nbits: 32, lsb_pos: 0, volatile: false, 
                                 hard: 0xdeadbeef, mbist: 0x0)
            end.offset(cpu_map: [0x100, 0x32], gpu_map: [0x200, 0x16])
end
)
    @r1 = eval(@user_spec)
  end

  def test_eval
    assert_equal "cpu_reg32", @r1.name
    assert_equal "CpuReg32", @r1.cname
    assert_equal "r1_reg", @r1.nodes[0].name
    assert_equal SRM::Node, @r1.class
    assert_equal SRM::Register, @r1.nodes[0].class

    assert_equal "field", @r1.nodes[0].fields[0].name
    assert_equal 32, @r1.nodes[0].fields[0].nbits
    assert_equal [0x100, 50], @r1.nodes[0].offsets[:cpu_map]
  end

  def test_json
    json_string = @r1.to_json
    h = JSON.parse(json_string, object_class: OpenStruct)
    assert_equal "cpu_reg32", h.name
    assert_equal "CpuReg32", h.cname
  end
end

