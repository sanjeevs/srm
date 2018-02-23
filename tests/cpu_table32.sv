`ifndef INCLUDED_top_svh
`define INCLUDED_top_svh

import srm_pkg::*;
import uvm_pkg::*;

//------------------------------------------------------
// Node top 
//------------------------------------------------------
class Top extends srm_node;
 
  //------------------------------------------------------
  // Table t1 
  //------------------------------------------------------
  typedef struct packed {
    reg[15:0] field0;
    reg[31:16] field1;
  } t1_struct_t; 

  // Constraint Class
  class t1_constr extends uvm_object; 
     `uvm_object_utils(t1_constr) 

     rand bit[15:0] field0; 
     rand bit[31:16] field1; 
 
     function new(string name="_constr"); 
       super.new(name); 
     endfunction 

     function t1_struct_t get_data(); 
       t1_struct_t d; 
       d.field0 = field0; 
       d.field1 = field1; 
 
       return d;
     endfunction
  endclass

  class T1 extends srm_table#(t1_struct_t);

    // Entry in the table
    class t1_entry extends srm_table_entry#(t1_struct_t);
      srm_field#(bit[15:0]) field0;
      srm_field#(bit[31:16]) field1;

      function new(string name, srm_node parent, srm_addr_t index=-1);
        super.new(name, parent, index);
        set_reset_kind("hard_reset"); 
        field0 = new(.name("field0"), .parent(this), .n_bits(16), .lsb_pos(0), .volatile(0)); 
        add_field(field0);
        field0.set_reset_value(.kind("hard_reset"), .value(16'hbeef)); 
        field1 = new(.name("field1"), .parent(this), .n_bits(16), .lsb_pos(16), .volatile(0)); 
        add_field(field1);
        field1.set_reset_value(.kind("hard_reset"), .value(16'hdead)); 
      endfunction

      virtual function t1_entry clone(srm_addr_t index);
        t1_entry obj;
        obj = new(.name($psprintf("%s_%0d", get_name(), index)),
                .parent(_parent), .index(index));
        __initialize(obj);
        return obj;
       endfunction
    endclass

    // Create the table t1 
    function new(string name, srm_node parent);
      t1_entry entry;
      super.new(name, parent, .num_entries(1024));
      entry = new(.name("t1_entry"), .parent(this));
      _prototype = entry;
    endfunction

    // Covrariant return type: LRM 2012 Feature
    virtual function t1_entry entry_at(srm_addr_t index);
      t1_entry obj;
      srm_table_entry#(t1_struct_t) entry;
      entry = super.entry_at(index);
      $cast(obj, entry);
      return obj;
    endfunction

  endclass
  // Instantiate the children
  T1  t1;

  function new(string cname, srm_node parent);
    super.new(cname, parent);
    t1 = new(.name("t1"), .parent(this));
    add_child(t1);
    t1.set_offset("default", .offset('h0));
  endfunction

endclass

`endif
