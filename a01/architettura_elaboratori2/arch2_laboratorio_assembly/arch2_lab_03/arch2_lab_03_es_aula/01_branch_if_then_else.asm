# Questa volta, vogliamo scrivere a schermo "sei minorenne" 
# oppure "sei Maggiorenne" (if-then-else)

.data
eta: .word 17
msg0: .asciiz "sei minorenne\n"
msg1: .asciiz "sei MAGGIORENNE\n"
saluto: .asciiz "ciao"

.text
la $t0 eta   # $t0 è l'indirizzo della "variabile" eta
lw $s0 ($t0) # $s0 è il valore della "variabile" eta

#  if (età < 18) then write(msg0) else write(msg1);
# Riscritto come
#  se NON è vero che (eta < 18), cioè se eta >= 18, 
#  allora esegui il blocco else altrimenti esegui il blocco then
bge $s0 18 else

then:
li $v0 4
la $a0 msg0
syscall
j dopo_if

else:
li $v0 4
la $a0 msg1
syscall

dopo_if:
li $v0 4
la $a0 saluto
syscall
