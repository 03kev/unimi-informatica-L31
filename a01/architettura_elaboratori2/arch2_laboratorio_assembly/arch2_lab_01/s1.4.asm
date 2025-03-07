	.text
	.globl main
main:
	# A = B*C/(D+E)

	li $s1, 4 #B
	li $s2, 3 #C
	li $s3, 2 #D
	li $s4, 1 #E

	add $t0, $s3, $s4 #D+E
	mul $t1, $s1, $s2 #B*C
	div $s0, $t1, $t0 #A = B*C/(D+E)