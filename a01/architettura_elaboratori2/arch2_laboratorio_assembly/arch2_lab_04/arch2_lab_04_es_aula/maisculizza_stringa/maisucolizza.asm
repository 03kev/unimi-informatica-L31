.globl maiuscolizza
.text
# funzione maisucolizza:
#    parametri: $a0: (codice ASCII di) un carattere
#    returns:  $v0: (codice ASCII de) la sua versione maisucola,
#                    se era una lettera min: altirmenti il carattere stessom
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
      
