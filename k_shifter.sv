module k_shifter #(parameter N = 32) (input logic[N-1:0] d0, d1, input logic s, output logic[N-1:0] y);
  generate
    genvar i;
    for (i = N-1; i >= 0; i--) begin
      mux2 #(1) m_k(d0[i], d1[i], s, y[i]);
    end  
  endgenerate
endmodule
