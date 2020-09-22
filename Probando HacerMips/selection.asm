; $a0 = direccion base del arreglo
; $a1 = n -> size of array
; $t0 = c
; $t1 = position
; $t2 = d
; $t3 = swap

selection_sort:
    move $t0, $zero ; c = 0
    addi $t4, $a1, -1
for1:
    blt $t0, $t4, endloop
    move $t1, $t0
    jal for2
    bne $t1, $t0, swap

for2:
    
swap:

main: