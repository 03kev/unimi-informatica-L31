	.data
msgV:	.asciiz "Insert integer V: "
msgN:	.asciiz "Insert integer N: "
msgOut:	.asciiz "The sum is: "
msgBr:	.asciiz "<break>\n"

	.text
	.globl main
main:

	# V -> s0
	li $v0, 4
	la $a0, msgV
	syscall

	li $v0, 5
	syscall
	move $s0, $v0

	# N -> s1
	li $v0, 4
	la $a0, msgN
	syscall

	li $v0, 5
	syscall
	move $s1, $v0

	move $s2, $s0 #s2 <- sum = V
	li $t1, 1 #t1 <- i = 1

loop:
	bge $t1, $s1, end

	mul $t2, $t1, $t1 #t2 <- i^2
	rem $t3, $t2, $s0 #t3 <- i^2 % V
	beqz $t3, break

	add $s2, $s2, $t2 #sun += i^2
	addi $t1, $t1, 1 #i++

	j loop

break:
	li $v0, 4
	la $a0, msgBr
	syscall

end:
	li $v0, 4
	la $a0, msgOut
	syscall

	li $v0, 1
	move $a0, $s2
	syscall