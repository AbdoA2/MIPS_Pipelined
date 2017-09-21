addi $t0, $0, 100
addi $s0, $0, 7070
addi $t1, $0, 1
addi $t2, $0, 55342
nor $s4, $s0, $t2
loop:
add $s0, $s0, $t0
addi $t0, $t0, -1
bge $t0, $t1, loop
slt $s1, $t1, $s0 #1
slt $s2, $s0, $t1 #0
slti $s3, $s0, 10000 #1
sw $s0, 0($0)
sw $s1, 4($0)
sw $s2, 8($0)
sw $s3, 12($0)
sw $s4, 16($0)