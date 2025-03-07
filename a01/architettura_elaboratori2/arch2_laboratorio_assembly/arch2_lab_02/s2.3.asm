	.text
	.globl main
main:
	
	# 1 * 3
	li $s0, 3
	li $t0, 1
	mult $t0, $s0
	mflo $t0

	addi $sp, $sp, -4
	sw $t0 0($sp) #push

	# 2 * 3
	li $t0, 2
	mult $t0, $s0
	mflo $t0
	
	lw $s0, 0($sp)
	addi $sp, $sp, 4 #pop

	add $s0, $s0, $t0
	addi $sp, $sp, -4
	sw $s0, 0($sp) #push

	# 3 * 3
	li $s0, 3
	li $t0, 3
	mult $t0, $s0
	mflo $t0

	lw $s0, 0($sp)
	addi $sp, $sp, 4 #pop

	add $s0, $s0, $t0 #s0 <- total sum
	
	li $v0, 10 #exit
	syscall