	.data
	.globl V
	.globl H

V:	.space 120 # (30 items)
H:	.word 0

	.space 100 # to not show messagge ascii near array

	.text
	.globl main
main:
	li $a0, 1
	jal insert
	
	li $a0, 2
	jal insert

	li $a0, 3
	jal insert

	li $a0, 4
	jal insert

	li $a0, 5
	jal insert

	li $a0, 6
	jal insert

	li $a0, 7
	jal insert

	li $a0, 4
	jal delete

	li $a0, 8
	jal insert

	li $a0, 9
	jal insert

	li $a0, 4
	jal delete

exit:
	li $v0, 10
	syscall