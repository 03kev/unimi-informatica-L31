	.data
msgN:	.asciiz "Insert integer N < 100: "
msgArr:	.ascii "Insert array value number "
N:	.space 2
	.asciiz ": "
msgZ:	.asciiz "Inser parameter k (0 odd, 1 even): "
msgSum:	.asciiz "The sum is: "

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

array:
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
	ble $s2, $s0, array # if s2 = counter <= s0 = N

	#loop finishes

	li $v0, 4
	la $a0, msgZ
	syscall

	li $v0, 5
	syscall
	move $s1, $v0 # s1 <- k

	move $a0, $s0 # N
	move $a1, $s3 # M[array]
	move $a2, $s1 # k
	jal somma

	move $s4, $v0

	li $v0, 4
	la $a0, msgSum
	syscall

	li $v0, 1
	move $a0, $s4
	syscall

exit: 
	li $v0, 10
	syscall #exit
