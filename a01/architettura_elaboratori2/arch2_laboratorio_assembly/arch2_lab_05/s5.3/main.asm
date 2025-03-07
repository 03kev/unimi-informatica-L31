	.data
V:	.word 4 5 1 3 5 7 -10 13 -1 0 -2
N:	.word 11
space:	.asciiz " "

	.text
	.globl main
main: 
	la $t0, N
	lw $s0, 0($t0) # s0 <- N
	la $s1, V # s1 <- M[V]

	move $a0, $s0
	move $a1, $s1
	jal sort

	move $a0, $s0
	move $a1, $s1
	jal print

exit:
	li $v0, 10
	syscall


#################
# INPUT			# 
# a0 <- N		#
# a1 <- M[V]	#
# OUTPUT 		#
# indexOfMax(V)	#
#################
findMax:
	move $t4, $a1
	lw $t0, 0($a1) # t0 <- V[0]
	li $t3, 0 # index of max
	li $t1, 0 # counter

	beq $a0, 1, continue # if we have an array of 1 item, return it

iteration:
	addi $t4, $t4, 4 # address of next item
	lw $t2, 0($t4)
	addi $t1, $t1, 1 # counter ++
	
	bge $t0, $t2, continue # if t0 >= t2 then skip updateMax

updateMax:
	move $t0, $t2
	move $t3, $t1
	
continue:
	add $t5, $t1, 1 # the counter should start from 1, so we add the +1 here
	blt $t5, $a0, iteration

	move $v0, $t3
	jr $ra


#################
# INPUT			# 
# a0 <- N		#
# a1 <- M[V]	#
# RESULT 		#
# V sorted	 	#
#################
sort: 
	move $t0, $fp
	addi $fp, $sp, -4
	sw $t0, 0($fp)
	sw $sp, -4($fp)
	sw $ra, -8($fp)
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	sw $s4, -28($fp)
	sw $s5, -32($fp)
	addi $sp, $fp, -28

	move $s0, $a0 # N
	move $s1, $a1 # M[V]

	li $s2, 0 # counter

loop:
	addi $s2, $s2, 1
	jal findMax
	move $s3, $v0

	addi $a0, $a0, -1 # n - i
	
	lw $s4, 0($a1)
	mul $t1, $s3, 4 # maxIndex * 4
	add $t1, $t1, $a1 # M[v[i:] + maxIndex]
	lw $s5, 0($t1)

	sw $s4, 0($t1)
	sw $s5, 0($a1)

	addi $a1, $a1, 4 # M[v[i:]]

	blt $s2, $s0, loop

	lw $t0, 0($fp)
	lw $sp, -4($fp)
	lw $ra, -8($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $s4, -28($fp)
	lw $s5, -32($fp)
	move $fp, $t0
	jr $ra


#################
# INPUT			# 
# a0 <- N		#
# a1 <- M[V]	#
# RESULT 		#
# Print V	 	#
#################
print:
	li $t0, 0 # counter
	move $t2, $a0

loop2:
	lw $t1, 0($a1) 

	li $v0, 1
	move $a0, $t1
	syscall

	li $v0, 4
	la $a0, space
	syscall

	addi $t0, $t0, 1
	addi $a1, $a1, 4

	blt $t0, $t2, loop2

	jr $ra