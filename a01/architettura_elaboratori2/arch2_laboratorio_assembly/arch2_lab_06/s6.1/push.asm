#################
# INPUT			#
# a0 <- x		#
# a1 <- y		#
# a2 <- z		#
#################
# OUTPUT: none	#
#################

	.text
	.globl push
push:
	move $t0, $a0 # t0 <- a0
	move $t1, $a1 # t1 <- a1
	move $t2, $a2 # t2 <- a2

	lw $t6, free_space
	bne $t6, 0, overwrite # if there are free spaces, don't use sbrk but overwrite them

	la $t8, stack # M[stack]
	lw $t7, 0($t8) # stack pointer
	la $t9 stack_n # M[stack_n]

	li $a0 16 # malloc(4x4 bytes)
	li $v0 9
	syscall # v0 <- pointer to heap address

	sw $t0, 0($v0)
	sw $t1, 4($v0)
	sw $t2, 8($v0)
	sw $t7, 12($v0) # pointer to previous (by adding order) element (next by logical order)

	lw $t3, 0($t9) # t3 <- stack_n
	addi $t3, $t3, 1 # stack_n ++

	sw $v0, 0($t8) # stores heap pointer 
	sw $t3, 0($t9) # updates stack_n

	jr $ra

overwrite:
	la $t8, stack # M[stack]
	lw $t7, 0($t8) # stack pointer
	la $t9 stack_n # M[stack_n]

	add $t5, $t7, 16 # the first free space is the one next to the last element: the pointer saved in stack (that is the pointer of the last element) + 16
	
	sw $t0, 0($t5)
	sw $t1, 4($t5)
	sw $t2, 8($t5)
	sw $t7, 12($t5)

	lw $t3, 0($t9) # t3 <- stack_n
	addi $t3, $t3, 1 # stack_n ++

	sw $t5, 0($t8) # stores heap pointer 
	sw $t3, 0($t9) # updates stack_n

	addi $t6, $t6, -1
	sw $t6, free_space

	jr $ra