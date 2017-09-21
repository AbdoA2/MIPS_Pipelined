module mux8 #(parameter N = 32)(input logic[N-1:0] d[7:0], input logic[2:0] s, output logic[N-1:0] y);
  logic[N-1:0] y1, y2;
  mux_4 #(N) m1(d[0], d[1], d[2], d[3], s[1:0], y1);
  mux_4 #(N) m2(d[4], d[5], d[6], d[7], s[1:0], y2);
  assign y = s[2]? y2 : y1;
endmodule
