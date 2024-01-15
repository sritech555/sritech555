class mem_controller_monitor extends uvm_monitor;

  virtual bus_if vif;

  uvm_analysis_port #(mem_controller_transaction) analysis_port;

  `uvm_component_utils(mem_controller_monitor)
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
    analysis_port = new("analysis_port", this);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual bus_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "Virtual interface must be set for the monitor!");
  endfunction
    
   virtual task run_phase(uvm_phase phase);
    mem_controller_transaction txn;
    phase.raise_objection(this);

    forever begin
        @(posedge vif.mc_clk_i);

      if (vif.mc_we_pad_o_ == 1'b0) begin
            txn = mem_controller_transaction::type_id::create("txn");
            txn.address = vif.mc_addr_pad_o;
            txn.data = vif.mc_data_pad_o;
            txn.transaction_type = mem_controller_transaction::WRITE;
            analysis_port.write(txn);
      end
    end

    phase.drop_objection(this);
endtask

endclass