module dmem(input logic clk, input logic[1:0] we, input logic[31:0] a, wd, output logic[31:0] rd);
  logic[31:0] RAM[255:0];
  
  assign rd = RAM[a[9:2]];
  
  always_ff@(posedge clk)
    if (we == 0'b01)
      RAM[a[9:2]] <= wd;
    else if (we == 0'b10)
      RAM[a[9:2]][7:0] <= wd[7:0];
    else if (we == 0'b11)
      RAM[a[9:2]][15:0] <= wd[15:0];
    
endmodule
