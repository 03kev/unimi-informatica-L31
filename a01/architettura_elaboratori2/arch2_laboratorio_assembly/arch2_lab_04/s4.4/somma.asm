#############################
# INPUT						#
# a0 = length of array		#
# a1 = address of array[0]	#
# a2 = k parameter			#
#############################
# OUTPUT					#
# v0 = sum of evens or odds #
#############################

	.text
	.globl somma
somma:
	li $t0, 0 # sum
	
	beq $a2, 0, dispari
	li $t1, 0 # counter for even numbers

pari:
	lw $t2, 0($a1)
	add $t0, $t0, $t2
	addi $a1, $a1, -8
	addi $t1, $t1, 2
	blt $t1, $a0, pari
	j exit

dispari:
	add $a1, $a1, -4 # start from array[1]
	li $t1, 1 # counter for odd numbers
loop:
	lw $t2, 0($a1)
	add $t0, $t0, $t2
	addi $a1, $a1, -8
	addi $t1, $t1, 2
	blt $t1, $a0, loop
	j exit

exit:
	move $v0, $t0
	jr $ra