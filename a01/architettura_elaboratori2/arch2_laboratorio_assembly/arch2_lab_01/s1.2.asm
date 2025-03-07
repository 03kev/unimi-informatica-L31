	.text
	.globl main
main:
	li $s0, 100
	li $s1, 45

	mult $s0, $s1
	mflo $t0 # t0 = s0 * s1 (parte bassa)

	div $s0, $s1
	mflo $t1 # t1 = s0 / s1 (quoziente)
	mfhi $t2 # t2 = s0 % s1 (resto)