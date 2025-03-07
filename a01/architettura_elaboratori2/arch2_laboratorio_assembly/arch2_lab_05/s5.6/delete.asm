# INPUT:
# index of element to remove

	.data
msg:	.asciiz "The array is already empty, cannot remove more items\n"
msg2:	.asciiz "The index inserted is not valid (0 <= index < H)\n"
	
	.text
	.globl delete
delete:
	move $t0, $fp
	addi $fp, $sp, -4
	sw $t0, 0($fp)
	sw $s0, -4($fp)
	sw $s1, -8($fp)
	sw $s2, -12($fp)
	sw $s3, -16($fp)
	addi $sp, $fp, -20

	la $s0, V # s0 <- M[V[0]]
	la $s1, H # s1 <- M[H]
	lw $s2, 0($s1) # s2 <- H

	beq $s2, $zero, empty
	bge $a0, $s2, invalid # if a0 >= H, invalid (0 <= a0 < H)
	blt $a0, $zero, invalid # if a0 < 0, invalid (0 <= a0 < H)

	addi $t0, $s2, -1 # t0 <- H - 1

loop:
	mul $t1, $a0, 4 # t1 <- a0 * 4
	add $t2, $s0, $t1 # t2 <- M[V[a0]]

	addi $t3, $t2, 4 # t2 <- M[V[a0++]]

	beq $a0, $t0, ifLast # if a0 == H-1
	lw $t4, 0($t3)
	sw $t4, 0($t2)
	j continue

ifLast:
	sw $zero, 0($t2)

continue:
	addi $a0, $a0, 1
	blt $a0, $s2, loop

	addi $s2, $s2, -1 # H--
	sw $s2, 0($s1) # save H++

	j exit

empty:
	li $v0, 4
	la $a0, msg
	syscall

	j exit

invalid:
	li $v0, 4
	la $a0, msg2
	syscall

	j exit

exit:
	lw $t0, 0($fp)
	lw $s0, -4($fp)
	lw $s1, -8($fp)
	lw $s2, -12($fp)
	lw $s3, -16($fp)
	move $fp, $t0

	jr $ra