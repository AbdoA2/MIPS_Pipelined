module v_right_shifter (input logic[31:0] a, input logic[4:0] shamt, input logic l, output logic[31:0] y);
  logic[31:0] sh[3:0];
  k_shifter sr1(a, {l, a[31:1]}, shamt[0], sh[0]);
  k_shifter sr2(sh[0], {{2{l}}, sh[0][31:2]}, shamt[1], sh[1]);
  k_shifter sr3(sh[1], {{4{l}}, sh[1][31:4]}, shamt[2], sh[2]);
  k_shifter sr4(sh[2], {{8{l}}, sh[2][31:8]}, shamt[3], sh[3]);
  k_shifter sr5(sh[3], {{16{l}}, sh[3][31:16]}, shamt[4], y);
endmodule


