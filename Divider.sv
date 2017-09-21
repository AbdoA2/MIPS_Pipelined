module divider(input logic clk, reset, en,
               input logic[32:0] a_, input logic[31:0] q_, m, 
               output logic[32:0] a, output logic[31:0] q,
               output logic[4:0] e);
  
  logic c;
  logic[4:0] counter;
  logic[31:0] q1;
  logic[32:0] p, a1;
  
  always_ff @ (posedge en)
    begin
      counter <= 5'b11111;
    end

  assign a1 = {a_[31:0], q_[31]};
  assign {c, p} = a1 - {1'b0, m};
  assign q = p[32]? {q_[30:0], 1'b0} : {q_[30:0], 1'b1};
  assign a = p[32]? {a_[31:0], q_[31]} : p;
  
  always_ff @ (posedge clk)
    begin
      if (en == 1) begin
        counter <= counter - 1;
      end
      else counter <= 0;
    end
  
  assign e = reset? 0 : counter;
  
endmodule
