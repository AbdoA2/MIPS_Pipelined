module shiftUnit(input logic[31:0] a, input logic[4:0] shamt, input logic[1:0] s, output logic[31:0] y);
  logic[31:0] o[1:0];
  logic l;
  v_left_shifter sll(a, shamt, o[0]);
  mux2 #(1) m(1'b0, a[31], s[0], l);
  v_right_shifter sr(a, shamt, l, o[1]);
  assign y = s[1]? o[1] : o[0];
endmodule
