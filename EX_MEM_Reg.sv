module EX_MEM_Reg(input logic clk, reset, 
                 input logic[4:0] MEM_control_, // memwrite, memsign, regvalue[1:0]
                 input logic[1:0] WB_control_, // regwrite, regvalue[2]
                 input logic[31:0] aluout_, writedata_,
                 input logic[4:0] rt_, rd_,
                 output logic[4:0] MEM_control,
                 output logic[1:0] WB_control, 
                 output logic[31:0] aluout, writedata,
                 output logic[4:0] rt, rd);
                 
  always_ff@(posedge clk)
    begin
      if (reset) begin
        aluout <= 0;
        writedata <= 0; rt <= 0; rd <= 0; MEM_control <= 0; WB_control <= 0;
        
      end
      else begin
        // aluout, memvalue
        aluout <= aluout_; writedata <= writedata_;
        
        // memory stage control signals
        MEM_control <= MEM_control_;
        
        // write_back stage control signals
        WB_control <= WB_control_; rd <= rd_;
        
        //hazard detection
        rt <= rt_;
        
      end
    end 
endmodule



