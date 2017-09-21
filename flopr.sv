module flopr #(parameter N = 32)(input logic clk, reset, en, input logic[N-1:0] d, output logic[N-1:0] q);
  always_ff@(posedge clk, posedge reset)
  begin
    if (en & reset) q <= 0;
    else if (en) q <= d;
  end
endmodule

