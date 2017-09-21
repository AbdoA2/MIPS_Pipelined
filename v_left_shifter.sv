module v_left_shifter (input logic[31:0] a, input logic[4:0] shamt, output logic[31:0] y);
  logic[31:0] sh[3:0];
  k_shifter sl1(a, {a[30:0], 1'b0}, shamt[0], sh[0]);
  k_shifter s12(sh[0], {sh[0][29:0], 2'b0}, shamt[1], sh[1]);
  k_shifter s13(sh[1], {sh[1][27:0], 4'b0}, shamt[2], sh[2]);
  k_shifter s14(sh[2], {sh[2][23:0], 8'b0}, shamt[3], sh[3]);
  k_shifter s15(sh[3], {sh[3][15:0], 16'b0}, shamt[4], y);
endmodule
