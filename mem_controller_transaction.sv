
class mem_controller_transaction extends uvm_sequence_item;

  typedef enum {WRITE, INIT, POWER_DOWN, BUS_ARBITRATION} transaction_type_t;

  transaction_type_t transaction_type;
  logic [31:0] address;       
  logic [31:0] data;    
  rand bit     write;

  logic [31:0] csr_value;     
  logic [31:0] poc_value;     
  logic [31:0] ba_mask_value; 
  logic [31:0] csc_value;  
  logic [31:0] tms_value;  
  
  logic request_bus;         
  logic enter_power_down;    
  logic exit_power_down;     

  function new(string name = "mem_controller_transaction");
    super.new(name);
  endfunction

  `uvm_object_utils_begin(mem_controller_transaction)
    `uvm_field_enum(transaction_type_t, transaction_type, UVM_ALL_ON)
    `uvm_field_int(address, UVM_ALL_ON)
    `uvm_field_int(data, UVM_ALL_ON)
    `uvm_field_int(csr_value, UVM_ALL_ON)
    `uvm_field_int(poc_value, UVM_ALL_ON)
    `uvm_field_int(ba_mask_value, UVM_ALL_ON)
    `uvm_field_int(csc_value, UVM_ALL_ON)
    `uvm_field_int(tms_value, UVM_ALL_ON)
    `uvm_field_int(request_bus, UVM_ALL_ON)
    `uvm_field_int(enter_power_down, UVM_ALL_ON)
    `uvm_field_int(exit_power_down, UVM_ALL_ON) 
  `uvm_field_int(write, UVM_ALL_ON) 
  `uvm_object_utils_end

  virtual function string convert2string();
    string s;
    s = $sformatf("Type: %s, Write: 0x%0h Addr: 0x%0h, Data: 0x%0h, CSR: 0x%0h, POC: 0x%0h, BA_MASK: 0x%0h, Req Bus: %0b, Enter PD: %0b, Exit PD: %0b",
                  transaction_type.name(), write, address, data, csr_value, poc_value, ba_mask_value, request_bus, enter_power_down, exit_power_down);
    return s;
  endfunction

endclass
