	.data
	.globl stack
	.globl stack_n
	.globl free_space
stack:		.word 0 
stack_n:	.word 0
free_space:	.word 0

	.text
	.globl main
main:
	li $a0, 10
	li $a1, 11
	li $a2, 12
	jal push

	li $a0, 20
	li $a1, 21
	li $a2, 22
	jal push

	jal pop

	li $a0, 30
	li $a1, 31
	li $a2, 32
	jal push

	li $a0, 40
	li $a1, 41
	li $a2, 42
	jal push

	jal pop

	jal pop

	li $a0, 50
	li $a1, 51
	li $a2, 52
	jal push

	li $a0, 60
	li $a1, 61
	li $a2, 62
	jal push

	li $a0, 70
	li $a1, 71
	li $a2, 72
	jal push

	li $a0, 80
	li $a1, 81
	li $a2, 82
	jal push

	jal pop

	li $a0, 90
	li $a1, 91
	li $a2, 92
	jal push

	li $a0, 100
	li $a1, 101
	li $a2, 102
	jal push

	jal print

exit:
	li $v0, 10
	syscall