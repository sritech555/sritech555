class mem_controller_agent extends uvm_agent;
  `uvm_component_utils (mem_controller_agent)
   
  function new (string name, uvm_component parent);
      super.new (name, parent);
   endfunction

   mem_controller_driver                  mc_drvr;
   mem_controller_monitor                 mc_mon;
   mem_controller_sequencer               mc_seqr;
   mem_controller_config                  cfg; 
  virtual bus_if                          vif;        

   virtual function void build_phase (uvm_phase phase);
     $display("I am in mem_controller_agent");
     super.build_phase (phase);
     mc_drvr = mem_controller_driver::type_id::create ("mc_drvr", this);
     mc_seqr = mem_controller_sequencer::type_id::create ("mc_seqr", this);
     mc_mon  = mem_controller_monitor::type_id::create ("mc_mon", this);
       
     if (!uvm_config_db#(mem_controller_config)::get(this, "", "cfg", cfg))
      `uvm_fatal("CFGERR", "Configuration not found");
     if (!uvm_config_db#(virtual bus_if)::get(this, "", "vif", vif))
      `uvm_fatal("VIFERR", "Virtual interface not found");

   endfunction

   virtual function void connect_phase (uvm_phase phase);
      super.connect_phase (phase);
     mc_drvr.seq_item_port.connect (mc_seqr.seq_item_export);
   endfunction
endclass