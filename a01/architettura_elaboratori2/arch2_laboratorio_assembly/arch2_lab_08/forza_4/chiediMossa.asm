### Forza 4 con il resto della classe
# My Role: function chiediMossa

.globl chiediMossa

.data
stringa: .asciiz "Dato non valido\n"
fine: .asciiz "Fine Partita\n"
richiesta: .asciiz "Inserire la mossa del giocatore "
fineRichiesta: .asciiz ": "

.text
chiediMossa:

	move $t0 $a0 # $t0 = giocatore

read: 	
	
	li $v0 4
	la $a0 richiesta
	syscall
	
	li $v0 1
	move $a0 $t0
	syscall
	
	li $v0 4
	la $a0 fineRichiesta
	syscall
	
	li $v0 12 # Read Character
	syscall
	
	beq $v0 'f' finePartita
	
	sub $v0 $v0 '0'
	bgt $v0 7 errore
	blt $v0 1 errore
	
	la $t1 plancia # Carico l'indirizzo di plancia
	add $t1 $t1 $v0
	lb $t2 ($t1) # Carico in t2 lo stato della cella richiesta dal giocatore
	
	bgt $t2 0 errore
	
	move $a0 $t2
	jr $ra
	
errore:	
	li $v0 4
	la $a0 stringa
	syscall
	j read
	
finePartita: 
	li $v0 4
	la $a0 fine
	syscall

	li $v0 -1
	jr $ra