	.data
msgN:	.asciiz "Insert integer N: "
msgArr:	.ascii "Insert array value number "
N:	.space 2
	.asciiz ": "
msgMax:	.asciiz "The max value is: "
msgMin:	.asciiz "The min value is: "

	.text
	.globl main
main:

	li $v0, 4
	la $a0, msgN
	syscall

	li $v0, 5
	syscall
	move $s0, $v0 # s0 <- N

	la $s1, N
	addi $s1, $s1, 1 # s1 <- M[N]+1
	li $s2 0 # s2 <- counter

	move $t1, $s0

itoa:
	li $t0, 10
	div $t1, $t0 # N / 10
	mflo $t1 # t1 <- other digits (quotient)
	mfhi $t2 # t2 <- last digit (remainder)

	li $t0, 48 # ascii code for 0

	add $t0, $t0, $t2 # t0 <- ascii code + digit

	sub $t2, $s1, $s2 # t0 <- M[N] + 1 - counter
	sb $t0, 0($t2) # store last digit

	addi $s2, $s2, 1 # counter ++

	seq $t3, $s2, 1 # s2 == 1 ? 1 : 0
	seq $t4, $t1, 0 # t1 == 0 ? 1 : 0
	and $t5, $t3, $t4 # t5 <- t3 ∧ t4

	beq $t5, 1, oneDigit
	bne $t1, 0, itoa

continue: 
	li $v0, 4
	la $a0 msgArr
	syscall

	j exit

oneDigit:
	sub $t2, $s1, $s2
	li $t0, 2
	sb $t0, 0($t2)
	j continue

exit: 
	li $v0, 10
	syscall #exit