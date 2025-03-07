	.data
A: .word -1 -1 1 4
B: .word -1 6 -1 -1
c: .word 2

	.text
	.globl main
main:
	la $s0, A
	la $s1, B
	lw $s2, c #loading c

	# c*(B[A[c]])
	mul $t0, $s2, 4 #c*4
	add $t0, $t0, $s0 #address of A[c]
	lw $t1, 0($t0) #loading A[c]

	mul $t2, $t1, 4 #A[c]*4
	add $t2, $t2, $s1 #address of B[A[c]]
	lw $t2, 0($t2) #loading B[A[c]]

	add $t2, $t2, $s2 #t2 <- B[A[c]] + c
	mul $t3, $t2, $s2 #t3 <- c*(B[A[c]] + c)

	#A[2*c-1]
	mul $t2, $s2, 2 #t2 <- 2*c
	addi $t2, $t2, -1 #t2 <- 2*c-1
	mul $t2, $t2, 4 #(2*c-1)*4 bytes
	add $t2, $t2, $s0 #address of A[2*c-1]
	lw $t4, 0($t2) #loading A[2*c-1]

	#NUM / DEN
	div $t5, $t3, $t4 #t5 <- t3/t4

	addi $t0, $t0, -4 #M[A[c]] - 4 = address of A[c-1]
	sw $t5, 0($t0) #storing A[c-1]

# A[c-1] = c*(B[A[c]] + c)/A[2*c-1]