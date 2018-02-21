module test_cpu_table32;
  Top top;
  srm_node children[$];
  srm_table table;
  int err_cnt;
  Top::t1_constr constr;
  Top::t1_struct_t wr_data, rd_data;

  initial begin
    err_cnt = 0;
    top = new("top", null);
    top.get_children(children);

    if(top.num_children() != 1) begin
      $display("ERROR: Number of children must be 1");
      err_cnt += 1;
    end

    if($cast(table, children[0])) begin
      $display("ERROR: Child must be a tree");
      err_cnt += 1;
    end

    if(err_cnt == 0) begin
      $display("PASS: Test test_cpu_table32 PASSED");
    end

    // Write random value and read back.
    constr = Top::t1_constr::type_id::create("constr");
    assert(constr.randomize());
    wr_data = constr.get_data();
    top.t1.entry_at(100).set(wr_data);
    $display("Wrote random value 0x%0x to entry 100", top.t1.entry_at(100).get());

    // Write junk value at another location.
    top.t1.entry_at(101).set(constr.get_data());

    // Read back the original data.
    rd_data = top.t1.entry_at(100).get();
    if(rd_data != wr_data) begin
      $display("ERROR: Mismatch on read data. Got=0x%0x, Exp=0x%0x", rd_data, wr_data);
    end
    else begin
      if(top.t1.entry_at(100).field0.get() != rd_data[15:0]) begin
        $display("ERROR: Mismatch on read field0. Got=0x%0x, Exp=0x%0x", 
                                      top.t1.entry_at(100).field0.get(), rd_data[15:0]);
      end
      if(top.t1.entry_at(100).field1.get() != rd_data[31:16]) begin
        $display("ERROR: Mismatch on read field0. Got=0x%0x, Exp=0x%0x", 
                                      top.t1.entry_at(100).field1.get(), rd_data[31:16]);
      end
      $display("PASS:Read random value 0x%0x to entry 100.Field0=0x%0x,Field1=0x%0x", 
        rd_data, top.t1.entry_at(100).field0.get(), top.t1.entry_at(100).field1.get());
    end

  end

endmodule
