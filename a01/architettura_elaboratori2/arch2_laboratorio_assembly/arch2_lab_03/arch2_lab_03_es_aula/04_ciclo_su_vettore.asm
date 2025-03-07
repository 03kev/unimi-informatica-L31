# Trova la somma degli stipendi,
# dato il vettore (o array) di stipendi mensili
# Stipendi è un vettore in RAM terminato da -1
# (Il valore -1 è il terminatore, o elemento guardia:
#  non è un elemento dell'array ma segnala la fine dell'array)


.data
stipendi: .word 50 12 40 5 0 13  -1

.text

li $s0 0   # $s0 è l'indice dell'array
li $s1 0   # $s1 è il totale (parziale)

ciclo:
la $t0 stipendi
sll $t1 $s0 2   # $t1 = $s0*4
add $t0 $t0 $t1 # $t0 = $t0 + $s0*4. quindi $t0 è l'indizzo di stipendi[i]
lw $t2 ($t0)    # $t2 = stipendi[i]

beq $t2 -1 fineCiclo  # if ($t2 ==-1) then break;
add $s1 $s1 $t2
addi $s0 $s0 1
j ciclo

fineCiclo:

li $v0 1
move $a0 $s1
syscall
li $v0 10
syscall