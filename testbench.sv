import uvm_pkg::*;
`include "uvm_macros.svh"

`include "bus_intf.sv"
//`include "bus_pkt.sv"
`include "mem_controller_transaction.sv"
//`include "mem_controller_write_sequence.sv"
//`include "reset_seq.sv"
`include "mem_controller_config.sv"
`include "my_sequencer.sv"
`include "mem_controller_sequencer.sv"
`include "my_driver.sv"
`include "mem_controller_driver.sv"
`include "my_monitor.sv"
`include "mem_controller_monitor.sv"
`include "my_agent.sv"
`include "mem_controller_agent.sv"
`include "reg2apb_adapter.sv"
`include "reg.sv"
`include "reg_env.sv"
`include "my_env.sv"
`include "mem_controller_env.sv"
`include "mem_controller_write_sequence.sv"
`include "base_test.sv"
`include "reg_rw_test.sv"
`include "mc_base_test.sv"


//------------------------------------------------------------

module tbench_top;

  //---------------------------------------
  //clock and reset signal declaration
  //---------------------------------------
  bit clk;
  bit reset;
  
  //---------------------------------------
  //clock generation
  //---------------------------------------
  initial begin
  	forever #5 clk = ~clk;
  end
  
  //---------------------------------------
  //reset Generation
  //---------------------------------------
  initial begin
    reset = 1;
    #15 reset =0;
  end  
  
  //---------------------------------------
  //interface instance
  //---------------------------------------
  bus_if intf(.pclk(clk), .presetn(reset));
  virtual bus_if vif = intf;
  
  //---------------------------------------
  //DUT instance
  //---------------------------------------

    mc_top mc_dut (
    .pclk(intf.pclk),
    .presetn(intf.presetn),
    .psel(intf.psel),
    .penable(intf.penable),
    .pwrite(intf.pwrite),
    .paddr(intf.paddr),
    .pwdata(intf.pwdata),
    .prdata(intf.prdata),
    .pready(intf.pready),
    .susp_req_i(intf.susp_req_i),
    .resume_req_i(intf.resume_req_i),
    .suspended_o(intf.suspended_o),
    .poc_o(intf.poc_o),
      .mc_clk_i(intf.pclk),
    .mc_br_pad_i(intf.mc_br_pad_i),
    .mc_bg_pad_o(intf.mc_bg_pad_o),
    .mc_ack_pad_i(intf.mc_ack_pad_i),
    .mc_addr_pad_o(intf.mc_addr_pad_o),
    .mc_data_pad_i(intf.mc_data_pad_i),
    .mc_data_pad_o(intf.mc_data_pad_o),
    .mc_dp_pad_i(intf.mc_dp_pad_i),
    .mc_dp_pad_o(intf.mc_dp_pad_o),
    .mc_doe_pad_doe_o(intf.mc_doe_pad_doe_o),
    .mc_dqm_pad_o(intf.mc_dqm_pad_o),
    .mc_oe_pad_o_(intf.mc_oe_pad_o_),
    .mc_we_pad_o_(intf.mc_we_pad_o_),
    .mc_cas_pad_o_(intf.mc_cas_pad_o_),
    .mc_ras_pad_o_(intf.mc_ras_pad_o_),
    .mc_cke_pad_o_(intf.mc_cke_pad_o_),
    .mc_cs_pad_o_(intf.mc_cs_pad_o_),
    .mc_sts_pad_i(intf.mc_sts_pad_i),
    .mc_rp_pad_o_(intf.mc_rp_pad_o_),
    .mc_vpen_pad_o(intf.mc_vpen_pad_o),
    .mc_adsc_pad_o_(intf.mc_adsc_pad_o_),
    .mc_adv_pad_o_(intf.mc_adv_pad_o_),
    .mc_zz_pad_o(intf.mc_zz_pad_o),
    .mc_coe_pad_coe_o(intf.mc_coe_pad_coe_o)
  );
  

  
  //---------------------------------------
  //passing the interface handle to lower heirarchy using set method 
  //and enabling the wave dump
  //---------------------------------------
  initial begin 
    uvm_config_db#(virtual bus_if)::set(null,"*","vif",vif);
    //enable wave dump
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
  
   initial begin
    #1000;
    $finish;
  end
  
  
  //---------------------------------------
  //calling test
  //---------------------------------------
  initial begin 
    run_test("mc_base_test");
    //run_test("reg_rw_test");
  end
  
endmodule
