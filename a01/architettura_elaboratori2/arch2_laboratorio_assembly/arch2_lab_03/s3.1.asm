	.data
msg1: .asciiz "Insert an integer: "
msg2: .asciiz "The following even number is: "

	.text
	.globl main
main:

	li $v0, 4
	la $a0, msg1
	syscall #print string

	li $v0, 5
	syscall #read int
	move $s0, $v0

	rem $t1, $s0, 2 #N % 2
	addi $s1, $s0, 1

	bne $t1, 0, end #t1 != 0
	addi $s1, $s1, 1 #if t1 == 0 -> t1 += 1

end:
	li $v0, 4
	la $a0, msg2
	syscall #print string

	li $v0, 1
	move $a0, $s1
	syscall #print int

	li $v0, 10
	syscall #exit