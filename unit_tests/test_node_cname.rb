# Test that the node can be given an arbitary class name attribute
require 'minitest/autorun'
require_relative "../lib/srm/node"
require_relative "../lib/srm/register"

class TestNodeCname < MiniTest::Test
  include SRM

  def test_inst_imp_cname
    spec = %Q(
Node.new(name: "cpu_reg32")
)
    r1 = eval(spec)
    assert_equal "cpu_reg32", r1.name
    assert_equal "CpuReg32", r1.cname
  end

  def test_inst_exp_cname
    spec = %Q(
Node.new(name: "cpu_reg32", cname: "a::b::c") 
)
    r1 = eval(spec)
    assert_equal "cpu_reg32", r1.name
    assert_equal "a::b::c", r1.cname
  end

  def test_explicit_cname
  spec = %Q(
class MyNode < SRM::Node
end
)
    r1 = eval(spec)
    # For class definition Ruby returns nil value.
    assert_nil r1

    # Say user passed the top level of the class.
    top = "MyNode" 
    # FIXME: Unable to find the class by name, though works in the script.
    #klass = Kernel.const_get("MyNode") 
    #n = klass.new(name:top.snake_case, cname: top) 
    n = MyNode.new(name: top.snake_case, cname: top)
    assert_equal n.name, "my_node"
    assert_equal n.cname, "MyNode"
  end


end

