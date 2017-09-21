module mips(input logic clk, reset,
            output logic[31:0] pc,
            input logic[31:0] instr,
            output logic[1:0] memwriteM,
            output logic[31:0] aluoutM, writedataM,
            input logic[31:0] readdataM);
  
  logic[31:0] instrD;
  
  // Control signals
  logic[6:0] DEC_control;
  logic[10:0] EX_control;
  logic[4:0] MEM_control;
  logic[1:0] WB_control;
  
  // Exception signals
  logic undefined, OF, cause, excep;
  
  // Stages registers
  logic[4:0] rsE, rtE, rdM, rdE, rtM, rdW;
  
  // Control signals for hazard handling
  logic regwriteE, regwriteM, regwriteW, regvalueWE, regvalueW, Branch, undifinedE;
  logic[1:0] memwriteE;
  
  // Forwarding signals
  logic[1:0] ForwardAE, ForwardBE;
  logic ForwardAD, ForwardBD, ForwardM;
  
  // Stalling signals
  logic StallD, StallF, FlushE;
  
  maindec controller(instrD[31:26], instrD[5:0], DEC_control, EX_control, MEM_control, WB_control);
  
  exceptionUnit excepU(reset, undefinedE, signE, OF, excep, cause);
  
  datapath dp(clk, reset,
              pc, instr,
              instrD,
              DEC_control, EX_control, MEM_control, WB_control,
              aluoutM, writedataM,
              readdataM,
              OF, signE,
              excep, cause,
              rsE, rtE, rdM, rdE, rtM, rdW,
              regwriteE, regwriteM, regwriteW, regvalueWE, regvalueW, Branch, undifinedE,
              memwriteM,
              ForwardAE, ForwardBE,
              ForwardAD, ForwardBD, ForwardM,
              StallD, StallF, FlushE);
              
  Hazard_Unit hazardU(reset, rsE, rtE, rdM, rdE, rtM, rdW, instrD[25:21], instrD[20:16],
                      regwriteE, regwriteM, regwriteW, regvalueWE, regvalueW, Branch, undifinedE,
                      MEM_control[4:3], memwriteM,
                      ForwardAE, ForwardBE,
                      ForwardAD, ForwardBD, ForwardM,
                      StallD, StallF, FlushE);
  
endmodule
