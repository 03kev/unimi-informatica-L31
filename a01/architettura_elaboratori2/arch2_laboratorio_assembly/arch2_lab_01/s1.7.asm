	.data
A: .space 400 # 400 bytes for 100 integers of 32 bits
B: .space 100
C: .word 2
i: .word 3

	.text
	.globl main
main:
	la $s0, A
	la $s1, B
	la $s2, C
	la $s3, i

	#inizializzazione B[i] = 10
	lw $t0, ($s3) #t0 <- i
	#lw $t0, i
	mul $t1, $t0, 4 #i * 4
	add $t0, $t1, $s1 #t0 <- i*4 + M[B[0]]

	li $t2, 10 #t2 <- 10
	sw $t2, ($t0) #B[i] = 10 in memoria

	lw $t3, ($t0) #t3 <- B[i]
	lw $t4, ($s2) #t4 <- C
	add $t0, $t3, $t4 #t0 <- B[i]+C
	addi $t0, $t0, 5 #t0 <- t0+5

	sw $t0, 396($s0) #A[99] <- t0

# A[99] = 5 + B[i] + C