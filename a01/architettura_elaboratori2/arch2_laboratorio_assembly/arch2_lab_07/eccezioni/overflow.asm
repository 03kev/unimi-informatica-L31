		.text
		.globl main
	main:

		lui $t0, 0x8000
		lui $t1, 0x8000
		add $t2, $t0, $t1
		addi $t3, $t2, -100
		addi $v0, $zero, 10
		syscall
