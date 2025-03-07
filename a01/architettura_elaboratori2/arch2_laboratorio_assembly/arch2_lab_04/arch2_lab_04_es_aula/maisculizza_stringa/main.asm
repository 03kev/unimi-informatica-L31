.globl main
.data
string: .asciiz "Voligimi in maiuscolo, PER favore!"

.text
main:
     la $t0 string
 ciclo:
     lb $a0 ($s0)
     addi $s0 $s0 1
     beqz $a0 fineciclo
     jal maiuscolizza
     # ora in $v0 c'è la versione maiuscola del carattere letto
     sb $v0 -1($s0)
     j ciclo
 fineciclo:
     la $a0 string
     li $v0 4
     syscall
     
     li $v0 10
     syscall