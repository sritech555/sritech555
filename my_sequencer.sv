class my_sequencer extends uvm_sequencer #(mem_controller_transaction);
   `uvm_component_utils(my_sequencer)

   function new(string name = "my_sequencer", uvm_component parent);
      super.new(name, parent);
   endfunction
endclass
