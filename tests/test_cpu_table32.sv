module test_cpu_table32;
  Top top;
  srm_node children[$];
  srm_table table;
  int err_cnt;

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

  end

endmodule
