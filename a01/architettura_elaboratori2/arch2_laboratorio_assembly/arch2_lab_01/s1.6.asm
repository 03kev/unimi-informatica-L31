	.data
h: .word 10
A: .word 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14

	.text
	.globl main
main:
	la $s0, h #load address of h into $s0 
	la $s1, A #load address of A into $s1

	lw $t0, ($s0) #load h into $t0
	#lw $t0, h
	lw $t1, 32($s1) #load A[8] into $t1
	#lw $t1, A+32

	add $t2, $t0, $t1 #t2 <- h + A[8]

	sw $t2, 48($s1) #store t2 into A[12]