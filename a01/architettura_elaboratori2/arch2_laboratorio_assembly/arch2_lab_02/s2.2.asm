	.data
msg1:	.asciiz "Insert integer: "
msg2:	.asciiz "The two numers are: "
msg3:	.asciiz ", " #if i use .ascii, i then have to put a .space 4 after
	.align 2
array:	.space 8 #two element array

	.text
	.globl main
main:
	li $v0, 4
	la $a0, msg1
	syscall #print string

	li $v0, 5
	syscall #read int
	move $t0, $v0 #t0 <- v0

	addi $t1, $t0, 1 #t1 <- t0 + 1

	la $s0, array
	sw $t0, 0($s0) #v[0] <- t0
	sw $t1, 4($s0) #v[1] <- t1

	li $v0, 4
	la $a0, msg2
	syscall #print string

	li $v0, 1
	lw $a0, 0($s0) #a0 <- v[0]
	syscall #print int

	li $v0, 4
	la $a0, msg3
	syscall #print string

	li $v0, 1
	lw $a0, 4($s0) #a0 <- v[1]
	syscall #print int

	li $v0 10 # exit
	syscall