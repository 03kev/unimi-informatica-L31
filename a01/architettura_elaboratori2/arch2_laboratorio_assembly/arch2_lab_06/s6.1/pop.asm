#################
# INPUT: none	#
#################
# OUTPUT: none	#
#################

	.text
	.globl pop
pop:
	la $t8, stack # M[stack]
	lw $t7, 0($t8) # stack pointer
	la $t9 stack_n # M[stack_n]

	beq $t7, 0, exit # exit if there are no items

	lw $t4, 12($t7) # t4 <- pointer to next to last element
	sw $t4, 0($t8) # move pointer to next to last element in stack
	
	# clean heap memory
	sw $zero, 0($t7)
	sw $zero, 4($t7)
	sw $zero, 8($t7)
	sw $zero, 12($t7)

	lw $t3, 0($t9) # t3 <- stack_n
	addi $t3, $t3, -1 # stack_n --
	sw $t3, 0($t9)

	# update free spaces
	lw $t5, free_space
	addi $t5, $t5, 1
	sw $t5, free_space

exit:
	jr $ra