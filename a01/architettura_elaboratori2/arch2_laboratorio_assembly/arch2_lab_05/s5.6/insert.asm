# INPUT:
# a0 <- element to add

	.data
msg:	.asciiz "The array is already full, cannot add more items\n"

	.text
	.globl insert
insert:
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

	sub $t0, $s1, $s0 # t0 <- M[H] - M[V[0]]
	div $t0, $t0, 4 # t0 <- capacity of array

	bge $s2, $t0, full # if array is full

	mul $t1, $s2, 4 # H * 4
	add $t1, $s0, $t1 # M[V[H]]

	sw $a0, 0($t1) # M[V[H]] <- a0
	addi $s2, $s2, 1 # H++
	sw $s2, 0($s1) # save H++

	j exit

full:
	li $v0, 4
	la $a0, msg
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