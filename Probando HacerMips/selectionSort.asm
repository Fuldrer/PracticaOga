swap:
    lw  $t0, 0($a0)  #temp = *xp
    lw  $t1, 0($a1)  #$t1 = *yp
    sw  $t1, 0($a0)  #*xp = *yp
    sw  $t0, 0($a1)  #*yp = temp
    jr $ra

selectionSort:
    addi $sp, $sp, -24
    sw  $s0, 0($sp)
    sw  $s1, 4($sp)
    sw  $s2, 8($sp)
    sw  $ra, 12($sp)
    sw  $s3, 16($sp)
    sw  $s4, 20($sp)
    ori $s0, $zero, 0

loop_i:
    addi $t0, $a1, -1
    slt $t0, $s0, $t0
    beq	$t0, $zero, end_loop_i
    move $s2, $s0
    addi $s1, $s0, 1

loop_j:
    slt $t0, $s1, $a0
    beq $t0, $zero, end_loop_j
    sll $t0, $s1, 2
    add $t0, $t0, $a0
    lw $t0, 0($t0)
    sll $t1, $t1, $a0
    add $t1, $t1, $a0
    lw  $t1, 0($t1)
    slt $t2, $t0, $t1
    beq $t2, $zero, no_cumple
    move $s2, $s1
    no_cumple:
    addi $s1, $s1, 1
    j loop_j

end_loop_j:
    move $s3, $a0
    move $s4, $a1
    sll $a0, $s2, 2
    add $a0, $s3, $a0
    sll $a1, $s0, 2
    add $a1, $s3, $a1
    jal swap
    move $a0, $s3
    move $a1, $s4
    addi $s0, $s0, 1
    j loop_i

end_loop_i:
    sw  $s0, 0($sp)
    sw  $s1, 4($sp)
    sw  $s2, 8($sp)
    sw  $ra, 12($sp)
    sw  $s3, 16($sp)
    sw  $s4, 20($sp)
    addi $sp, $sp, 24
    jr $ra