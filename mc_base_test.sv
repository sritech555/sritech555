class mc_base_test extends uvm_test;
  `uvm_component_utils(mc_base_test)
         
   mem_ctrl_reg_block              m_ral_model;
   int                             rdata;
   mem_controller_write_sequence   mc_wr_seq;
   uvm_status_e                    status;
   mem_controller_config           cfg;
   mem_controller_env              mc_env; 
 

   function new (string name, uvm_component parent);
      super.new (name, parent);
   endfunction

   virtual function void build_phase (uvm_phase phase);
      super.build_phase (phase);
      	mc_env = mem_controller_env::type_id::create ("mc_env", this);
     	uvm_config_db#(mem_ctrl_reg_block)::get(null, "uvm_test_top", "m_ral_model", m_ral_model);
     	mc_wr_seq = mem_controller_write_sequence::type_id::create("mc_wr_seq", this);
     	cfg = mem_controller_config::type_id::create("cfg");
     	uvm_config_db#(mem_controller_config)::set(this, "*", "cfg", cfg);
   endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    $display("I am in MC_BASE_TEST");
    mc_wr_seq.start(mc_env.mc_agent.mc_seqr);
   // mc_wr_seq.start(mc_env.m_agent.m_seqr);
    phase.drop_objection(this);
  endtask

endclass