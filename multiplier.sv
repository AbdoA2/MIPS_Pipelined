module multiplier (input logic clk, reset, en,
                   input logic[31:0] m, ai, qi,
                   output logic[31:0] a, q,
                   output logic[4:0] e);
 
  logic c;
  logic[31:0] p, q_;
  logic[4:0] counter;
  
  always_ff @ (posedge en)
    begin
      counter <= 5'b11111;
    end
  
  assign q_ = qi[0]? m : 0;
  assign {c, p} = ai + q_;
  assign a = {c, p[31:1]};
  assign q = {p[0], qi[31:1]};
  
  always_ff @ (posedge clk)
    begin
      if (en == 1) begin
        counter <= counter - 1;
      end
      else counter <= 5'b0;
    end
  
  assign e = reset? 0 : counter;
  
  
endmodule
