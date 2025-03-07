# Se l'eta (una variabile in RAM) � inclusa fra 6 e 99 incluso,
# allora si pu� giocare con il LEGO: scrivere a schermo se si puo'

.data
eta: 99
msgSi: .asciiz "puoi giocare con il LEGO"
msgNo: .asciiz "LEGO � proeibito per te"

.text

# Pseudocodice:
# if (eta >= 6 ) AND (eta <= 99) then PUOI else NON PUOI

la $t0 eta   # ora t0 � l'INDIRIZZO di ETA
lw $t0 ($t0) # e ora t0 � il VALORE di ETA

blt $t0 6 else   # Salto ad else se � falsa la prima condizione in AND
bgt $t0 99 else  # ... oppure se � falsa la seconda condizione (De Morgan!)
# then:      # Nota: non ho bisogno di questa etichetta
la $a0 msgSi
j dopo

else:
la $a0 msgNo

dopo:
li $v0 4
syscall

li $v0 10
syscall
