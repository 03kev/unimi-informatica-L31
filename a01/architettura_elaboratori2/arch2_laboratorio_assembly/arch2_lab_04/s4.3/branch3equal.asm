# INPUT
# a0, a1, a2 three integers
# on the stack: two jump addresses
# NO OUTPUT

	.text
	.globl branch3equal
branch3equal:
	
	lw $t0 0($sp)
	add $sp, $sp, 4

	lw $t1 0($sp)
	add $sp, $sp, 4

	beq $a0, $a1, eq1

	beq $a1, $a2, back
	beq $a0, $a2, back
	jr $t0 #three different

eq1:
	beq $a1, $a2, eq2
	j back
eq2:
	beq $a0, $a2, eq3
	j back
eq3:
	jr $t1 #three equal
	
back:
	jr $ra