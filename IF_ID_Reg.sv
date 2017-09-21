module IF_ID_Reg(input logic clk, reset, en, input logic[31:0] instr_, pc_, pc4_, output logic[31:0] instr, pc, pc4);
  always_ff@(posedge clk)
    begin
      if (reset) begin
        instr <= 32'b100000;
        pc <= 0;
        pc4 <= 0;
      end
      else if (en) begin
        instr <= instr_;
        pc <= pc_;
        pc4 <= pc4_;
      end
    end 
endmodule