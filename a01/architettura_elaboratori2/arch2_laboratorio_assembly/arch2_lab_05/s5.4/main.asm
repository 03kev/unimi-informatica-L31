	.data
V:	.word 3 5 7 8 10 12 5 100 25 50
N:	.word 10

	.text
	.globl main
main:
	lw $s0, N
	la $s1, V

	move $a0, $s0
	move $a1, $s1
	jal sum
	move $s1, $v0

	li $v0, 1 #print int
	move $a0, $s1
	syscall

exit:
	li $v0, 10
	syscall

#################
# Input			#
# a0 <- N		#
# a1 <- M[V]	#
#################
# Output		#
# v0 <- sum(V)	#
#################
sum:
	move $t0, $fp
	addi $fp, $sp, -4
	sw $t0, 0($fp)
	sw $sp, -4($fp)
	sw $ra, -8($fp)
	sw $s0, -12($fp)
	addi $sp, $fp, -20

	move $s0, $a0 # s0 <- a0 (starts with N)
	addi $a0, $a0, -1 # a0 <- a - 1 (starts with N)

	mul $t0, $s0, 4 # t0 <- s0 * 4
	add $t0, $a1, $t0 # M[v] + t0
	lw $s0, -4($t0) # s0 <- lw M[t0 - 4]

	beq $s0, 0, caseBase

	jal sum
	move $t0, $v0 # S(arr, dim-1)

	add $t1, $t0, $s0 # S(arr, dim-1) + arr[dim-1]
	move $v0, $t1

	j epilogue

caseBase:
	li $v0, 0

epilogue:
	lw $t0, 0($fp)
	lw $sp, -4($fp)
	lw $ra, -8($fp)
	lw $s0, -12($fp)
	move $fp, $t0
	jr $ra