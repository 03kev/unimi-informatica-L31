	.data
plancia:	.byte 3 0 0 0 0 0 0 0 3
		.byte 3 0 0 0 0 0 0 0 3
		.byte 3 0 0 0 0 0 0 0 3
		.byte 3 0 0 0 0 0 0 0 3
		.byte 3 0 0 0 0 0 0 0 3
		.byte 3 0 0 0 0 0 0 0 3
		.byte 3 3 3 3 3 3 3 3 3

.text
.globl disegnaPlancia

disegnaPlancia:
	add $t0 $zero $zero	#contatore linea
		
loop:	beq $t0 7 break
	
	add $t1 $zero $zero	#contatore colonna
	
loop2:	beq $t1 9 postloop2

	mul $t9 $t0 9
	add $t9 $t9 $t1		#offset
	
	lb $t2 plancia($t9)	#carattere
	
	beq $t2 0 vuoto
	beq $t2 1 giocatore1
	beq $t2 2 giocatore2
	beq $t2 3 pieno
	
vuoto:	li $a0 '.'		#seleziona simbolo
	j print
giocatore1:	li $a0 'X'
		j print
giocatore2:	li $a0 'O'
		j print
pieno:	li $a0 '#'
	j print
	
print:	li $v0 11
	syscall
	addi $t1 $t1 1		#aumenta contatore colonna
	j loop2			#prossima colonna

postloop2:
	add $t0 $t0 1		#aumenta contatore linea
	li $a0 '\n'		#vai a capo
	li $v0 11
	syscall
	j loop			#prossima linea

break:
	jr $ra

	
