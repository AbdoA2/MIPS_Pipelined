module Hazard_Unit(input logic reset,
                   input logic[4:0] rsE, rtE, rdM, rdE, rtM, rdW, rsD, rtD,
                   input logic regwriteE, regwriteM, regwriteW, regvalueWE, regvalueW, BranchD, jrD,
                   input logic[1:0] memwriteD, memwriteM,
                   output logic[1:0] ForwardAE, ForwardBE,
                   output logic ForwardAD, ForwardBD, ForwardM,
                   output logic StallD, StallF, FlushE);
  
  // Execution Stage Hazards
  
  // stalling for load word
  assign lwstall = (((rsD == rtE) || (rtD == rtE && memwriteD == 0)) && regvalueWE)? 1 : 0; 
  
  // forwarding logic
  always_comb
    begin
      // rs Forwarding
      if (rsE != 0 && rsE == rdM && regwriteM)
          ForwardAE = 01;
      else if (rsE != 0 && rsE == rdW && regwriteW)
          ForwardAE = 10;
      else
          ForwardAE = 0;
      
      // rt Forwarding
      if (rtE != 0 && rtE == rdM && regwriteM)
          ForwardBE = 01;
      else if (rtE != 0 && rtE == rdW && regwriteW)
          ForwardBE = 10;
      else
          ForwardBE = 0;
    end
    
  // Memory Stage Hazards
  assign ForwardM = (memwriteM != 0 && rtM == rdW && regvalueW && regwriteW)? 1 : 0;
  
  // Control Hazards
  // stalling
  assign branchstall = (BranchD && (rsD == rdE || rtD == rdE) && regwriteE)? 1 :
                       (BranchD && (rsD == rdM || rtD == rdM) && regvalueWE)? 1 : 0;
  
  assign jumpstall = (jrD && rsD == rdE && regwriteE)? 1 :
                     (jrD && rsD == rdM && regvalueWE)? 1 : 0;
  
  // forwarding
  assign ForwardAD = (rsD != 0 && rsD == rdM && regwriteM)? 1 : 0;
  assign ForwardBD = (rtD != 0 && rtD == rdM && regwriteM)? 1 : 0;
  
  // General Processor Stalling
  assign Stalling = reset? 0 : branchstall | lwstall | jumpstall;
  assign StallF = Stalling;
  assign StallD = Stalling;
  assign FlushE = Stalling;
      
endmodule
