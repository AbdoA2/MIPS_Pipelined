module arithmeticUnit(input logic[31:0] a, b, input logic[1:0] s, output logic[31:0] y, output logic c_out, o);
  logic[31:0] p, y_;
  logic c_in, c;
  mux2 mux(b, ~b, s[0], p);
  adder add(a, p, s[0], y_, c);
  mux2 mux1(y_, {31'b0, y_[31]}, s[1], y);
  assign c_out = s[1]? 0 : s[0]? ~c : c;
  always_comb
    if (s != 2'b10)
      o <= (~s[0] & ~a[31] & ~b[31] & y_[31]) | (~s[0] & a[31] & b[31] & ~y_[31]) | (s[0] & ~a[31] & b[31] & y_[31]) | (s[0] & a[31] & ~b[31] & ~y_[31]);
    else
      o <= 0;  
endmodule
