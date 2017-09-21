module top(input logic clk, reset,
           output logic[31:0] dataadr, writedata, instr, pc,
           output logic[1:0] memwriteM);
  
  logic[31:0] readdata;
  mips processor(clk, reset, pc, instr, memwriteM, dataadr, writedata, readdata);
  dmem data(clk, memwriteM, dataadr, writedata, readdata);
  imem instrs(pc, instr);
  
endmodule
