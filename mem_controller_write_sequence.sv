//`include "base_test.sv"
class mem_controller_write_sequence extends uvm_sequence #(mem_controller_transaction);

  `uvm_object_utils(mem_controller_write_sequence)
  
      mem_ctrl_reg_block   m_ral_model;
      uvm_status_e         status;
      int                  rdata;

  function new(string name = "mem_controller_write_sequence");
    super.new(name);
  endfunction

  virtual task body();
    mem_controller_transaction txn;
    uvm_config_db#(mem_ctrl_reg_block)::get(null, "uvm_test_top", "m_ral_model", m_ral_model);
  
    // Initialization transaction
    txn = mem_controller_transaction::type_id::create("txn");
   // txn.transaction_type = mem_controller_transaction::INIT;

    //m_ral_model.csr = 32'hFF00_0702; 
    m_ral_model.csr.write (status, 32'hFF00_0702); //csr
    m_ral_model.csr.read (status, rdata);
    m_ral_model.poc.read (status, rdata); //poc
    m_ral_model.ba_mask.write (status, 32'h80 ); //ba_mask
    m_ral_model.ba_mask.read (status, rdata );
    m_ral_model.csc0.write (status, 32'hFF0_C21 ); //csc0
    m_ral_model.csc0.read (status, rdata);
    m_ral_model.tms0.write (status,32'hFFF_8220 ); //tms0
    m_ral_model.tms0.read (status, rdata);
   
    //`uvm_info("WRITE", $sformatf("WRITE::Writing to csr: 0x%0h", 32'hCAFE_FEED), UVM_MEDIUM)
    //txn.poc_value = ; //RO 
 //   txn.ba_mask_value = 32'hFF; 

    // Initialize CSCn and TMSn registers
  //    txn.csc_value = 32'hFF0_C21;
  //    txn.tms_value = 32'hFFF_8220; 

    start_item(txn);
    assert(txn.randomize()) else `uvm_error("RAND_FAIL", "Randomization failed")
    finish_item(txn);
    `uvm_info("TXN_DETAIL", txn.convert2string(), UVM_MEDIUM)

    // Write transaction
    txn = mem_controller_transaction::type_id::create("txn");
    txn.transaction_type = mem_controller_transaction::WRITE;
    txn.address = 32'h5000_0000;  
    txn.data = 32'hABCD_EFAA;        

    start_item(txn);
    assert(txn.randomize()) else `uvm_error("RAND_FAIL", "Randomization failed")
    finish_item(txn);
    `uvm_info("TXN_DETAIL", txn.convert2string(), UVM_MEDIUM)
  endtask

endclass