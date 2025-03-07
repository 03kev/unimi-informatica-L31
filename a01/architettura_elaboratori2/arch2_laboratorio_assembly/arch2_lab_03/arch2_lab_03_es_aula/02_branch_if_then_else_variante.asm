# variante dell'esercizio 01

.data
eta: .word 17
msg0: .asciiz "sei minorenne\n"
msg1: .asciiz "sei MAGGIORENNE\n"
saluto: .asciiz "ciao"

.text
la $t0 eta   # $t0 è l'indirizzo della "variabile" eta
lw $s0 ($t0) # $s0 è il valore della "variabile" eta

# se (eta < 18) allora esegui il blocco then altrimenti esegui il blocco else
blt $s0 18 then

else:
li $v0 4
la $a0 msg1
syscall
j dopo_if

then:
li $v0 4
la $a0 msg0
syscall

dopo_if:
li $v0 4
la $a0 saluto
syscall
