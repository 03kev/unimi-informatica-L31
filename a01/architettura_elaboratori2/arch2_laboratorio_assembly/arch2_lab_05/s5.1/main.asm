	.text
	.globl main
main:
	li $a0, 10
	li $a1, 10

	jal product
	move $s0, $v0

	li $v0, 1
	move $a0, $s0
	syscall

	j exit

exit:
	li $v0, 10
	syscall


#####################
# INPUT				#
# a0, a1 integers	#
#####################
# OUTPUT			#
# v0 sum a+b		#
#####################
sum:
	add $v0, $a1, $a2
	jr $ra

#####################
# INPUT				#
# a0, a1 integers	#
#####################
# OUTPUT			#
# v0 product a+b	#
#####################
product:
	move $t0, $fp
	addi $fp, $sp, -4
	sw $t0, 0($fp)
	sw $sp, -4($fp)
	sw $ra, -8($fp)
	addi $sp, $fp, -8

	move $t3, $a0
	move $t4, $a1
	li $t1, 0 # partial product
	li $t2, 0 # counter
	ble $a0, $a1, a1bigger #a0 <= a1

a0bigger:
	move $a0, $t3
	move $a1, $t3
loop0:
	jal sum
	addi $t2, $t2, 1
	add $t1, $t1, $v0
	blt $t2, $t4, loop0
	
	j continue 

a1bigger:
	move $a0, $t4
	move $a1, $t4
loop1:
	jal sum
	addi $t2, $t2, 1
	add $t1, $t1, $v0
	blt $t2, $t3, loop1
	
	j continue 

continue:
	move $v0, $t1

	lw $t0, 0($fp)
	lw $sp, -4($fp)
	lw $ra, -8($fp)
	move $fp, $t0
	jr $ra