module ALU(input logic[31:0] a, b, input logic[3:0] s, output logic[31:0] y, output logic C, S, Z, O);
  logic[1:0] c_out;
  logic[31:0] Y[2:0], lo;
  logic o1;
  
  arithmeticUnit ar(a, b, s[1:0], Y[0], c_out[0], o1);
  logicUnit lu(a, b, s[1:0], Y[1]);
  shiftUnit su(b, a[4:0], s[1:0], Y[2]);
  //assign {hi, lo} = a * b;
  
  mux_4 mux(Y[0], Y[1], Y[2], lo, s[3:2], y);
  assign S = y[31];
  assign Z = (y === 32'b0);
  assign O = (~s[3] & ~s[2])? o1 : 0;
  assign C = s[3]? (s[2]? 0 : 0) : (s[2]? 0 : c_out[0]);
endmodule
