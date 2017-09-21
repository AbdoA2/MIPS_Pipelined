addi $t0, $0, 12 #calculate 12 factorial
addi $t1, $0, 1
addi $s0, $0, 1
loop:
mul $s0, $s0, $t0
addi $t0, $t0, -1
bl $t1, $t0, loop
jal end
srl $s0, $s0, 3
sw $s0, 8($0)
lw $s1, 0($0)
srl $s1, $s1, 4
sw $s1, 12($0)
j e
end:
sw $s0, 0($0)
sw $ra, 4($0)
jalr $ra
e:
sw $ra, 16($0)