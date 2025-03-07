#Input: a0 <- column = (1, 7)
#		a1 <- player = 1, 2
#Output: v0 <- boolean (is move valid?)

	.text
	.globl giocaMossa
giocaMossa:
	la $t0, plancia # M[v]
	addi $t6, $t0, 52 # index of last playable cell

	bgt $a0, 7, giocaMossa_invalid # a0 > 7 ? invalid out of range
	blt $a0, 1, giocaMossa_invalid # a0 < 1 ? invalid out of range

	add $t2, $t0, $a0 # t2 <- M[v[column_top]]
	lb $t3, 0($t2) # t3 <- v[column_top]
	bne $t3, 0, giocaMossa_invalid # v[column_top] == 0 ? invalid column full

	li $t5, 7
	sub $t5, $t5, $a0 # t5 <- offset = 7 - column_index
	sub $t5, $t6, $t5 # t5 <- max_index - offset = M[last_item_in_column_index]

	lb $t4, 0($t5)

giocaMossa_loop:
	lb $t4, 0($t5)
	addi $t5, $t5, -9

	bne $t4, 0, giocaMossa_loop

	sb $a1, 9($t5)
	li $v0, 0 # v0 <- valid (column empty)

	j giocaMossa_exit

giocaMossa_invalid:
	li $v0, 1 # v0 <- 0 invalid (column full or out of range)
	j giocaMossa_exit

giocaMossa_exit:
	jr $ra