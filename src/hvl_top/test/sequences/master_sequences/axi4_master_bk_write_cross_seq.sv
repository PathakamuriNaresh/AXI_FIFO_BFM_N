`ifndef AXI4_MASTER_BK_WRITE_CROSS_SEQ_INCLUDED_
`define AXI4_MASTER_BK_WRITE_CROSS_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: axi4_master_bk_write_cross_seq
// Extends the axi4_master_base_seq and randomises the req item
//--------------------------------------------------------------------------------------------
class axi4_master_bk_write_cross_seq extends axi4_master_bk_base_seq;
  `uvm_object_utils(axi4_master_bk_write_cross_seq)

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "axi4_master_bk_write_cross_seq");
  extern task body();
endclass : axi4_master_bk_write_cross_seq

//--------------------------------------------------------------------------------------------
// Construct: new
// Initializes new memory for the object
//
// Parameters:
//  name - axi4_master_bk_write_cross_seq
//--------------------------------------------------------------------------------------------
function axi4_master_bk_write_cross_seq::new(string name = "axi4_master_bk_write_cross_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task: body
// Creates the req of type master transaction and randomises the req
//--------------------------------------------------------------------------------------------
task axi4_master_bk_write_cross_seq::body();
  super.body();
begin
  `uvm_info(get_type_name(), $sformatf("DEBUG_MSHA :: BEFORE axi4_master_bk_write_cross_seq"), UVM_NONE); 

  start_item(req);
  if(!req.randomize() with {  req.awsize == WRITE_2_BYTES;
                              req.awlen == 10;
                              req.tx_type == WRITE;
                              req.awburst == WRITE_FIXED;
                              req.transfer_type == BLOCKING_WRITE;}) begin
    `uvm_fatal("axi4","Rand failed");
  end
  
  `uvm_info(get_type_name(), $sformatf("DEBUG_MSHA :: master_seq \n%s",req.sprint()), UVM_NONE); 
  finish_item(req);


  start_item(req);
  if(!req.randomize() with {  req.awsize == WRITE_4_BYTES;
                              req.awlen == 14;
                              req.tx_type == WRITE;
                              req.awburst == WRITE_INCR;
                              req.transfer_type == BLOCKING_WRITE;}) begin
    `uvm_fatal("axi4","Rand failed");
  end
  
  `uvm_info(get_type_name(), $sformatf("DEBUG_MSHA :: master_seq \n%s",req.sprint()), UVM_NONE); 
  finish_item(req);

  start_item(req);
  if(!req.randomize() with {  req.awsize == WRITE_2_BYTES;
                              req.awlen == 15;
                              req.tx_type == WRITE;
                              req.awburst == WRITE_WRAP;
                              req.transfer_type == BLOCKING_WRITE;}) begin
    `uvm_fatal("axi4","Rand failed");
  end
  
  `uvm_info(get_type_name(), $sformatf("DEBUG_MSHA :: master_seq \n%s",req.sprint()), UVM_NONE); 
  finish_item(req);
end

  `uvm_info(get_type_name(), $sformatf("DEBUG_MSHA :: AFTER axi4_master_bk_write_cross_seq"), UVM_NONE); 

endtask : body

`endif

