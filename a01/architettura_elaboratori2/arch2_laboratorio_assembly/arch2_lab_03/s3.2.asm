	.data
msgA: .asciiz "Insert integer a: "
msgB: .asciiz "Insert integer b: "
msgC: .asciiz "Insert integer c: "
msgZ: .asciiz "The result z is: "
err:  .asciiz "error"

	.text
	.globl main
main:

	#a
	li $v0, 4
	la $a0, msgA
	syscall

	li $v0, 5
	syscall
	move $s0, $v0

	#b
	li $v0, 4
	la $a0, msgB
	syscall

	li $v0, 5
	syscall
	move $s1, $v0

	#c
	li $v0, 4
	la $a0, msgC
	syscall

	li $v0, 5
	syscall
	move $s2, $v0

if:
	blt $s0, $s1, else #a < b
	beq $s2, $zero, else #c == 0

then:
	add $t0, $s0, $s1 #a+b
	mul $t1, $t0, $s2 #c(a+b)

	li $v0, 4
	la $a0, msgZ
	syscall

	li $v0, 1
	move $a0, $t1
	syscall #print int

	j end

else:
	li $v0, 4
	la $a0, err
	syscall

end:
	li $v0, 10
	syscall #exit