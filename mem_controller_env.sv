class mem_controller_env extends uvm_env;
  `uvm_component_utils (mem_controller_env)

   mem_controller_agent       mc_agent;
   my_agent                   m_agent;
   my_env                     m_env;  //ral env

   function new (string name, uvm_component parent);
   	super.new (name, parent);
   endfunction

   virtual function void build_phase (uvm_phase phase);
     $display("I am in mem_controller_env");
   	super.build_phase (phase);
    mc_agent = mem_controller_agent::type_id::create ("mc_agent", this);
    m_agent = my_agent::type_id::create("m_agent", this);
    //m_reg_env = reg_env::type_id::create("m_reg_env", this);
    m_env = my_env::type_id::create("m_env", this);
   endfunction

   virtual function void connect_phase (uvm_phase phase);
      super.connect_phase (phase);
     m_agent.m_mon.mon_ap.connect (m_env.m_reg_env.m_apb2reg_predictor.bus_in);
   endfunction

endclass