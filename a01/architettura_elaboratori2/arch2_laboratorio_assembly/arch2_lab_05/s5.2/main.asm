	.data
msg1:	.asciiz "Factorial: "	
msg2:	.asciiz "\nFibonacci: "

	.text
	.globl main
main:
	li $s0, 7 # N

	#move $a0, $s0
	#jal factorial
	#move $s1, $v0

	#li $v0, 4
	#la $a0, msg1
	#syscall

	#li $v0, 1
	#move $a0, $s1
	#syscall

	move $a0, $s0
	jal fibonacci
	move $s2, $v0

	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 1
	move $a0, $s2
	syscall

exit:
	li $v0, 10
	syscall

# Input: a0 number
# Output: v0 factorial(n)
factorial:
	move $t0, $fp
	addi $fp, $sp, -4
	sw $t0, 0($fp)
	sw $sp, -4($fp)
	sw $ra, -8($fp)
	sw $s0, -12($fp)
	addi $sp, $fp, -12

	move $s0, $a0
	beqz $s0, baseCaseFact # s0 == 0 ?

	addi $a0, $s0, -1
	jal factorial
	mul $t1, $v0, $s0

	move $v0, $t1
	j epilogueFact

baseCaseFact:
	li $v0, 1

epilogueFact:
	lw $t0, 0($fp)
	lw $sp, -4($fp)
	lw $ra, -8($fp)
	lw $s0, -12($fp)
	move $fp, $t0
	jr $ra

# Input: a0 number
# Output: v0 fibonacci(n)
fibonacci:
	move $t0, $fp
	addi $fp, $sp, -4
	sw $t0, 0($fp)
	sw $sp, -4($fp)
	sw $ra, -8($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	addi $sp, $fp, -16

	move $s0, $a0 # s0 <- N 
	addi $a0, $s0, -1
	ble $s0, 1, baseCaseFib

	jal fibonacci
	move $s1, $v0 # s1 <- fibonacci(N-1)

	addi $a0, $s0, -2 # a0 <- N - 2
	jal fibonacci

	add $t1, $s1, $v0 
	move $v0, $t1 # v0 <- fibonacci(N-1) + fibonacci(N-2)

	j epilogueFib

baseCaseFib:
	move $v0, $s0

epilogueFib:
	lw $t0, 0($fp)
	lw $sp, -4($fp)
	lw $ra, -8($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	move $fp, $t0
	jr $ra
