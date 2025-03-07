#############################################################
# procedure to put in N space a two digit number in string	#
#############################################################
# $a0 = N -> number to convert to string			 		#
#############################################################

	.text
	.globl itoa
itoa:
	li $a1, 0

loop:
	li $t0, 10
	div $a0, $t0 # N / 10
	mflo $t1 # t1 <- other digits (quotient)
	mfhi $t2 # t2 <- last digit (remainder)

	li $t0, 48 # ascii code for 0

	add $t0, $t0, $t2 # t0 <- ascii code + digit

	sub $t2, $s1, $a1 # t0 <- M[N] + 1 - counter
	sb $t0, 0($t2) # store last digit

	addi $a1, $a1, 1 # counter ++
	move $a0, $t1 # update a0 for the next loop (div)

	seq $t3, $a1, 1 # a1 == 1 ? 1 : 0
	seq $t4, $t1, 0 # t1 == 0 ? 1 : 0
	and $t5, $t3, $t4 # t5 <- t3 ∧ t4

	beq $t5, 1, oneDigit
	bne $t1, 0, loop

	jr $ra

oneDigit:
	sub $t2, $s1, $a1
	li $t0, 2
	sb $t0, 0($t2)

	jr $ra