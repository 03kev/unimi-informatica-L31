	.data
V:	.word 4 5 1 3 5 7 10 13 1 0
	.space 4
N:	.word 10

	.text
	.globl main
main:
	lw $s0, N # s0 <- N
	la $s1, V # s1 <- M[V]

	move $a0, $s0
	move $a1, $s1
	jal sorting

exit:
	li $v0, 10
	syscall


#####################
# INPUT				#
# a0 <- N			#
# a1 <- M[V]		#
# OUTPUT			#
# reverse(V)		#
#####################
sorting:
	li $t1, 0 # left item index
	addi $a0, $a0, -1 # N-1
	move $t3, $a0 # right item index
recursion:
	move $t0, $fp
	addi $fp, $sp, -4
	sw $t0, 0($fp)
	sw $sp, -4($fp)
	sw $ra, -8($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	addi $sp, $fp, -20

	move $s0, $a0 # s0 <- N-1
	addi $a0, $a0, -2 # a0 <- a0 - 2

	move $s1, $t3 
	addi $t3, $t3, -1 # decrease right index

	move $s2, $t1
	addi $t1, $t1, 1 # increase left index

	blt $s0, 1, baseCase
	jal recursion

	mul $s1, $s1, 4
	mul $s2, $s2, 4
	add $s1, $s1, $a1
	add $s2, $s2, $a1

	lw $t4, 0($s1)
	lw $t5, 0($s2)

	sw $t4, 0($s2)
	sw $t5, 0($s1)

	j epilogue

baseCase:
	#just go on

epilogue:
	lw $t0, 0($fp)
	lw $sp, -4($fp)
	lw $ra, -8($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	move $fp, $t0
	jr $ra
