	.data
msgInp:	.asciiz "Insert 3 integers\n"
msgA:	.asciiz "a: "
msgB:	.asciiz "b: "
msgC:	.asciiz "c: "
msgErr:	.asciiz "<comando non riconosciuto>"
	.align 2

V:	.word 0 1 2 3 4 5 6 7 8 9 10 11 12 13
a:	.space 4
b:	.space 4
c:	.space 4

	.text
	.globl main
main:
	la $s0, V
	la $s1, a

	li $v0, 4
	la $a0, msgInp
	syscall

	li $t0, 0 #t0 counter = 0
	la $t1, msgA #t1 <- msgA
	move $t2, $s1 #t2 <- s1 = M[a]

input:
	li $v0, 4
	la $a0, 0($t1)
	syscall

	li $v0, 5
	syscall
	sw $v0, 0($t2)

	addi $t1, $t1, 4 #increase message address
	addi $t2, $t2, 4 #increase variable address
	addi $t0, $t0, 1 #increase counter

	blt $t0, 3, input # loop until input finishes


	lw $t0, 0($s1) #t0 <- a
	mul $t0, $t0, 4
	lw $t1, 4($s1) #t1 <- b
	mul $t1, $t1, 4
	lw $s2, 8($s1) #s2 <- c

	add $t2, $s0, $t0 #t2 <- M[V[a]]
	lw $t3, 0($t2) #t3 <- V[a]

	add $t4, $s0, $t1 #t4 <- M[V[b]]
	lw $t5, 0($t4) #t5 <- V[b]

	beq $s2, 0, case0
	beq $s2, 1, casePlus1
	beq $s2, -1, caseMinus1
	j error

case0:
	sw $t3, 0($t4)
	sw $t5, 0($t2)
	j end

casePlus1:
	sw $t3, 0($t4)
	j end

caseMinus1:
	sw $t5, 0($t2)
	j end

error:
	li $v0, 4
	la $a0, msgErr
	syscall

end:
	li $v0, 10
	syscall
