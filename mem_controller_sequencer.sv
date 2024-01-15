class mem_controller_sequencer extends uvm_sequencer #(mem_controller_transaction);

  `uvm_component_utils(mem_controller_sequencer)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

endclass
