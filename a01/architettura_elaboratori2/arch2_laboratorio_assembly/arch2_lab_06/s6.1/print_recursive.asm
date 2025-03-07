#################
# INPUT: none	#
#################
# OUTPUT: none	#
#################
	.data
space:	.asciiz " "
nl:		.asciiz "\n"

	.text
	.globl print_recursive
print_recursive:
	beq $t7, 0, exit # exit if there are no items

	la $t1, stack # M[stack]
	lw $t2, 0($t1) # stack pointer
	lw $t3 stack_n # stack_n

recursive:
	move $t0, $fp
	addi $fp, $sp, -4
	sw $t0, 0($fp)
	sw $sp, -4($fp)
	sw $ra, -8($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	addi $sp, $fp, -16

	move $s0, $t2
	beq $t2, $zero, baseCase
	lw $t2, 12($t2) # pointer to previous item

	move $s1, $t3
	addi $t3, $t3, -1
	
	jal recursive

	lw $t0, 0($s0)
	lw $t1, 4($s0)
	lw $t2, 8($s0)

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

	lw $t3, stack

	beq $s0, $t3, skip_newline
	li $v0, 4
	la $a0, nl
	syscall
skip_newline: 

baseCase:

	lw $t0, 0($fp)
	lw $sp, -4($fp)
	lw $ra, -8($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	move $fp, $t0
exit:	
	jr $ra