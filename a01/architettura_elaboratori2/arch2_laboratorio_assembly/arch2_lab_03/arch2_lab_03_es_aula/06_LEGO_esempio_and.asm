# Se l'eta (una variabile in RAM) è inclusa fra 6 e 99 incluso,
# allora si può giocare con il LEGO: scrivere a schermo se si puo'

.data
eta: 99
msgSi: .asciiz "puoi giocare con il LEGO"
msgNo: .asciiz "LEGO è proeibito per te"

.text

# Pseudocodice:
# if (eta >= 6 ) AND (eta <= 99) then PUOI else NON PUOI

la $t0 eta   # ora t0 è l'INDIRIZZO di ETA
lw $t0 ($t0) # e ora t0 è il VALORE di ETA

blt $t0 6 else   # Salto ad else se è falsa la prima condizione in AND
bgt $t0 99 else  # ... oppure se è falsa la seconda condizione (De Morgan!)
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
