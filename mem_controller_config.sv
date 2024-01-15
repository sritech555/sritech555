class mem_controller_config extends uvm_object;
  `uvm_object_utils(mem_controller_config)

  typedef logic [31:0] addr_t;
  addr_t base_addr;

  function new(string name = "mem_controller_config");
    super.new(name);
    base_addr = 32'h5000_0000;
  endfunction
endclass