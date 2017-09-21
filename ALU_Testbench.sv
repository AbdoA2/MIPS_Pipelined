module ALU_Testbench();
  logic[31:0] a, b, y, Y;
  logic[3:0] s;
  logic CF, OF, SF, ZF;
  logic C, O, S, Z;
  logic clk;
  logic[103:0] testvector[6:0];
  logic[3:0] index, errors;
  
  ALU ALU_Unit(a, b, s, y, CF, SF, ZF, OF);
  
  always
    begin
      clk = 1; #100; clk = 0; #100;
    end

  initial 
    begin
      $readmemh("ALU_Test.tv", testvector);
      index = 0; errors = 0;
    end
    
  always@(posedge clk)
    begin
      {a, b, s, Y, C, Z, S, O} = testvector[index];
    end
  
  always@(negedge clk)
    begin
        if ({y, C,S,Z,O} !== {Y, CF, SF, ZF, OF}) begin
          $display("Error: inputs=%h %h %b", a, b, s);
          $display("Output: %h (%h expected)", y, Y);
          errors = errors + 1;
        end
        index = index+1;
        if (index === 7) begin
          $display("%d tests ended with %d errors", index, errors);
          //$finish;
        end
    end
 /*initial
    begin
      a = 8'h64; b = 8'h33; s = 4'b0;
      assert (y !== 8'h97) else $error("a7a");
    end
    */
endmodule
