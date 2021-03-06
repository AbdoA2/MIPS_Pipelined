module testbench();
  
  logic clk, reset;
  logic[31:0] dataadr, writedata, instr, pc;
  logic[1:0] memwriteM;
  
  top dut(clk, reset, dataadr, writedata, instr, pc, memwriteM);
  
  initial 
    begin
      reset <= 1; #10; reset <= 0; #10;
    end
    
  always
    begin
      clk <= 1; #250; clk <= 0; #250;
    end
    
  always@(negedge clk)
    begin
      //$display("%h", instr);
      if (memwriteM == 0'b01) begin
        $display("%h", writedata);
      end
    end
  
  
  
endmodule
