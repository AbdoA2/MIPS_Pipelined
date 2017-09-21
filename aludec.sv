module aludec(input logic[5:0] funct, input logic[2:0] opcode, output logic[3:0] alucontrol);
  always_comb
    casez(opcode)
      3'b000: alucontrol <= 4'b0000; // add (addi/addiu/sw/sh/sb)
      3'b001: alucontrol <= 4'b0001; // sub (beq/bne/blez/bgtz/slti/sltiu)
      3'b010: alucontrol <= 4'b0100; // andi
      3'b011: alucontrol <= 4'b0101; // ori
      3'b101: alucontrol <= 4'b0110; // xori
      default:casez(funct)
        6'b000?00: alucontrol <= 4'b1000; // sll/sllv
        6'b000?10: alucontrol <= 4'b1010; // srl/srlv
        6'b000?11: alucontrol <= 4'b1011; // sra/srav
        6'b10000?: alucontrol <= 4'b0000; // add/addu
        6'b10001?: alucontrol <= 4'b0001; // sub/subu
        6'b100100: alucontrol <= 4'b0100; // and
        6'b100101: alucontrol <= 4'b0101; // or
        6'b100110: alucontrol <= 4'b0110; // xor
        6'b100111: alucontrol <= 4'b0111; // nor
        6'b10101?: alucontrol <= 4'b0001; // slt/sltu (sub)
        default:   alucontrol <= 4'bxxxx; // ???
      endcase
    endcase  
endmodule
