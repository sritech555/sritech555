class mem_controller_driver extends uvm_driver #(mem_controller_transaction);

  virtual bus_if vif;
  mem_controller_config cfg;

  `uvm_component_utils(mem_controller_driver)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    $display("I am in mem_controller_driver ");
    super.build_phase(phase);
    if (!uvm_config_db#(virtual bus_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "Virtual interface must be set for the driver!");
    if (!uvm_config_db#(mem_controller_config)::get(this, "", "cfg", cfg))
      `uvm_fatal("CFGERR", "Configuration not found");
  endfunction

  virtual task run_phase(uvm_phase phase);
    mem_controller_transaction txn;
    forever begin
      seq_item_port.get_next_item(txn);
      drive_transaction(txn);
      seq_item_port.item_done();
    end
  endtask

  virtual task drive_transaction(mem_controller_transaction txn);
     vif.penable      <= 1;
     vif.resume_req_i <= 'b1;
     vif.susp_req_i   <= 'b0;
   // case (txn.transaction_type)
   //  mem_controller_transaction::INIT: begin
   // Initialization: setting up control and status registers
 /*   write_register(cfg.base_addr + 'h0, txn.csr_value);  // CSR at base address + 0
    write_register(cfg.base_addr + 'h4, txn.poc_value);  // POC at base address + 4
    write_register(cfg.base_addr + 'h8, txn.ba_mask_value); // BA_MASK at base address + 8
    write_register(cfg.base_addr + 'h12, txn.csc_value);
    write_register(cfg.base_addr + 'h16, txn.tms_value); */
        
    // end
      
      //mem_controller_transaction::WRITE: begin
        // Write operation
       
        vif.mc_addr_pad_o <= cfg.base_addr + txn.address; // Offset address from base
        vif.mc_data_pad_o <= txn.data;
        vif.mc_we_pad_o_ <= 1'b0; 
        vif.mc_we_pad_o_ <= 1'b1;  
     // end
   // endcase
  endtask

  // Utility method to write to a register
  protected virtual task write_register(input logic [31:0] address, input logic [31:0] data);
    //vif.mc_addr_pad_o <= address;
    vif.paddr <= address;
    vif.mc_data_pad_o <= data;
    vif.mc_we_pad_o_ <= 1'b0; 
    vif.mc_we_pad_o_ <= 1'b1; 
  endtask

endclass : mem_controller_driver
