	.text
	.globl main
main:
	addi $a0, $zero, 11
	addi $a1, $zero, 11

	lui $a2, 0x0040
	ori $a2, $a2, 0x0030

	lui $a3, 0x0040
	ori $a3, $a3, 0x0034

	jal branch
	add $s0, $zero, $v0 # s0 <- v0

	addi $v0, $zero, 1
	add $a0, $zero, $s0
	syscall # print s0

	j exit

T1:
	addi $s1, $zero, 10
T2:
	addi $s1, $zero, 12

exit:
	addi $v0, $zero, 10
	syscall

# INPUT
# a0 <- a
# a1 <- b
# a2 <- T1 
# a3 <- T2
# OUTPUT
# v0 <- indirizzo

branch:
	beq $a0, $a1, equal

	slt $t0, $a0, $a1 # a0 < a1 ? t0 = 1: t0 = 0
	addi $t1, $zero, 1
	beq $t0, $t1, a0less
	j a0more

equal:
	addi $v0, $ra, -8 # M[instruction row 11]
	j back

a0less:
	add $v0, $zero, $a3 # T2
	j back

a0more:
	add $v0, $zero, $a2 # T1
	j back

back:
	jr $ra
