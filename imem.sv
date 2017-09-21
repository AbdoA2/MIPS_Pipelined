module imem( input logic[31:0] a, output logic[31:0] rd);
  logic[31:0] RAM[2565:0];
  
  initial
    $readmemh("test6.tv", RAM);
    
  assign rd = RAM[a[7:2]];  
   
endmodule


