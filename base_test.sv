class base_test extends uvm_test;
  `uvm_component_utils(base_test)

  // my_env         m_env;
  // reset_seq      m_reset_seq;
   mem_controller_env              mc_env;         
   mem_controller_write_sequence   mc_wr_seq;
   uvm_status_e                    status;
   mem_controller_config           cfg;
   //my_env                          m_env;
  

   function new (string name, uvm_component parent);
      super.new (name, parent);
   endfunction

   // Build the testbench environment, and reset sequence
   virtual function void build_phase (uvm_phase phase);
      super.build_phase (phase);
    //  m_env = my_env::type_id::create ("m_env", this);
     //m_env = my_env::type_id::create ("m_env", this);
     mc_env = mem_controller_env::type_id::create ("mc_env", this);
     mc_wr_seq = mem_controller_write_sequence::type_id::create("mc_wr_seq", this);
     cfg = mem_controller_config::type_id::create("cfg");
     uvm_config_db#(mem_controller_config)::set(this, "*", "cfg", cfg);
    //  m_reset_seq = reset_seq::type_id::create ("m_reset_seq", this);
   endfunction

   // In the reset phase, apply reset
/*   virtual task reset_phase (uvm_phase phase);
      super.reset_phase (phase);
      phase.raise_objection (this);
      m_reset_seq.start (m_env.m_agent.m_seqr);
      phase.drop_objection (this);
   endtask */
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    mc_wr_seq.start(mc_env.mc_agent.mc_seqr);
    phase.drop_objection(this);
  endtask

endclass
