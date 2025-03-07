# dato un vettore di voti terminato da zero,
# scrivere a schermo il numero di voti sufficienti 
# (maggiori o uguali a 18)

.data

voti: .word 20 16 25 30 6 18 21 7 0

.text
la $s0 voti # $s0 è l'indirizzo del voto da leggere nel ciclo
li $s1 0   # $s1 è il numero di esami sufficienti (>=18)

ciclo:
lw $t8 ($s0)  # $t8 = voti[i]
addi $s0 $s0 4  # passa al prossimo elemento incrementando l'indirizzo
beqz $t8 fineCiclo

#         if (voti[i]>=18) then $s1 ++ 
# CIOE':  
#         if (voti[i] < 18 ) continue; 
#         s1++
blt $t8 18 ciclo
addi $s1 $s1 1
j ciclo

fineCiclo:
li $v0 1
move $a0 $s1
syscall
li $v0 10
syscall