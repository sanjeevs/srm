require 'json'
require 'pp'
require_relative 'utils'
# A node is composite data type. It models register block in RTL.
# Leaf nodes are either Registers or Tables.
# Attributes of a node
# name: Instance name in system verilog
# cname: Class name in system verilog. Default value is instance name with first
#        letter capitalized.
# nodes: Children nodes.
module SRM
class Node 
  attr_accessor :name, :cname, :nodes

  def initialize(name:, cname:nil)
    @name = name
    @cname = cname || @name.camel_case
    @nodes = []
    yield self if block_given?
  end

  # Add children
  def <<(node)
    @nodes << node
  end

  # Dump all the children
  def to_json(options={})
    {
      "type" => "Node",
      "name" => name,
      "cname" => cname,
      "nodes" => @nodes
    }.to_json(options)
  end
end
end
