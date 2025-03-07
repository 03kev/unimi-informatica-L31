# Data una variabile età (in RAM), scrivere a schermo
# "sei minorenne" se l'età è minore di 18.
# Poi salutare con un "ciao"

.data
eta: .word 18
msg: .asciiz "sei minorenne\n"
saluto: .asciiz "ciao"


.text
la $t0 eta   # $t0 è l'indirizzo della "variabile" eta
lw $s0 ($t0) # $s0 è il valore della "variabile" eta

# if (eta < 18) then esegui il blocco successivo
# CIOE'
# if (eta >= 18) then non eseguire il blocco successivo
bge $s0 18 dopo_if
li $v0 4
la $a0 msg
syscall

dopo_if:
li $v0 4
la $a0 saluto
syscall
