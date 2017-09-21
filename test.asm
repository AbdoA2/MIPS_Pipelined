addi $t0, $0, 15432
sw $t0, 0($0)
addi $t1, $0, 9876
sw $t1, 4($0)
add $s0, $t0, $t1
sw $s0, 8($0)
sub $s1, $t0, $t1
sw $s1, 12($0)
addi $t2, $0, 2345
addi $t3, $0, 5674
sll $s2, $t2, 3
srl $s3, $t3, 1
and $s4, $t2, $t3
or $s5, $t2, $t3
sw $s2, 16($0)
sw $s3, 20($0)
sw $s4, 24($0)
sw $s5, 28($0)