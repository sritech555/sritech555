// CSR Register Definition
class csr_reg extends uvm_reg;
    rand uvm_reg_field refresh_prescaler;
    rand uvm_reg_field ref_int;
    rand uvm_reg_field fs;
    rand uvm_reg_field f_vpen;
  
  `uvm_object_utils(csr_reg)

  function new (string name = "csr_reg");
    super.new(name,32,UVM_NO_COVERAGE); //32 -> Register Width
  endfunction


    virtual function void build();
        refresh_prescaler = uvm_reg_field::type_id::create("refresh_prescaler");
      refresh_prescaler.configure(this, 8, 24, "RW", 0, 0, 1, 1, 1);

        ref_int = uvm_reg_field::type_id::create("ref_int");
      ref_int.configure(this, 3, 8, "RW", 0, 0, 1, 1, 1);

        fs = uvm_reg_field::type_id::create("fs");
      fs.configure(this, 1, 2, "RW", 0, 0, 1, 1, 1);

        f_vpen = uvm_reg_field::type_id::create("f_vpen");
      f_vpen.configure(this, 1, 1, "RW", 0, 0, 1, 1, 1);
    endfunction: build
endclass: csr_reg

// POC Register Definition
class poc_reg extends uvm_reg;
    rand uvm_reg_field value;
  
  `uvm_object_utils(poc_reg)
  
  function new (string name = "poc_reg");
    super.new(name,32,UVM_NO_COVERAGE); //32 -> Register Width
  endfunction

   
  virtual function void build();
        value = uvm_reg_field::type_id::create("value");
    value.configure(this, 32, 0, "RO", 0, 0, 1, 0, 0);
    endfunction: build
endclass: poc_reg

// BA_MASK Register Definition
class ba_mask_reg extends uvm_reg;
    rand uvm_reg_field mask;

  `uvm_object_utils(ba_mask_reg)
  
  function new (string name = "ba_mask_reg");
    super.new(name,32,UVM_NO_COVERAGE); //32 -> Register Width
  endfunction

   
  virtual function void build();
        mask = uvm_reg_field::type_id::create("mask");
        mask.configure(this, 8, 0, "RW", 0, 0, 1, 0, 1);
    endfunction: build
endclass: ba_mask_reg

class csc0_reg extends uvm_reg;
    rand uvm_reg_field sel;
    rand uvm_reg_field pen;
    rand uvm_reg_field kro;
    rand uvm_reg_field bas;
    rand uvm_reg_field wp;
    rand uvm_reg_field ms;
    rand uvm_reg_field bw;
    rand uvm_reg_field mem_type;
    rand uvm_reg_field en;

  `uvm_object_utils(csc0_reg)
  
  function new (string name = "csc0_reg");
    super.new(name,32,UVM_NO_COVERAGE); //32 -> Register Width
  endfunction

  
    virtual function void build();
        sel = uvm_reg_field::type_id::create("sel");
        sel.configure(this, 8, 16, "RW", 0, 0, 1, 0, 1);

        pen = uvm_reg_field::type_id::create("pen");
        pen.configure(this, 1, 11, "RW", 0, 0, 1, 0, 1);

        kro = uvm_reg_field::type_id::create("kro");
        kro.configure(this, 1, 10, "RW", 0, 0, 1, 0, 1);

        bas = uvm_reg_field::type_id::create("bas");
        bas.configure(this, 1, 9, "RW", 0, 0, 1, 0, 1);

        wp = uvm_reg_field::type_id::create("wp");
        wp.configure(this, 1, 8, "RW", 0, 0, 1, 0, 1);

        ms = uvm_reg_field::type_id::create("ms");
        ms.configure(this, 2, 6, "RW", 0, 0, 1, 0, 1);

        bw = uvm_reg_field::type_id::create("bw");
        bw.configure(this, 2, 4, "RW", 0, 0, 1, 0, 1);

        mem_type = uvm_reg_field::type_id::create("mem_type");
        mem_type.configure(this, 3, 1, "RW", 0, 0, 1, 0, 1);

        en = uvm_reg_field::type_id::create("en");
        en.configure(this, 1, 0, "RW", 0, 0, 1, 0, 1);
    endfunction: build
endclass: csc0_reg

