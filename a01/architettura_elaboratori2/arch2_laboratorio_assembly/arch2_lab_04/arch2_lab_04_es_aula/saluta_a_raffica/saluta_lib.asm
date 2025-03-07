.data
.globl saluta
.globl salutaQualcuno

ciao: .asciiz "ciao "
ciaoFinale: .asciiz "!!\n"

.text

# funzione saluta:
#   nessun parametro. Saluto generico.
saluta:
   la $a0 ciao
   li $v0 4
   syscall
   jr $ra
   
# funzione salutaQualcuno
# argomenti:
#   $a0: indirizzo della stringa che contiene 
#        il nome della persona da salutare
salutaQualcuno:
   move $t0 $a0
   
   la $a0 ciao
   li $v0 4
   syscall
   
   move $a0 $t0
   li $v0 4
   syscall

   la $a0 ciaoFinale
   li $v0 4
   syscall
   
   jr $ra



