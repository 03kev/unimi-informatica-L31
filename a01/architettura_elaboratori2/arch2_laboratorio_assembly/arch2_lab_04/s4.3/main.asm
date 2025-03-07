	.data
s1:	.asciiz "Three equal"
s2:	.asciiz "Three different"
s3:	.asciiz "Else"

	.text
	.globl main
main:
	li $a0, 3
	li $a1, 3
	li $a2, 3

	la $t0, equal
	la $t1, different

	addi $sp, $sp, -4
	sw $t0, 0($sp)

	addi $sp, $sp, -4
	sw $t1, 0($sp)

	jal branch3equal

	li $v0, 4
	la $a0, s3
	syscall

	j exit

equal:
	li $v0, 4
	la $a0, s1
	syscall
	
	j exit

different:
	li $v0, 4
	la $a0, s2
	syscall

	j exit

exit:
	li $v0, 10
	syscall