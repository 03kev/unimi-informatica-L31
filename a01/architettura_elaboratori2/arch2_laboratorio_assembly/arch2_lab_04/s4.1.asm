	.data
msgIn:	.asciiz "Inserire due operandi\n"
msgA:	.asciiz "a: "
msgB:	.asciiz "b: "
msgOp:	.asciiz "Inserire operatore: 1) + 2) - 3) * 4) / \n"
msgRis:	.asciiz "Risultato: "
msgRes:	.asciiz ", con resto: "
msgErr:	.asciiz "<codice operatore non riconosciuto>"

	.text
	.globl main
main:
	#input
	li $v0, 4
	la $a0, msgIn
	syscall

	li $v0, 4
	la $a0, msgA
	syscall

	li $v0, 5
	syscall
	move $s0, $v0 #s0 <- a

	li $v0, 4
	la $a0, msgA
	syscall

	li $v0, 5
	syscall
	move $s1, $v0 #s1 <- b

	li $v0, 4
	la $a0, msgOp
	syscall

	li $v0, 5
	syscall
	move $s2, $v0 #s2 <- o

	move $a0, $s0
	move $a1, $s1
	move $a2, $s2

	jal elaboratore

	move $t0, $v0 #result of procedure

	li $v0, 4
	la $a0, msgRis
	syscall

	li $v0, 1
	move $a0, $t0
	syscall

	bne $s2, 4, exit

	beq $v1, 0, exit

	li $v0, 4
	la $a0, msgRes
	syscall

	li $v0, 1
	move $a0, $v1
	syscall

	j exit

exit:
	li $v0, 10
	syscall #exit


elaboratore:
	beq $a2, 1, add
	beq $a2, 2, sott
	beq $a2, 3, molt
	beq $a2, 4, div

	li $v0, 4
	la $a0, msgErr
	syscall

	j exit

add:
	add $v0, $a0, $a1
	j end

sott:
	sub $v0, $a0, $a1
	j end

molt:
	mul $v0, $a0, $a1
	j end

div:
	div $a0, $a1
	mflo $v0
	mfhi $v1
	j end

end:
	jr $ra