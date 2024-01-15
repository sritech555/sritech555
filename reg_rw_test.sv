class reg_rw_test extends base_test;
   `uvm_component_utils(reg_rw_test)
  
      mem_ctrl_reg_block   m_ral_model;
      uvm_status_e      status;
      int               rdata;
     // my_env            m_env;
  
  function new (string name, uvm_component parent);
      super.new (name, parent);
   endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
   // m_env=my_env::type_id::create("m_env", this);    
  endfunction

   virtual task main_phase(uvm_phase phase);
     

      phase.raise_objection(this);

  //    m_env.m_reg_env.set_report_verbosity_level (UVM_HIGH);

      // Get register model from config_db
      uvm_config_db#(mem_ctrl_reg_block)::get(null, "uvm_test_top", "m_ral_model", m_ral_model);
     
      // Set 0xface as the desired value for timer[1] register
      m_ral_model.csr.set(32'hface);
     // m_ral_model.csr.set(32'hcafe_feed);
     `uvm_info(get_type_name(), $sformatf("desired=0x%0h mirrored=0x%0h", m_ral_model.csr.get(), m_ral_model.csr.get_mirrored_value()), UVM_MEDIUM)

      // Write 0xcafe_feed to the timer[1] register, and read it back
      m_ral_model.csr.write (status, 32'hcafe_feed);
      m_ral_model.csr.read (status, rdata);


      // Predict that current value of timer[1] is 0xcafe_feed and check it is true
      m_ral_model.csr.predict(32'h0);
      m_ral_model.csr.mirror(status, UVM_CHECK);

      // Set desired value of the field "bl_yellow" in register ctrl to 1
      // Then start bus transactions by calling "update" to update DUT with
      // desired value
//      m_ral_model.cfg.ctrl.bl_yellow.set(1);
//      m_ral_model.cfg.update(status);

	  // Attempt to write into a RO register "stat" with some value
//      m_ral_model.cfg.stat.write(status, 32'h12345678);
      phase.drop_objection(this);
   endtask

  // Before end of simulation, allow some time for unfinished transactions to
  // be over
  virtual task shutdown_phase(uvm_phase phase);
    super.shutdown_phase(phase);
    phase.raise_objection(this);
    #100ns;
    phase.drop_objection(this);
  endtask
endclass