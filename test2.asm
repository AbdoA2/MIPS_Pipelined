addi $t0, $0, 8346
addi $t1, $0, 8934
addi $t2, $0, 3
sllv $t0, $t2, $t0
sllv $t1, $t2, $t1 
sw $t0, 0($0)
sw $t1, 4($0)
multu $t1, $t0
mfc0 $s0, $v0
mfc0 $s1, $v1
sw $s0, 8($0)
sw $s1, 12($0)