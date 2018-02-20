require 'minitest/autorun'
require 'ostruct'
require_relative "../lib/srm/node"
require_relative "../lib/srm/register"


class TestMultiMap< MiniTest::Test
include SRM

  def setup
    @reg_block = Node.new(name: 'cpu_registers') do |block|
      block << Register.new(name: "r1").offset("cpu_map" => [0x100, 0x32], 
                                           "gpu_map" => [0x200, 0x16])
    end
  end

  def test_name
    assert_equal("cpu_registers", @reg_block.name)
  end

  def test_json
    json_string = @reg_block.to_json
    h = JSON.parse(json_string, object_class: OpenStruct)
    assert_equal "Node", h.type
    assert_equal "cpu_registers", h.name
    assert_equal "r1", h.nodes[0].name
    assert_equal [], h.nodes[0].fields
    assert_equal [0x100, 0x32], h.nodes[0].offsets["cpu_map"]
    assert_equal [0x200, 0x16], h.nodes[0].offsets["gpu_map"]
  end

end

