#############################
# INPUT						#
# a0 <- N					#
# a1 <- array stack address #
#############################
# OUTPUT				 	#
# v0 <- min value		 	#
#############################

	.text
	.globl min
min:
	li $t0, 1 # counter
	lw $v0, 0($a1)
	add $a1, $a1, -4

loop:
	lw $t2, 0($a1)
	bge $t2, $v0, continue # t2 >= v0

	move $v0, $t2

continue:
	add $a1, $a1, -4
	add $t0, $t0, 1
	blt $t0, $a0, loop

	jr $ra