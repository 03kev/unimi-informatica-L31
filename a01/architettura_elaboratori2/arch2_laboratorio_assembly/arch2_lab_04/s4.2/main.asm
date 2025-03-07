	.data
msgN:	.asciiz "Insert integer N < 100: "
msgArr:	.ascii "Insert array value number "
N:	.space 2
	.asciiz ": "
msgMin:	.asciiz "The min value is: "
msgMax:	.asciiz "\nThe max value is: "

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

	li $s2, 1 # counter for array input

	move $s3, $sp
	add $s3, $s3, -4 # address of array in stack

input:
	move $a0, $s2 # a0 <- N
	jal itoa

	li $v0, 4
	la $a0 msgArr
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	addi $sp, $sp, -4
	sw $t0, 0($sp)

	add $s2, $s2, 1 # s2 ++
	ble $s2, $s0, input # if s2 = counter <= s0 = N

	#loop finishes
	#print output with syscalls

	move $a0, $s0 # N
	move $a1, $s3 # M[array[0]]
	jal min

	move $s4, $v0

	li $v0, 4
	la $a0, msgMin
	syscall

	move $a0, $s4
	li $v0, 1
	syscall

	move $a0, $s0 # N
	move $a1, $s3 # M[array[0]]
	jal max

	move $s4, $v0

	li $v0, 4
	la $a0, msgMax
	syscall

	move $a0, $s4
	li $v0, 1
	syscall

exit: 
	li $v0, 10
	syscall #exit