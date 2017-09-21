module MEM_WB_Reg(input logic clk, reset, 
                  input logic[1:0] WB_control_,
                  input logic[31:0] aluout_, readdata_,
                  input logic[4:0] rd_,
                  output logic[1:0] WB_control,
                  output logic[31:0] aluout, readdata,
                  output logic[4:0] rd);
                 
  always_ff@(posedge clk)
    begin
      if (reset) begin
        WB_control <= 0; aluout <= 0; readdata <= 0; rd <= 0;
      end
      else begin
        // aluout, memory output
        aluout <= aluout_; readdata <= readdata_;
        
        // write_back stage control signals
        WB_control <= WB_control_; rd <= rd_;
        
      end
    end 
endmodule







