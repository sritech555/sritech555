class my_monitor extends uvm_monitor;
   `uvm_component_utils (my_monitor)
   function new (string name="my_monitor", uvm_component parent);
      super.new (name, parent);
   endfunction

   uvm_analysis_port #(mem_controller_transaction)  mon_ap;
   virtual bus_if                vif;

   virtual function void build_phase (uvm_phase phase);
      super.build_phase (phase);
      mon_ap = new ("mon_ap", this);
     uvm_config_db #(virtual bus_if)::get (null, "uvm_test_top.*", "vif", vif);
   endfunction

   virtual task run_phase (uvm_phase phase);
      fork
         forever begin
            @(posedge vif.pclk);
            if (vif.psel & vif.penable & vif.presetn) begin
               mem_controller_transaction pkt = mem_controller_transaction::type_id::create ("pkt");
               pkt.address = vif.paddr;
               if (vif.pwrite)
                  pkt.data = vif.pwdata;
               else
                  pkt.data = vif.prdata;
               pkt.write = vif.pwrite;
               mon_ap.write (pkt);
            end
         end
      join_none
   endtask
endclass
