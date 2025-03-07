.data

ciao: .asciiz "ciao!"

.text

main:
   jal saluta   
   jal saluta   
   jal saluta   

   li $v0 10
   syscall


saluta:
   la $a0 ciao
   li $v0 4
   syscall
   jr $ra


	