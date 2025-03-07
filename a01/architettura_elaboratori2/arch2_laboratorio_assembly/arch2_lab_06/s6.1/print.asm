#################
# INPUT: none	#
#################
# OUTPUT: none	#
#################
	.data
space:	.asciiz " "
nl:		.asciiz "\n"

	.text
	.globl print
print:
	la $t8, stack # M[stack]
	lw $t7, 0($t8) # stack pointer
	lw $t9 stack_n # stack_n

	beq $t7, 0, exit # exit if there are no items

loop:
	lw $t0, 0($t7)
	lw $t1, 4($t7)
	lw $t2, 8($t7)
	lw $t7, 12($t7) # pointer to previous item

	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 4
	la $a0, space
	syscall

	li $v0, 1
	move $a0, $t1
	syscall

	li $v0, 4
	la $a0, space
	syscall

	li $v0, 1
	move $a0, $t2
	syscall

	beqz $t7, exit # skip newline after last element
	li $v0, 4
	la $a0, nl
	syscall

	addi $t9, $t9, -1
	bgt $t9, 0, loop

exit:
	jr $ra