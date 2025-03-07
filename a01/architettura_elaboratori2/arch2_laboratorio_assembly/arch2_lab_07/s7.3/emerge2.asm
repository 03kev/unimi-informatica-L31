	.data
V:	.word 1 2 3 4 5 6 7
k:	.word 7

	.text
	.globl main
main:
	li $s0, 23 # s0 <- i
	li $s1, -4 # s1 <- j

	move $a0, $s0
	move $a1, $s1
	la $a2, V
	lw $a3, k

	jal emerge2

exit:
	li $v0, 10
	syscall


# INPUT
# a0 <- i
# a1 <- j
# a2 <- M[V[0]]
# a3 <- k = length(V)
# OUTPUT
# v0 <- boolean value

emerge2:
	bge $a0, $a3, error # i >= k ?
	bge $a1, $a3, error # j >= k ?

	beq $a0, $a1, equal

	li $t2, 0 # t2 <- counter = 0
	mul $t0, $a0, 4 # i * 4
	mul $t1, $a1, 4 # j * 4
	add $t0, $t0, $a2 # M[V[i]]
	add $t1, $t1, $a2 # M[V[j]]

loop:
	add $t3, $t2, $a2

equal:


error:
	li $v0, 0

back:	
	jr $ra