class csc1_reg extends uvm_reg;
    rand uvm_reg_field sel;
    rand uvm_reg_field pen;
    rand uvm_reg_field kro;
    rand uvm_reg_field bas;
    rand uvm_reg_field wp;
    rand uvm_reg_field ms;
    rand uvm_reg_field bw;
    rand uvm_reg_field mem_type;
    rand uvm_reg_field en;
  
  `uvm_object_utils(csc1_reg)
  
  function new (string name = "csc1_reg");
    super.new(name,32,UVM_NO_COVERAGE); //32 -> Register Width
  endfunction


    virtual function void build();
        sel = uvm_reg_field::type_id::create("sel");
        sel.configure(this, 8, 16, "RW", 0, 0, 1, 0, 1);

        pen = uvm_reg_field::type_id::create("pen");
        pen.configure(this, 1, 11, "RW", 0, 0, 1, 0, 1);

        kro = uvm_reg_field::type_id::create("kro");
        kro.configure(this, 1, 10, "RW", 0, 0, 1, 0, 1);

        bas = uvm_reg_field::type_id::create("bas");
        bas.configure(this, 1, 9, "RW", 0, 0, 1, 0, 1);

        wp = uvm_reg_field::type_id::create("wp");
        wp.configure(this, 1, 8, "RW", 0, 0, 1, 0, 1);

        ms = uvm_reg_field::type_id::create("ms");
        ms.configure(this, 2, 6, "RW", 0, 0, 1, 0, 1);

        bw = uvm_reg_field::type_id::create("bw");
        bw.configure(this, 2, 4, "RW", 0, 0, 1, 0, 1);

        mem_type = uvm_reg_field::type_id::create("mem_type");
        mem_type.configure(this, 3, 1, "RW", 0, 0, 1, 0, 1);

        en = uvm_reg_field::type_id::create("en");
        en.configure(this, 1, 0, "RW", 0, 0, 1, 0, 1);
    endfunction: build
endclass: csc1_reg

class tms0_reg extends uvm_reg;
    rand uvm_reg_field timing_field1;
    rand uvm_reg_field timing_field2;
    // Add more fields as per the TMS0 register specifications
  
  `uvm_object_utils(tms0_reg)
  
  function new (string name = "tms0_reg");
    super.new(name,32,UVM_NO_COVERAGE); //32 -> Register Width
  endfunction

    virtual function void build();
        timing_field1 = uvm_reg_field::type_id::create("timing_field1");
      timing_field1.configure(this, 1, 0, "RO", 0, 0, 1, 0, 1);
    endfunction: build
endclass: tms0_reg

class tms1_reg extends uvm_reg;
    rand uvm_reg_field timing_field1;
    rand uvm_reg_field timing_field2;
    // Define specific fields for TMS1 similar to TMS0
  
  `uvm_object_utils(tms1_reg)
  function new (string name = "tms1_reg");
    super.new(name,32,UVM_NO_COVERAGE); //32 -> Register Width
  endfunction

    virtual function void build();
        timing_field1 = uvm_reg_field::type_id::create("timing_field1");
      timing_field1.configure(this, 1, 0, "RO", 0, 1, 1, 0, 1);
    endfunction: build
endclass: tms1_reg



// Memory Controller Register Block
class mem_ctrl_reg_block extends uvm_reg_block;
    csr_reg csr;
    poc_reg poc;
    ba_mask_reg ba_mask;
    csc0_reg csc0;
    csc1_reg csc1; // CSC registers
    tms0_reg tms0;
    tms1_reg tms1; // TMS registers
  
  `uvm_object_utils(mem_ctrl_reg_block)

  function new(string name = "mem_ctrl_reg_block");
	super.new(name, build_coverage(UVM_NO_COVERAGE));
  endfunction

    virtual function void build();
        csr = csr_reg::type_id::create("csr");
        csr.configure(this, null, "CSR");
        csr.build();
    //  csr.set_offset('h5000);
       // csr.lock_model();
        

        poc = poc_reg::type_id::create("poc");
        poc.configure(this, null, "POC");
        poc.build();
      //  poc.set_offset('h5004);
      //  poc.lock_model();

        ba_mask = ba_mask_reg::type_id::create("ba_mask");
        ba_mask.configure(this, null, "BA_MASK");
        ba_mask.build();
      //  ba_mask.set_offset('h5008);
      //  ba_mask.lock_model();

        csc0 = csc0_reg::type_id::create("csc0");
        csc0.configure(this, null, "CSC0");
        csc0.build();
     //   csc0.set_offset('h5010);
      //  csc0.lock_model();

        csc1 = csc1_reg::type_id::create("csc1");
        csc1.configure(this, null, "CSC1");
        csc1.build();
      //  csc1.set_offset('h5018);
      //  csc1.lock_model();

        tms0 = tms0_reg::type_id::create("tms0");
        tms0.configure(this);
        tms0.build();
    //  this.tms0.set_offset(32'h5014,this.default_map);
     //   tms0.lock_model();

        tms1 = tms1_reg::type_id::create("tms1");
        tms1.configure(this, null, "TMS1");
        tms1.build();
      //  tms1.set_offset('h501C);
      //  tms1.lock_model();
      
          //---------------------------------------
    //Memory map creation and reg map to it
    //---------------------------------------
      default_map = create_map("my_map", 'h8000_0000, 4, UVM_LITTLE_ENDIAN); // name, base, nBytes
      default_map.add_reg(csr	 , 'h0, "RW");  // reg, offset, access
      default_map.add_reg(poc	 , 'h4, "RW");
      default_map.add_reg(ba_mask, 'h8, "RW");
      default_map.add_reg(csc0   , 'h10, "RW");
      //default_map.add_reg(csc1   , 'h18, "RW"); 
      default_map.add_reg(tms0   , 'h14, "RW"); 
      //default_map.add_reg(tms1   , 'h1C, "RO"); 
       
    lock_model();
      
    endfunction: build
endclass: mem_ctrl_reg_block
