.globl main
.text

# funzione maisucolizza:
#    parametri: $a0: (codice ASCII de) un carattere
#    returns:  $v0: (codice ASCII de) la sua versione maisucola 
#                   (se era una lettera: altirmenti il carattere stesso)
maiuscolizza:
  # if ($a0>=97 AND $a0>=122) return $a0-32
  #                      else return $a0
     blt $a0 'a' else
     bgt $a0 'z' else
  then:
     addi $v0 $a0 -32
     jr $ra
  else:
     move $v0 $a0
     jr $ra
      
main:
     li $a0 '!'
     jal maiuscolizza
     move $a0 $v0
     li $v0 11
     syscall
  