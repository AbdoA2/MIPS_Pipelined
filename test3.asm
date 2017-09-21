addi $t0, $0, 8346
addi $t1, $0, 8934
sub $s0, $t1, $t0
sub $s1, $t0, $t1
mul $s2, $t0, $t1
ori $t2, $t0, 1234
andi $t3, $t1, 12345
xori $t4, $t2, 5674
sw $s0, 0($0)
sw $s1, 4($0)
sw $s2, 8($0)
sw $t2, 12($0)
sw $t3, 16($0)
sw $t4, 20($0)
