module datapath(input logic clk, reset,
                output logic[31:0] pcF,
                input logic[31:0] instrF,
                output logic[31:0] instrD,
                input logic[6:0] DEC_controlD,
                input logic[10:0] EX_controlD,
                input logic[4:0] MEM_controlD,
                input logic[1:0] WB_controlD,
                output logic[31:0] aluoutM, writedataM,
                input logic[31:0] readdataM,
                output logic OF, signE,
                input logic excepE, causeE,
                output logic[4:0] rsE, rtE, rdM, wa3E, rtM, rdW,
                output logic regwriteE, regwriteM, regwriteW, regvalueWE, regvalueW, BranchD, undefinedE,
                output logic[1:0] memwriteM,
                input logic[1:0] ForwardAE, ForwardBE,
                input logic ForwardAD, ForwardBD, ForwardM,
                input logic StallD, StallF, FlushE);
  
  
  
  // Control Wires
  logic[10:0] EX_control_E;
  logic[4:0] MEM_control_E, MEM_control_M;
  logic[1:0] WB_control_E, WB_control_M, WB_control_W;
  
  // Fetch Wires
  logic[31:0] pcsF[1:0], pc4F, pc_F; 
  
  // Decode Stage Control signals
  logic beqD, bneD, bgeD, blD, jrD, jumpD, sD, undefinedD, signimmD; 
  // Decode Stage Wires
  logic[31:0] pc4D, pcD, rd1D, rd2D, immD, imm_2D, rd1_D, rd2_D, btaD, jtD, jtaD;
  
   // Execution Stage Control Signals
  logic alusrcaE, alusrcbE, stallMulDiv;
  logic[1:0] regdstE, regvalueE;
  logic[3:0] aluopE;
  // Execution Stage Wires
  logic[31:0] rd1E, rd2E, pc4E, pcE, aluout_E, aluoutE, alu_aE, alu_bE, hiE, fv1E, fv2E, immE;
  logic[31:0] cause_1E, epcE, lorE, hirE, cop0E, cause_E, loE, hi1E, lo1E;
  logic[4:0] enMult, enDiv;
  
  // Memory Stage Control Signals
  logic[1:0] regvalueM;
  logic memsignM, sign8M, sign16M;
  // Memory Stage Wires
  logic[31:0] regdataM[1:0], writedata_M, readdata_M;
  
  // Write Back Stage Control Signals
  //logic regvalueW;
  // Write Back Stage Wires
  logic[31:0] aluoutW, readdataW, resultW;
  //****************** Instruction Fetch Stage *********************//
  
  
  adder pc_4(pcF, 32'b100, 1'b0, pc4F, c);
  
  // new pc
  mux2 #(32) pcb(pc4F, btaD, PCBranchD, pcsF[0]);
  mux2 #(32) pcj(jtaD, rd1D, jrD, pcsF[1]);
  mux_4 #(32) pcsrc_(pcsF[0], pcsF[1], 32'b100000000, 32'b100000000, {excepE, jumpD}, pc_F);
  
  // pc register
  flopr #(32) pcreg(clk, reset, (~stallMulDiv & ~StallF), pc_F, pcF);
  
  //****** pipeline IF_ID register
  IF_ID_Reg IF_ID(clk, (reset | (PCBranchD & ~StallD) | (jumpD & ~StallD) | excepE), ~stallMulDiv & ~StallD, instrF, pcF, pc4F, instrD, pcD, pc4D);
  
  //******************** Instruction Decoding Stage ***********************//
  
  // Assign Decode Stage control signals
  assign {beqD, bneD, bgeD, blD, jrD, jumpD, undefinedD} = DEC_controlD;
  assign sD = EX_controlD[6];
  // register file with neg clk (write in first half) read in second.
  regFile regfile(resultW, ~clk, regwriteW,  instrD[25:21], instrD[20:16], rdW, rd1_D, rd2_D);
     
  // sign extend the immidiate
  mux2 #(1) ex_m(instrD[15], 1'b0, ~sD, signimmD);
  signExtension #(16, 16) s_ex(instrD[15:0], signimmD, immD);
  
  // check for branch
  
  // forwarding in branch checking
  mux2 #(32) br1(rd1_D, aluoutM, ForwardAD, rd1D);
  mux2 #(32) br2(rd2_D, aluoutM, ForwardBD, rd2D);
  
  assign eq = rd1D == rd2D;
  assign ge = rd1D >= rd2D;
  assign PCBranchD = (eq & beqD) | (~eq & bneD) | (ge & bgeD) | (~ge & blD);
  assign BranchD = (bgeD | blD | beqD | bneD); // indicate branch instruction for hazard detection
  
   // branch calcuation
  
  sl2 shift2(immD, imm_2D);
  adder pc_bta(imm_2D, pc4D, 1'b0, btaD, c1);
  
  // jump calculation
  sl2 shiftj(instrD, jtD);
  assign jtaD = {pc4D[31:28], jtD[27:0]};
  
  //****** pipeline ID_EX register
  ID_EX_Reg ID_EX(clk, (reset | FlushE | excepE), // clk, reset
            ~stallMulDiv, // enable
            EX_controlD, MEM_controlD, WB_controlD,
            rd1D, rd2D, immD, pcD, pc4D, // rd1, rd2, imm
            instrD[25:21], instrD[20:16],
            undefinedD,
            EX_control_E, MEM_control_E, WB_control_E,
            rd1E, rd2E, immE, pcE, pc4E,
            rsE, rtE, undefinedE);
            
  // ************************* Execution Stage ***********************//
 
  // Execution Stage Control
  assign {alusrcaE, alusrcbE, aluopE, signE, regdstE, regvalueE} = EX_control_E;
  assign regvalueWE = WB_control_E[0];
  assign regwriteE = WB_control_E[1];
  assign memwriteE = MEM_control_E[4:3];
  
  // Coprocessor 0
  
  assign enME = (aluopE == 4'b1111 & regvalueWE == 0); // write HI, LO in case of multiplication
  assign enDE = (aluopE == 4'b1110 & regvalueWE == 0);
  assign cause_E = causeE? 8'h28 : 8'h30; 

  flopr #(32) Cause(clk, reset, excepE, cause_E, cause_1E);
  flopr #(32) EPC(clk, reset, excepE, pcE, epcE);
  flopr #(32) loR(clk, reset, enME | enDE, enME? loE : lo1E, lorE);
  flopr #(32) hiR(clk, reset, enME | enDE, enME? hiE : hi1E, hirE);
  
  // cop0 output
  mux_4 #(32) m_co0(cause_1E, epcE, lorE, hirE, immE[12:11], cop0E);
  
  // ALU inputs
  // srcA
  mux3 #(32) fa(rd1E, aluoutM, resultW, ForwardAE, fv1E);
  mux2 #(32) ma(fv1E, {27'b0, immE[10:6]}, alusrcaE, alu_aE);
  // srcB
  mux3 #(32) fb(rd2E, aluoutM, resultW, ForwardBE, fv2E);
  mux2 #(32) mb(fv2E, immE, alusrcbE, alu_bE);
  
  // ALU 
  ALU alu(alu_aE, alu_bE, aluopE, aluout_E, CF, SF, ZF, OF);
  
  // Multiplier
  assign enMuE = enMult == 5'b11111;
  assign enDiE = enDiv == 5'b11111;
  assign stallMulDiv = (enMult != 5'b0) | (enDiv != 5'b0);
  logic[31:0] multiplicand;
  flopr #(32) Multiplicand(clk, reset, enMuE | enDiE, alu_bE, multiplicand);
  logic an, an_;
  flopr #(1) an1(clk, reset, enDE, an_, an);
  
  /*logic[31:0] m, mr;
  assign m = ((signE && alu_aE[31])? (~alu_aE + 32'b1) : alu_aE);
  assign mr = ((signE && alu_bE[31])? (~alu_aE + 32'b1) : alu_aE);*/
  
  multiplier mult(clk, reset, enME,
                  enMuE? alu_bE : multiplicand,
                  enMuE? 32'b0 : hirE, 
                  enMuE? alu_aE : lorE,
                  hiE, loE, enMult); 
                  
  divider divide(clk, reset, enDE,
                 enDiE? 33'b0 : {an, hirE},
                 enDiE? alu_aE : lorE,
                 enDiE? alu_bE : multiplicand,
                 {an_, hi1E}, lo1E, enDiv);
  
  // execution stage output
  
  mux_4 #(32) ex_output(enME? loE : aluout_E, pc4E, cop0E, {immE[15:0], 16'b0}, regvalueE, aluoutE);
  
  // register to write
  mux3 #(5) reg_dst(rtE, immE[15:11], 5'b11111, regdstE, wa3E);
  
  //***************** EX_MEM Pipeline Register 
  EX_MEM_Reg EX_MEM(clk, reset,
             MEM_control_E, WB_control_E, aluoutE, fv2E, rtE, wa3E,
             MEM_control_M, WB_control_M, aluoutM, writedata_M, rtM, rdM);
  
  //****************** Memory Stage *********************//
  
  // Memory Stage Control
  assign {memwriteM, memsignM, regvalueM} = MEM_control_M; 
  assign regwriteM = WB_control_M[1];
  
  // memory stage output 
  mux2 #(32) m_data(writedata_M, resultW, ForwardM, writedataM);
  
  // Memory output
  mux2 #(1) mem_s(readdataM[7], 1'b0, memsignM, sign8M);
  mux2 #(1) mem_s1(readdataM[15], 1'b0, memsignM, sign16M);
  signExtension #(8, 24) s1(readdataM[7:0], sign8M, regdataM[0]);
  signExtension #(16, 16) s2(readdataM[15:0], sign16M, regdataM[1]);
  
  mux3 mem_out(readdataM, regdataM[0], regdataM[1], regvalueM, readdata_M);
  
  //********* MEM_WB Pipeline Register
  MEM_WB_Reg MEM_WB(clk, reset,
             WB_control_M, aluoutM, readdata_M, rdM, WB_control_W, aluoutW, readdataW, rdW);
             
  //****************** Write Back Stage *********************//
  
  // Write Back Stage Control
  assign {regwriteW, regvalueW} = WB_control_W; 
  
  // register file input mux
  mux2 #(32) regvalue_mux(aluoutW, readdataW, regvalueW, resultW);
  
endmodule