	.text
	.globl main

main:
	lui $t0, 0xffff	
	ori $t0, $t0, 0xffff
	jr $t0		
	addi $v0, $zero, 10
	syscall
