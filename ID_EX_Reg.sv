module ID_EX_Reg(input logic clk, reset, en,
                 input logic[10:0] EX_control_, // alusrca, alusrcb, aluop, sign, regdst, regvalue[1:0]
                 input logic[4:0] MEM_control_, // memwrite, memsign, regvalue[1:0]
                 input logic[1:0] WB_control_, // regwrite, regvalue[2]
                 input logic[31:0] rd1_, rd2_, imm_, pc_, pc4_,
                 input logic[4:0] rs_, rt_,
                 input logic undefined_,
                 output logic[10:0] EX_control, // alusrca, alusrcb, aluop, sign, regdst, regvalue[1:0]
                 output logic[4:0] MEM_control, // memwrite, memsign, regvalue[1:0]
                 output logic[1:0] WB_control, // regwrite, regvalue[2]
                 output logic[31:0] rd1, rd2, imm, pc, pc4,
                 output logic[4:0] rs, rt,
                 output logic undefined);
  always_ff@(posedge clk)
    begin
      if (reset) begin
        EX_control <= 0; MEM_control <= 0; WB_control <= 0; rd1 <= 0; rd2 <= 0; imm <= 0; pc <= 0; pc4 <= 0;
        rs <= 0; rt <= 0; undefined <= 0;
      end
      else if (en) begin
        // rs in rd1, rt in rd2, extended immdiate
        rd1 <= rd1_; rd2 <= rd2_; imm <= imm_; pc <= pc_; pc4 <= pc4_; undefined <= undefined_;
        
        // execution stage control signals
        EX_control <= EX_control_; rs <= rs_; rt <= rt_;
        
        // memory stage control signals
        MEM_control <= MEM_control_; 
        
        // write_back stage control signals
        WB_control <= WB_control_;
        
      end
    end 
endmodule

