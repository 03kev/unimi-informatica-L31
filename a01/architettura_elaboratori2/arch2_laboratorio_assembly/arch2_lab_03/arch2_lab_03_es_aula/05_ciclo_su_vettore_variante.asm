.data
stipendi: .word 1 1 2 3 1 1  -1

.text

	la $s0 stipendi  # $s0 = l'indirizzo dell'elemento 
	                 #       corrente di stipendi (per ora, stipendi[0])
	li $s1 0         # $s1 = il totale (parziale): per ora, zero

ciclo:
	lw $t2 ($s0)          # $t2 = stipendi[i] 

	beq $t2 -1 fineCiclo  # if ($t2 ==-1) then break;
	add $s1 $s1 $t2       # totale += $t2
	addi $s0 $s0 4        # passo all'inidirzzo dell'elemento successivo (4 byte oltre)
	j ciclo               # prossima iterazione

fineCiclo:

	li $v0 1
	move $a0 $s1
	syscall
	li $v0 10
	syscall