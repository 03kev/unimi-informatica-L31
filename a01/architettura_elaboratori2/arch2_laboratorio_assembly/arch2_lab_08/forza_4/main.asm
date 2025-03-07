	.data #inizializzazione della plancia come array monodimensionale (logicamente mat. 9x7)
plancia: 
	.byte 
	3 0 0 0 0 0 0 0 3 
	3 0 0 0 0 0 0 0 3 
	3 0 0 0 0 0 0 0 3 
	3 0 0 0 0 0 0 0 3 
	3 0 0 0 0 0 0 0 3 
	3 0 0 0 0 0 0 0 3 
	3 3 3 3 3 3 3 3 3
	.globl plancia

	.text
	.globl main

main:
	li $s0 1 
	li $s1 2
	jal disegnaPlancia

	ciclo:#inizio while
			
	seq $s1 $s0 $s1
	addi $s1 $s1 1 #cambiamento player ad ogni iterazione (salvato in s1)
	addi $a0 $s1 0 #s1 -> a0
	jal chiediMossa #chiamata chiedimossa con n giocatore in a0 -> mossa (valida) in $v0

	beq $v0 -1 fine #se $v0 == -1 fine partita

	addi $a0 $v0 0 #chiamata giocaMossa con mossa (n colonna in $a0) n giocatore in $a1 -> valido o no in $v0
	addi $a1 $s1 0
	jal giocaMossa

	jal disegnaPlancia

	#jal checkVittoria
	#controllo vittoria
	beq $v0 1 fine
	beq $v0 2 fine

	j ciclo

	fine:
	jal initPlancia
	j ciclo
