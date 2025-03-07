	.data
a:	.word 5
s:	.asciiz "Fine"
V:	.word 1 1 1 1 1

	.text
	.globl main
main:
	la $s0, V # M[V[0]]
	lw $s1, a # a

	li $t0, 0
	move $t1, $s0

loop:
	add $t2, $t0, $s1 # t2 <- i + a
	sw $t2, 0($t1)

	addi $t0, $t0, 1
	addiu $t1, $t1, 4

	blt $t0, 5, loop

continue:
	addi $s2, $s0, 12 # s2 <- M[V[3]] penultimo elemento di V
	sw $s2, a

	li $v0, 4
	la $a0, s
	syscall