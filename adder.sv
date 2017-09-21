module adder(input logic[31:0] a, b, input logic c_in, output logic[31:0] y, output logic c_out);
  assign {c_out, y} = a + b + c_in;
  //assign o = y[31]^c_out;
  /*logic[31:0] p, g;
  always_comb
  begin
    p = a^b;
    g = a&b;
    y = p^c_in;
    c_out = g | (p&c_in);
    o = y[31] ^ c_out;
  end*/
endmodule
