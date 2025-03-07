	.data
msg1:	.asciiz "Insert integer: "	
msg2:	.asciiz "The following integer is: "

	.text
	.globl main
main:
	li $v0, 4
	la $a0, msg1
	syscall #print string

	li $v0, 5
	syscall #read int
	move $t0, $v0 #t0 <- v0

	addi $t0, $t0, 1 #increase int

	li $v0, 4
	la $a0, msg2
	syscall #print string

	li $v0, 1
	move $a0, $t0
	syscall #print int

	li $v0, 10 #exit
	syscall