module signExtension #(parameter N =16, M = 16)(input logic[N-1:0] a, input logic s, output logic[N+M-1:0] y);
  assign y = {{M{s}}, a};
endmodule
