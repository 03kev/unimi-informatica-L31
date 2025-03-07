	.data
msg1:	.asciiz "Insert value to gamble: "
msg2:	.asciiz "Your new credit is: "

	.text
	.globl main
main:

	li $v0, 51
	la $a0, msg1
	syscall #int input dialog

	move $s0, $a0 #s0 <- NUM

	mul $t0, $s0, 2 #2*NUM
	addi $t0, $t0, 1 #2*NUM + 1
	
	move $a1, $t0 #max random number
	li $a0, 1 #seed
	li $v0, 42
	syscall #random in range

	move $t1, $a0 #t1 <- random N
	#the following two lines could be omitted
	sub $t2, $t1, $s0 #t1 <- rN - NUM
	add $t3, $t2, $s0 #t1 <- rN - NUM + NUM

	la $a0, msg2 
	move $a1, $t3
	li $v0, 56
	syscall #message dialog int

	li $v0, 10 
	syscall #exit
