module logicUnit(input logic[31:0] a, b, input logic[1:0] s, output logic[31:0] y);
  always_comb
  case(s)
    0: y = a & b;
    1: y = a | b;
    2: y = a ^ b;
    3: y = ~(a | b);
  endcase
endmodule
